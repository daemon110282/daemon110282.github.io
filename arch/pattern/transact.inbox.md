# Transactional Inbox

## Зачем

- [Обеспечить надежную обработку событий](https://softwaremill.com/microservices-101/)

## Плюсы и минусы

Минусы:

- increased latency
- additional boilerplate
- more load on the database.

## Patterns

- Изменение бизнес данных и обработка входящего события __в одной транзакции__
- Persistence NOSQL, SQL

## Технологии

- [abp.io](https://docs.abp.io/en/abp/latest/Distributed-Event-Bus)
- [in memory MassTransit](https://masstransit.io/documentation/patterns/in-memory-outbox)