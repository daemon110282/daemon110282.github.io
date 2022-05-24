# Паттерны:

1. Task (Worker) Queue 
  1. (циклическое распределение задач по консьюмерам ) Round-robin dispatching
    - сервисы между собой делят Очередь задач 
    - паттерн EIP Competing Consumers https://www.enterpriseintegrationpatterns.com/patterns/messaging/CompetingConsumers.html
    - Exchange type: direct, several consumer listening to the same queue, reading the messages in a round-robin fashion if all are waiting
  2. Task Queue (распределение задач по загрузке ) Fair dispatching
    - QoS = 1, ack=1, autoack=0 если не подтверждена 1-е сообщение, 2-е пойдёт другому подписчику
2. Simple one-way messaging (Exchange type: direct, message sent to unnamed (default queue))
3. Publish-subscribe (fanout - без фильтрации) - события
  - TODO везде PubSub уточнить название 
  - Очередь ответов - даёт широковешательную рассылку ответов по всем ИС потребителям
4. Publish-subscribe (headers - с фильтрацией) - события
  - даёт возможность делать фильтрацию трафика на уровне RMQ. подписчик создаёт и связывает очередь к обменнику, указывает фильтрация на основе заголовков -это решает задачу фильтрации лишнего трафика, но не решает задачу изоляции. подписчик может не указать фильтры и получит весь трафик: и свой и чужой.
  - Exchange type: headers. Message is sent to the queues which match the headers. Routing key should not be set. Match type should indicate if all or any header must match.
5. Routing (Exchange type: direct, message is sent to a named exchange, routing key is specified so information only reaches the queues matching the pattern)
6. Topic (Exchange type: topic. Routing key is a string separated by dots and wildcards. E.g.: “ro.alexandrugris.*”.)
7. RPC (команды)
  - паттерн EIP Request-Reply https://www.enterpriseintegrationpatterns.com/patterns/messaging/RequestReply.html
  - EasyNetQ https://github.com/EasyNetQ/EasyNetQ/wiki/Request-Response
  - Exchange type: direct, message can be sent to default exchange with a specified routing key and response is received on a specified unique response queue, owned by the client


## Режимы доставки сообщений:

1.basic.get Доставка единичного сообщения по запросу polling;
2.Basic.Consume (Push) Подписка на очередь (постоянный мониторинг очереди с доставкой всех сообщений). Паттерн Pub-Sub 

## Рекомендации

### headers vs topic для событий 

- более гибко т.к. key-value инвариантов может быть больше?
  - топик - фильтрация на основе строковой маски - поиска подстроки
  - headers - на основе полного равенства значения ключа
-минусы
- функционально разницы нет, по производительности topic в 3 раза медленнее headers

## версионирование сообщений
* https://masstransit-project.com/architecture/versioning.html
* https://github.com/EasyNetQ/EasyNetQ/wiki/Versioning-Messages

## Links
- [Типы Exchange](https://habr.com/ru/post/489086/)
  - [Headers exchange](https://codedestine.com/rabbitmq-headers-exchange/)

## vhosts
RabbitMQ is multi-tenant system: connections, exchanges, queues, bindings, user permissions, policies and some other things belong to virtual hosts, logical groups of entities.
- Virtual hosts provide logical grouping and separation of resources. Separation of physical resources is not a goal of virtual hosts and should be considered an implementation detail.
- Virtual Hosts are used to isolate resources. A determined resource (e.g. exchanges, queues) can be used by more than one virtual host.
- RabbitMQ vhosts are like a virtual machine for a physical server, allowing for multiple secure application operations through virtual rather than physical separation. As the separation is virtual, it is important to remember that the vhosts are not physically separated from each other and therefore they might affect each other’s performance.
- In AMQP, a Virtual Host (a.k.a. 'vhost') is a namespace for objects like Exchanges, Queues and Bindings [1].
- RabbitMQ provides 2 mechanisms to apply segregation. 
  - Virtual hosts and 
  - queues. 
A virtual host can be created per microservice which will hold all the logical infrastructure definitions like Queues, Exchanges, users etc. This is a good practice as this allows the teams to manage their own AMQP topologies. However, this does not stop a virtual host to demand more from the underlying physical RabbitMQ instance.

Support multi bus, virtual host:
- https://masstransit-project.com/usage/containers/multibus.html#multibus
- Abp.io support in job https://docs.abp.io/en/abp/4.4/Background-Jobs-RabbitMq
- https://programmer.group/springboot-connect-multiple-rabbitmq-sources.HTML
- https://docs.spring.io/spring-amqp/docs/current/reference/html/#multi-rabbit
- https://github.com/freenowtech/spring-multirabbit
- https://micronaut-projects.github.io/micronaut-rabbitmq/latest/guide
- https://docs.abp.io/en/abp/4.4/Distributed-Event-Bus-RabbitMQ-Integration
- easynetq https://stackoverflow.com/questions/64060243/multiple-vhost-connection-inside-same-project-subscribe-publish
- celery worker https://stackoverflow.com/questions/12209652/multi-celery-projects-with-same-rabbitmq-broker-backend-process
- Django back end framework https://timonweb.com/django/run-multiple-django-apps-with-celery-on-one-server-with-rabbitmq-vhosts/


## security

security mechanism in RabbitMQ:

* Access control https://www.rabbitmq.com/access-control.html
. * Vhosts
. * each user should be permissioned to only read and write to their own queue based on the queue's unique name.

* SASL authentication
. * supports multiple SASL authentication mechanisms. There are three such mechanisms built into the server: PLAIN, AMQPLAIN, and RABBIT-CR-DEMO, and one — EXTERNAL — available as a plugin.

* SSL support

https://stackoverflow.com/questions/7840283/how-can-queues-be-made-private-secure-in-rabbitmq-in-a-multitenancy-system
