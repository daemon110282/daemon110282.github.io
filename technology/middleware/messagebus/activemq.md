# Apache ActiveMQ Artemis

## Зачем

Реализация [паттерна интеграции](../../../arch/pattern/integration/pattern.integration.md) [Message Broker](../../../arch/pattern/integration/pattern.messagebroker.md).

## Плюсы-минусы

Плюсы:

- Интегрируется просто с Apache Camel
- Протокол\API [JMS](../../protocols.integration/jms.md)
  - JMS-селекторы, которые позволяют из читаемой вами [очереди отфильтровывать сообщения](https://habr.com/ru/companies/usetech/articles/683022/)
- AMQP

Минусы:

- JMS только Java стек, но есть AMQP
- Значительно медленее Kafka
