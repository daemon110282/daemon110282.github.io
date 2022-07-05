# RabbitMQ

- [RabbitMQ](#rabbitmq)
  - [Паттерны](#паттерны)
  - [Режимы доставки сообщений](#режимы-доставки-сообщений)
  - [Best practices Рекомендации](#best-practices-рекомендации)
    - [headers vs topic для событий](#headers-vs-topic-для-событий)
    - [версионирование сообщений](#версионирование-сообщений)
  - [security](#security)
  - [Links](#links)

## Паттерны

* Task (Worker) Queue 
  - Round-robin dispatching (циклическое распределение задач по консьюмерам) 
    - сервисы между собой делят Очередь задач
    - паттерн EIP [Competing Consumers](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CompetingConsumers.html)
    - Exchange type: direct, several consumer listening to the same queue, reading the messages in a round-robin fashion if all are waiting
  - Task Queue (распределение задач по загрузке ) Fair dispatching
    - QoS = 1, ack=1, autoack=0 если не подтверждено 1-е сообщение, 2-е пойдёт другому подписчику
* Simple one-way messaging (Exchange type: direct, message sent to unnamed (default queue))
* Publish-subscribe Издатель-Подписчик
  - (fanout - без фильтрации) - события
    - Очередь ответов - даёт широковешательную рассылку ответов по всем ИС потребителям
  - (headers - с фильтрацией) - события
    - даёт возможность делать фильтрацию трафика на уровне RMQ. подписчик создаёт и связывает очередь к обменнику, указывает фильтрация на основе заголовков -это решает задачу фильтрации лишнего трафика, но не решает задачу изоляции. подписчик может не указать фильтры и получит весь трафик: и свой и чужой.
    - Exchange type: headers. Message is sent to the queues which match the headers. Routing key should not be set. Match type should indicate if all or any header must match.
  - Routing
    - Exchange type: direct, message is sent to a named exchange, routing key is specified so information only reaches the queues matching the pattern
  - Topic
    - Exchange type: topic. Routing key is a string separated by dots and wildcards. E.g.: “ro.alexandrugris.*”.
. - Trade off
.   - единый контракт для подписчиков
.   - Не безопасно, кто угодно подписывается
.   - с ростом числа подписчиков, Брокер масштабировать необходимо
* RPC (команды)
  - паттерн EIP [Request-Reply](https://www.enterpriseintegrationpatterns.com/patterns/messaging/RequestReply.html)
  - EasyNetQ [RPC](https://github.com/EasyNetQ/EasyNetQ/wiki/Request-Response)
  - Exchange type: direct, message can be sent to default exchange with a specified routing key and response is received on a specified unique response queue, owned by the client

## Режимы доставки сообщений

* Basic.get (Poll) - Доставка единичного сообщения по запросу
* Basic.Consume (Push) - Подписка на очередь (постоянный мониторинг очереди с доставкой всех сообщений)

## Best practices Рекомендации

* [From Cloudamqp](https://www.cloudamqp.com/blog/part1-rabbitmq-best-practice.html)
* [VHosts](rmq/rmq.vhost.md)
* [Failure](rmq/rmq.failure.md)

### headers vs topic для событий

- более гибко т.к. key-value инвариантов может быть больше?
  - топик - фильтрация на основе строковой маски - поиска подстроки
  - headers - на основе полного равенства значения ключа
-минусы
- функционально разницы нет, по производительности topic в 3 раза медленнее headers

### версионирование сообщений

- по [message type](http://rabbitmq.github.io/rabbitmq-dotnet-client/api/RabbitMQ.Client.IBasicProperties.html#RabbitMQ_Client_IBasicProperties_Type) serialize, deserialize _с отдельными очередями?_
  - [masstransit](https://masstransit-project.com/architecture/versioning.html)
    - https://bartwullems.blogspot.com/2021/10/masstransitmessage-versioning.html
  - [EasyNetQ](https://github.com/EasyNetQ/EasyNetQ/wiki/Versioning-Messages)
  - [NServiceBus](https://docs.particular.net/samples/versioning/)

## security

[Security mechanism](https://stackoverflow.com/questions/7840283/how-can-queues-be-made-private-secure-in-rabbitmq-in-a-multitenancy-system) in RabbitMQ:

- Access control https://www.rabbitmq.com/access-control.html
  - Vhosts
  - each user should be permissioned to only read and write to their own queue based on the queue's unique name.
- SASL authentication
  - supports multiple SASL authentication mechanisms. There are three such mechanisms built into the server: PLAIN, AMQPLAIN, and RABBIT-CR-DEMO, and one — EXTERNAL — available as a plugin.
- SSL support

## Links

* [Типы Exchange](https://habr.com/ru/post/489086/)
  * [Headers exchange](https://codedestine.com/rabbitmq-headers-exchange/)
* security
  * 
