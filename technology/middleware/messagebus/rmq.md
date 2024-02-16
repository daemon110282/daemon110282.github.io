# RabbitMQ

- [RabbitMQ](#rabbitmq)
  - [Функции](#функции)
    - [Режимы доставки сообщений](#режимы-доставки-сообщений)
  - [Паттерны](#паттерны)
    - [Task (Worker) Queue](#task-worker-queue)
    - [Simple one-way messaging](#simple-one-way-messaging)
    - [Publish-subscribe Издатель-Подписчик](#publish-subscribe-издатель-подписчик)
    - [RPC (команды)](#rpc-команды)
    - [Direct Reply-TO](#direct-reply-to)
    - [MTA](#mta)
    - [headers vs topic для событий](#headers-vs-topic-для-событий)
    - [Версионирование сообщений](#версионирование-сообщений)
  - [Security](#security)
  - [Observability](#observability)
    - [Performance](#performance)

## Плюсы и минусы

Плюсы:

- [«Продажа» Производительность](https://habr.com/ru/company/oleg-bunin/blog/310418/)
- RabbitMQ дает гарантии __одноразовой доставки__ и __хотя бы одной доставки__, но не __ровно одной доставки__

Минусы: 

- Агрегация в пачки нет в RabbitMQ (Kafka Есть)
- [vs Kafka](https://habr.com/ru/company/itsumma/blog/416629/)

## Функции

### Exchange Обменник

- Типы
  - __headers__
    - Message is sent to the queues which match the headers. 
    - Routing key should not be set. Но если установлены, то можно биндить очередь и по RK.
    - Match type should indicate if [ALL](https://thewebland.net/development/devops/rabbitmq/exchanges-routing-kyes-and-bindingi/) (логичекое И) or [ANY (логичекое ИЛИ) header must match](https://codedestine.com/rabbitmq-headers-exchange/)
  - [__direct__](https://habr.com/ru/post/489086/) - message is sent to a named exchange, __routing key__ is specified so information only reaches the queues matching the pattern
  - __topic__ - Routing key is a string separated by dots and wildcards. E.g.: "ro.alexandrugris.*"
  - [__fanout__](https://thewebland.net/development/devops/rabbitmq/exchanges-routing-kyes-and-bindingi/)
- [__Exchange-to-Exchange (E2E)__](https://habr.com/ru/articles/489086/)

### Режимы доставки сообщений

- Basic.get (__Poll__) - Доставка единичного сообщения по запросу
- Basic.Consume (__Push__) - Подписка на очередь (постоянный мониторинг очереди с доставкой всех сообщений)
- QoS(prefetchCount) [Get vs consume](https://habr.com/ru/post/153431/)
- http://onreader.mdl.ru/RabbitMQInDepth/content/Ch05.html

## Паттерны

- [VHosts](rmq/rmq.vhost.md)
- [Failure](rmq/rmq.failure.md)
- [Очереди с приоритетом](https://habr.com/ru/companies/arcadia/articles/571442/)

### queue

- [Keep your queue short (if possible)](https://www.cloudamqp.com/blog/part1-rabbitmq-best-practice.html)
- Limit queue size with TTL or max-length

### connection

- 1 Соединение connection на процесс-поток
- Х каналов channel на каждый поток (не шарить каналы между потоками)
- На 1 канале channel может быть несколько получателей Consumer из очередей
- [Отдельные соединения для publisher\consumer](https://www.cloudamqp.com/blog/part1-rabbitmq-best-practice.html#connections-and-channels)

### persistence

- По умолчанию при остановке или падении сервера RabbitMQ все очереди и сообщения теряются, но это поведение можно изменить. Для того чтобы сообщения оставались в очереди после перезапуска сервера, необходимо: 
  - сделать как очереди __durable__
  - так и сообщенния устойчивыми __delivery_mode=2__
- TTL Очереди

### Интеграции

#### Task (Worker) Queue

  - Round-robin dispatching (циклическое распределение задач по консьюмерам)
    - сервисы между собой делят Очередь задач
    - паттерн EIP [Competing Consumers](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CompetingConsumers.html)
    - Exchange type: direct, several consumer listening to the same queue, reading the messages in a round-robin fashion if all are waiting
  - Task Queue (распределение задач по загрузке) [Fair dispatching](https://habr.com/ru/post/150134/)
    - QoS = 1, ack=1, autoack=0 если не подтверждено 1-е сообщение, 2-е пойдёт другому подписчику

#### Simple one-way messaging

- Exchange type: direct
- message sent to unnamed (default queue)

#### Publish-subscribe Издатель-Подписчик

- fanout - без фильтрации - события
  - Очередь ответов - даёт широковешательную рассылку ответов по всем ИС потребителям
- headers - с фильтрацией - события
  - даёт возможность делать фильтрацию трафика на уровне RMQ.
  - подписчик создаёт и связывает очередь к обменнику, указывает фильтрация на основе заголовков - это решает задачу __фильтрации__ лишнего трафика, но __не решает задачу изоляции__. Подписчик может не указать фильтры и получит весь трафик: и свой и чужой.
- минусы
  - единый контракт для подписчиков
  - Не безопасно, кто угодно подписывается
  - с ростом числа подписчиков, Брокер масштабировать необходимо

##### headers vs topic для событий

- более гибко т.к. key-value инвариантов может быть больше?
  - топик - фильтрация на основе строковой маски - поиска подстроки
  - headers - на основе полного равенства значения ключа (логическое И) или один из ключей (логическое ИЛИ)
-минусы
- функционально разницы нет, по производительности topic в 3 раза медленнее headers

#### RPC (команды)

- [паттерн EIP](../../../arch/pattern/integration/pattern.rpc.md)
- EasyNetQ [RPC](https://github.com/EasyNetQ/EasyNetQ/wiki/Request-Response)
- [Exchange type: direct](https://www.rabbitmq.com/tutorials/tutorial-six-dotnet.html), message can be sent to default exchange with a specified routing key and response is received on a specified unique response queue, owned by the client
- [correlation_id, reply_to](https://habr.com/ru/post/236221/)

#### Direct Reply-TO

- мы подписываемся на специальную псевдоочередь amqp.rabbitmq.reply-to
- отправляем сообщение с указанием этой очереди в качестве reply-to заголовка
- RMQ генерирует для нас уникальный routing_key, по которому будет должно быть опубликовано ответное сообщение в default exchange
- сервер получает наше сообщение и [отправляет ответ по этому routing_key](https://habr.com/ru/articles/747644/)

### MTA

- логическое разделение (namespace) можно сделать на уровне vhosts
  - [VHosts](rmq/rmq.vhost.md)

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