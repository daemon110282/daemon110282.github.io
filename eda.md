# event driven architecture

шины событий можно выбрать одну из нескольких технологий обмена сообщениями
Rmq, azure, 

Реализации шин событий - NServiceBus, MassTransit или Brighter
Работает поверх транспорта


транспорт брокера (технология) обмена сообщения - rmq, Azure service bus
MSMQ, RabbitMQ, SQL Server, Azure Queue Storage, Azure Service Bus, and Amazon SQS.


брокера обмена сообщения

# Паттерны:

* <rmq.md>

# Exc=Direct Queue DLX
must specify a dead letter routing key https://stackoverflow.com/questions/21742232/rabbitmq-dead-letter-exchange-never-getting-messages

# Продажа 
Производительность https://habr.com/ru/company/oleg-bunin/blog/310418/

# Links
* https://habr.com/ru/company/itsumma/blog/416629/
* https://habr.com/ru/post/422151/
* https://habr.com/ru/post/150134/
* pattern
  * https://github.com/plantuml-stdlib/EIP-PlantUML?utm_source=pocket_mylist
  * https://medium.com/@objectzen/content-enricher-pattern-in-rabbitmq-eae504a8504e?utm_source=pocket_mylist
  * http://rubyamqp.info/articles/patterns_and_use_cases.html?utm_source=pocket_mylist
  * https://www.enterpriseintegrationpatterns.com/patterns/messaging/MessageRoutingIntro.html?utm_source=pocket_mylist
  * https://www.rabbitmq.com/tutorials/tutorial-two-python.html?utm_source=pocket_mylist
  * https://blog.rnds.pro/019-poison2?utm_source=pocket_mylist
  * https://alexandrugris.github.io/distributed/systems/2017/06/03/rabbitmq-patterns.html?utm_source=pocket_mylist
  * https://www.cloudamqp.com/docs/delayed-messages.html?utm_source=pocket_mylist
