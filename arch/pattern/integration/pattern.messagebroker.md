# Брокер сообщений Message Broker Bus

- [Брокер сообщений Message Broker Bus](#брокер-сообщений-message-broker-bus)
	- [Зачем](#зачем)
	- [Плюсы-минусы](#плюсы-минусы)
	- [Patterns](#patterns)
	- [Технологии](#технологии)
		- [Выбор](#выбор)
			- [RMQ vs Kafka](#rmq-vs-kafka)
				- [RabbitMQ](#rabbitmq)
				- [Kafka](#kafka)

## Зачем

- принцип "глупая шина (канал) умные клиенты"

![MQ](../../../img/pattern/integration/mq.jpg)

## Плюсы-минусы

Плюсы

- Слабая связность ИС [Low Coupling](../../ability/low.coupling.md)
  
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
  - Pull
  - Push
- Как узнать когда сообщение в очередь добавлено - [Timestamp](https://www.rabbitmq.com/publishers.html#message-properties)

## Технологии

- Транспорт  
	- Kafka
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

##### RabbitMQ

Плюсы:

- Message timing control (controlling either message expiry or message delay).
- Advanced fault handling capabilities, in cases when consumers are more likely to fail to process messages (either temporarily or permanently).
- Advanced and flexible routing rules.
- Simpler consumer implementations.
- перешли на постоянные (persistent) очереди, которые не удаляются в момент разрыва подключения, но повесили на них политику «протухания» (expire), если пользователя нет более 5 минут.
- Приоритет сообщений

Минусы:

- нет параметра Expire для обменников (только для очередей)
- Нет шардирования, в kafka есть topic-несколько partition, есть несколько инстансов где очереди размещены
- Производительность ниже Kafka

##### Kafka

Плюсы:

- распределенный горизонтально масштабируемый отказоустойчивый журнал коммитов
- Поток событий
- Шардинг из коробки
- Strict message ordering.
- Message retention for extended periods, including the possibility of replaying past messages.
- The ability to reach a high scale when traditional solutions do not suffice.

Минусы:

- Наиболее полно API Kafka поддерживается только в языках Java и Scala. В других языках поддержка не всегда полная, поэтому фреймворки Kafka Connect и Kafka Streams созданы.
- [Нет приоритета сообщений](https://blog.bytebytego.com/p/how-to-choose-a-message-queue-kafka)