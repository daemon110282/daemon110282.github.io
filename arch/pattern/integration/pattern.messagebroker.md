# Брокер сообщений Message Broker Bus

- [Брокер сообщений Message Broker Bus](#брокер-сообщений-message-broker-bus)
	- [Зачем](#зачем)
	- [Плюсы-минусы](#плюсы-минусы)
	- [Patterns](#patterns)
	- [Технологии](#технологии)
		- [Выбор](#выбор)
			- [RMQ vs Kafka](#rmq-vs-kafka)

## Зачем

- принцип "глупая шина (канал) умные клиенты"

![MQ](../../../img/pattern/integration/mq.jpg)

## Плюсы-минусы

Плюсы

- Слабая связность ИС [Low Coupling](../system.design/low.coupling.md)
  
Минусы

- Дополнительный архитектурный слой
- Затраты на мониторинг, настройку, управление
- влияет на общую надежность и безопасность системы

## Patterns

- [Advanced transient messaging](https://apolomodov.medium.com/coa-distributed-systems-4th-ed-4-communication-c5ce331015e9)
	- ZeroMQ
- Message-oriented persistent - Message Bus
	- Транспорт
		- [RMQ](../../../technology/middleware/messagebus/rmq.md)  
		- ActiveMQ
- Log-based message queue
	- [Kafka](../../../technology/middleware/messagebus/kafka.md)
- [Messaging Patterns](https://www.enterpriseintegrationpatterns.com/patterns/messaging/)
  - [MS](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/category/messaging)
  - Pub\Sub События
  - Task (Worker) Queue
  - [Очереди с приоритетом](https://habr.com/ru/companies/arcadia/articles/571442/)
  - Content-Based Routing
  - Filter message
  - Dynamic Router
  - Splitter
  - Dead Leater Channel
  - Message Translator
  - Wire Tap - наблюдение за сообщениями
- Event Sourcing
- Тип способа получения сообщений
  - Pull (по запросу)
  - Push (подписка)
- Как узнать когда сообщение в очередь добавлено - [Timestamp](https://www.rabbitmq.com/publishers.html#message-properties)

## Технологии

- Транспорт  
	- [Kafka](../../../technology/middleware/messagebus/kafka.md)
	- [RabbitMQ](../../../technology/middleware/messagebus/rmq.md)
	- Azure service bus
	- MSMQ
	- SQL Server
	- Azure Queue Storage
	- Azure Service Bus
	- Amazon SQS

### Выбор

![Alt text](../../../img/technology/middleware/messagebus/rmq.vs.kafka.vs.ibm.png)
![Alt text](../../../img/technology/middleware/messagebus/rmq.vs.kafka.vs.ibm2.png)
![MB VS](../../../img/pattern/integration/mq.compare.jpg)

#### RMQ vs Kafka

- [RMQ](../../../technology/middleware/messagebus/rmq.md#плюсы-и-минусы)
- [Kafka](../../../technology/middleware/messagebus/kafka.md#плюсы-и-минусы)
	- [vs RMQ](https://blog.bytebytego.com/p/how-to-choose-a-message-queue-kafka):
    	- сообщения хранятся (так спроектирована)
    	- выше производительность
    	- строгая последовательность сообщений
    	- меньше гибкости в роутинге сообщений
    	- нет приоритета сообщений
