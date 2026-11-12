# RabbitMQ

- [RabbitMQ](#rabbitmq)
  - [Зачем](#зачем)
  - [Плюсы и минусы](#плюсы-и-минусы)
  - [Функции](#функции)
    - [Exchange Обменник](#exchange-обменник)
    - [Режимы доставки сообщений](#режимы-доставки-сообщений)
  - [Паттерны](#паттерны)
    - [Queue](#queue)
    - [Connection](#connection)
    - [Persistence](#persistence)
    - [Версионирование типов сообщений](#версионирование-типов-сообщений)
  - [Security](#security)
  - [Observability](#observability)
  - [Performance](#performance)
  - [Технологии](#технологии)

## Зачем

Реализация [паттерна интеграции](../../../../arch/pattern/integration/pattern.integration.md) [Message Broker](../../../../arch/pattern/integration/app/pattern.messagebroker.md) в [Event Driven Architecture (EDA)](../../../../arch/style/dsa/eda.md).

[Критерии выбора Kafka vs RMQ](../../../../arch/pattern/integration/app/pattern.messagebroker.md#критерии-выбора).

## Плюсы и минусы

Плюсы:

- «Продажа» [Производительность](https://habr.com/ru/company/oleg-bunin/blog/310418/)
- RabbitMQ дает гарантии __одноразовой доставки__ и __хотя бы одной доставки__, но не __ровно одной доставки__
- Управление временем обработки сообщений (контроль истечения срока действия сообщения TTL или задержки сообщения)
- Расширенные возможности __обработки ошибок__ в случаях, когда потребители с большей вероятностью не смогут обработать сообщения (временно или навсегда).
- Расширенные и __гибкие правила маршрутизации__
- Упрощенная реализация потребителей Consumer
- __Приоритет__ сообщений

Минусы:

- Агрегации сообщений в __пачки batch нет__ в RabbitMQ ([vs Kafka](../../../../arch/pattern/integration/app/pattern.messagebroker.md#rmq-vs-kafka))
- Нет параметра Expire для обменников (только для очередей)
- Производительность ниже чем [Kafka](../kafka/kafka.md)
- Отказоустойчивость ниже, __нет шардирования__ чем в kafka (есть topic-несколько partition, есть несколько инстансов где очереди размещены)

## Функции

### Exchange Обменник

- Типы
  - __Headers__
    - Message is sent to the queues which match the headers.
    - Routing key should not be set. Но если установлены, то можно биндить очередь и по RK.
    - Match type should indicate if [ALL](https://thewebland.net/development/devops/rabbitmq/exchanges-routing-kyes-and-bindingi/) (логичекое И) or [ANY (логичекое ИЛИ) header must match](https://codedestine.com/rabbitmq-headers-exchange/)
  - [__Direct__](https://habr.com/ru/post/489086/) - message is sent to a named exchange, __routing key__ is specified so information only reaches the queues matching the pattern
  - __Topic__ - Routing key is a string separated by dots and wildcards. E.g.: "ro.alexandrugris.*"
  - [__Fanout__](https://thewebland.net/development/devops/rabbitmq/exchanges-routing-kyes-and-bindingi/)
- [__Exchange-to-Exchange (E2E)__](https://habr.com/ru/articles/489086/)

### Режимы доставки сообщений

- Basic.get (__Pull__) - Доставка единичного сообщения по запросу
- Basic.Consume (__Push__) - Подписка на очередь (постоянный мониторинг очереди с доставкой всех сообщений)
- QoS(prefetchCount) [Get vs consume](https://habr.com/ru/post/153431/)
- <http://onreader.mdl.ru/RabbitMQInDepth/content/Ch05.html>

## Паттерны

- [VHosts](rmq.vhost.md)
- [Failure](rmq.failure.md)
- [Очереди с приоритетом](https://habr.com/ru/companies/arcadia/articles/571442/)
- [RabbitMQ Delayed Message Plugin](https://www.gokhan-gokalp.com/en/messaging-yapilarinda-masstransit-ile-error-ve-redeliver-handling/)
- Scheduling messages using Quartz.Net
- [Паттерны интеграции](rmq.patterns.integration.md)
- MTA [MQ](../../../../arch/pattern/system.design/mta/mta.mq.md)

### Queue

- [Keep your queue short (if possible)](https://www.cloudamqp.com/blog/part1-rabbitmq-best-practice.html)
- Limit queue size with TTL or max-length

### Connection

- 1 Соединение connection на процесс-поток
- Х каналов channel на каждый поток (не шарить каналы между потоками)
- На 1 канале channel может быть несколько получателей Consumer из очередей
- [Отдельные соединения для publisher\consumer](https://www.cloudamqp.com/blog/part1-rabbitmq-best-practice.html#connections-and-channels)

### Persistence

- По умолчанию при остановке или падении сервера RabbitMQ все очереди и сообщения теряются, но это поведение можно изменить. Для того чтобы сообщения оставались в очереди после перезапуска сервера, необходимо:
  - сделать как очереди __durable__
  - так и сообщенния устойчивыми __delivery_mode=2__
- TTL Очереди

### Версионирование типов сообщений

- по [message type](http://rabbitmq.github.io/rabbitmq-dotnet-client/api/RabbitMQ.Client.IBasicProperties.html#RabbitMQ_Client_IBasicProperties_Type) serialize, deserialize _с отдельными очередями?_
  - [masstransit](https://masstransit-project.com/architecture/versioning.html)
    - [message versioning](https://bartwullems.blogspot.com/2021/10/masstransitmessage-versioning.html)
  - [EasyNetQ](https://github.com/EasyNetQ/EasyNetQ/wiki/Versioning-Messages)
  - [NServiceBus](https://docs.particular.net/samples/versioning/)

## Security

[Security mechanism](https://stackoverflow.com/questions/7840283/how-can-queues-be-made-private-secure-in-rabbitmq-in-a-multitenancy-system) in RabbitMQ:

- [Access control](https://www.rabbitmq.com/access-control.html)
  - Vhosts
  - each user should be permissioned to only read and write to their own queue based on the queue's unique name.
- SASL authentication
  - supports multiple SASL authentication mechanisms. There are three such mechanisms built into the server: PLAIN, AMQPLAIN, and RABBIT-CR-DEMO, and one — EXTERNAL — available as a plugin.
- SSL support

## Observability

- Мониторинг [кол-ва сообщений в очереди](https://wtfm.info/zabbix-rabbutmq-автообнаружение-очередей/) через API и CLI в Zabbix
  - [Расширенный](https://github.com/jasonmcintosh/rabbitmq-zabbix)
  - [](https://signoz.io/blog/rabbitmq-monitoring/)
- мониторинг [кластера, нод, обменников, очередей](https://www.rabbitmq.com/prometheus.html) через Prometheus + Grafana

## Performance

- [RabbitMQ sharding](https://github.com/rabbitmq/rabbitmq-sharding)
- [Top metric](https://www.datadoghq.com/blog/rabbitmq-monitoring/)
- Docker [perf test](https://rabbitmq.github.io/rabbitmq-perf-test/stable/htmlsingle/)
- [Журнал трассировки сообщений](https://russianblogs.com/article/59013453419/)
- [Perf Test](https://rabbitmq.github.io/rabbitmq-perf-test/stable/htmlsingle/)

## Технологии

- [MassTransit (RabbitMQ) в ASP.NET Core](https://habr.com/ru/articles/758938/)
- EasyNetQ
- NServiceBus
