# event driven architecture

## Зачем

* Multiple subsystems must process the same events.
* Real-time processing with minimum time lag.
* Complex event processing, such as pattern matching or aggregation over time windows.
* High volume and high velocity of data, such as IoT.

## Плюсы и минусы

[Критерии](arch.criteria.md)

| + | - |
| - | - |
| Слабая связность | Сложность |
| Масштабируемость | Асинхронный обмен сообщениями и итоговая согласованность |
|| Управляемость |
|| Взаимодействие между службами |
|| Обеспечить последовательность событий |

Decoupling: We need a way to decouple communication between different services or applications.
High Response Time: When the response time of a request is too much. For example, calculations, searching or pdf creation, etc.
Background Jobs: Sending background messages, emails, or notifications to loads of users.
Asynchronous Messaging: Messaging queues are the best way to implement asynchronous programming.


## Выбор технологий

* шины событий можно выбрать одну из нескольких технологий обмена сообщениями: Rmq, azure
* Реализации шин событий - NServiceBus, MassTransit или Brighter. Работает поверх транспорта
* транспорт брокера (технология) обмена сообщения - rmq, Azure service bus
MSMQ, RabbitMQ, SQL Server, Azure Queue Storage, Azure Service Bus, and Amazon SQS.
* брокер обмена сообщениями

CQRS - command query request segregation
Event sourcing
Паттерн медиатор
Событие и команда
Event or command driven


## Паттерны

* [RMQ](rmq.md)


## Exc=Direct Queue DLX

must specify a dead letter routing key https://stackoverflow.com/questions/21742232/rabbitmq-dead-letter-exchange-never-getting-messages

## Продажа

Производительность https://habr.com/ru/company/oleg-bunin/blog/310418/

## Links

* https://habr.com/ru/company/itsumma/blog/416629/
* https://habr.com/ru/post/422151/
* https://habr.com/ru/post/150134/
* https://docs.microsoft.com/ru-ru/azure/architecture/guide/architecture-styles/event-driven
* pattern
  * https://github.com/plantuml-stdlib/EIP-PlantUML?utm_source=pocket_mylist
  * https://medium.com/@objectzen/content-enricher-pattern-in-rabbitmq-eae504a8504e?utm_source=pocket_mylist
  * http://rubyamqp.info/articles/patterns_and_use_cases.html?utm_source=pocket_mylist
  * https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageRoutingIntro.html?utm_source=pocket_mylist
  * https://www.rabbitmq.com/tutorials/tutorial-two-python.html?utm_source=pocket_mylist
  * https://blog.rnds.pro/019-poison2?utm_source=pocket_mylist
  * https://alexandrugris.github.io/distributed/systems/2017/06/03/rabbitmq-patterns.html?utm_source=pocket_mylist
  * https://www.cloudamqp.com/docs/delayed-messages.html?utm_source=pocket_mylist
  * https://solace.com/blog/messaging-patterns-for-event-driven-microservices/
* naming 
  * https://solace.com/blog/designing-and-naming-topics-for-event-driven-architecture-with-pubsub/?mkt_tok=MDcyLUNCSS05MjUAAAGDJ7N-6jFCOwXRBzE_4Ku_niXJQniSVNAJ-nNBD0JvROkzqo3tQbzDTFFx5PHlhTJj16lqF8xZCHb8IIy_29iOyZFYViJCWwpsU1X393ljZGzf&ю
  * https://docs.solace.com/Best-Practices/Topic-Architecture-Best-Practices.htm
  * https://codeopinion.com/message-naming-guidelines/
  * https://stackoverflow.com/questions/32220312/rabbitmq-amqp-best-practice-queue-topic-design-in-a-microservice-architecture
  * http://thoai-nguyen.blogspot.com/2012/05/rabbitmq-exchange-queue-name-convention.html
* versioning
  * https://www.youtube.com/watch?v=mEzYTuYSork&list=PLx8uyNNs1ri2MBx6BjPum5j9_MMdIfM9C&index=11&ab_channel=ChrisPatterson
