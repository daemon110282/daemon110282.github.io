# Event Driven Architecture (EDA) Сервис ориентированная архитектура

- [Event Driven Architecture (EDA) Сервис ориентированная архитектура](#event-driven-architecture-eda-сервис-ориентированная-архитектура)
  - [Зачем](#зачем)
  - [Плюсы и минусы](#плюсы-и-минусы)
  - [Паттерны](#паттерны)
  - [Технологии](#технологии)
  - [Links](#links)

[Схемы](https://docs.google.com/document/d/1WBshnSO-F0S4zbQOjANvhFNKPepSMlhoU38OdIPV0i8/edit?usp=sharing)

## Зачем

* **Multiple subsystems** must process the **same events**.
* Real-time processing with minimum time lag.
* Complex event processing, such as pattern matching or aggregation over time windows.
* High volume and high velocity of data, such as IoT.
* Background Jobs: Sending background messages, emails, or notifications to loads of users.
* Asynchronous Messaging: Messaging queues are the best way to implement asynchronous programming.
* High Response Time: When the response time of a request is too much. For example, calculations, searching or pdf creation, etc.

## Плюсы и минусы

[Критерии](../arch.criteria.md)

| + | - |
| - | - |
| Слабая связность | [Обеспечить последовательность событий](https://docs.microsoft.com/ru-ru/azure/architecture/guide/architecture-styles/event-driven) |
| Масштабируемость. [Производительность](https://habr.com/ru/company/oleg-bunin/blog/310418/) | Асинхронный обмен сообщениями и итоговая согласованность |
|| Управляемость |
|| Взаимодействие между службами |
|| Гарантированная доставка |
||  |

## Паттерны

* Событие и команда Event or command driven
  * [Task (Worker) Queue](../../technology/rmq.md)
  * [Publish-subscribe](../../technology/rmq.md)
  * [RPC (команды)](../../technology/rmq.md)
* CQRS - command query request segregation
* Event sourcing
* Медиатор
* SAGA

## Технологии

* Шины сообщений Event Bus (брокер обмена сообщениями Message Broker) можно выбрать одну из нескольких технологий (траспорт) обмена сообщениями:
  * [RabbitMQ](../../technology/rmq.md)
  * Azure service bus
  * MSMQ
  * SQL Server
  * Azure Queue Storage
  * Azure Service Bus
  * Amazon SQS
* Реализации шин сообщений (фреймворк)
  * NServiceBus
  * MassTransit или Brighter
  * EasyNetQ
* [MS Обмен сообщениями](https://docs.microsoft.com/ru-ru/azure/architecture/guide/technology-choices/messaging)

## Links

* https://habr.com/ru/company/itsumma/blog/416629/
* https://habr.com/ru/post/422151/
* https://habr.com/ru/post/150134/
* https://docs.microsoft.com/ru-ru/azure/architecture/guide/architecture-styles/event-driven
* https://docs.abp.io/en/abp/4.4/Distributed-Event-Bus
* pattern
  * https://github.com/plantuml-stdlib/EIP-PlantUML
  * https://medium.com/@objectzen/content-enricher-pattern-in-rabbitmq-eae504a8504e
  * http://rubyamqp.info/articles/patterns_and_use_cases.html
  * https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageRoutingIntro.html
  * https://www.rabbitmq.com/tutorials/tutorial-two-python.html
  * https://blog.rnds.pro/019-poison2
  * https://alexandrugris.github.io/distributed/systems/2017/06/03/rabbitmq-patterns.html
  * https://www.cloudamqp.com/docs/delayed-messages.html
  * https://solace.com/blog/messaging-patterns-for-event-driven-microservices/
* naming 
  * https://solace.com/blog/designing-and-naming-topics-for-event-driven-architecture-with-pubsub/?mkt_tok=MDcyLUNCSS05MjUAAAGDJ7N-6jFCOwXRBzE_4Ku_niXJQniSVNAJ-nNBD0JvROkzqo3tQbzDTFFx5PHlhTJj16lqF8xZCHb8IIy_29iOyZFYViJCWwpsU1X393ljZGzf&ю
  * https://docs.solace.com/Best-Practices/Topic-Architecture-Best-Practices.htm
  * https://codeopinion.com/message-naming-guidelines/
  * https://stackoverflow.com/questions/32220312/rabbitmq-amqp-best-practice-queue-topic-design-in-a-microservice-architecture
  * http://thoai-nguyen.blogspot.com/2012/05/rabbitmq-exchange-queue-name-convention.html
* versioning
  * https://www.youtube.com/watch?v=mEzYTuYSork&list=PLx8uyNNs1ri2MBx6BjPum5j9_MMdIfM9C&index=11&ab_channel=ChrisPatterson
