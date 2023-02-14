# Брокер сообщений Message Broker 

- принцип "глупая шина (канал) умные клиенты"

![MQ](../../img/pattern/integration/mq.jpg)
![MB VS](../../img/pattern/integration/mq.compare.jpg)

## Patterns

- [Advanced transient messaging](https://apolomodov.medium.com/coa-distributed-systems-4th-ed-4-communication-c5ce331015e9)
	- ZeroMQ
- Message-oriented persistent
	- [Message Bus](../../technology/rmq.md)  
	- Транспорт
		- [RMQ](../../technology/rmq.md)
		- ActiveMQ
- log-based message queue
	- [Kafka](../../technology/middleware/kafka.md)
- [Messaging Patterns](https://www.enterpriseintegrationpatterns.com/patterns/messaging/)
  - [MS](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/category/messaging)
  - Pub\Sub События
  - Task (Worker) Queue

## Технологии

- Транспорт  
	- Kafka
	- [RabbitMQ](../../technology/middleware/rmq.md)
	- Azure service bus
	- MSMQ
	- SQL Server
	- Azure Queue Storage
	- Azure Service Bus
	- Amazon SQS