# Transactional outbox

## Зачем

- [Обеспечить надежную отправку событий](https://microservices.io/patterns/data/transactional-outbox.html)
- [ensures consistency between business data and messages](https://docs.particular.net/nservicebus/outbox/)
- [handle at-least-once and exactly-once delivery](https://event-driven.io/en/outbox_inbox_patterns_and_delivery_guarantees_explained/)

## Плюсы и минусы

Минусы:

- increased latency
- additional boilerplate
- more load on the database.

## Patterns

- Изменение бизнес данных и генерация события исходящего __в одной транзакции__
- For best __performance__, __outbox data__ should be stored in the __same database as business data__
- Persistence [NOSQL, SQL](https://docs.particular.net/nservicebus/outbox/#persistence)
- [polling implementation](https://event-driven.io/en/outbox_inbox_patterns_and_delivery_guarantees_explained/) (read table in SQL store)
- push implementation
	- [PGSQL WAL Logical Replication](https://event-driven.io/en/push_based_outbox_pattern_with_postgres_logical_replication/)

## Технологии

- [example](https://itnext.io/the-outbox-pattern-in-event-driven-asp-net-core-microservice-architectures-10b8d9923885)
- [masstransit](https://masstransit.io/documentation/concepts/exceptions#outbox)
- [nservicebus](https://docs.particular.net/nservicebus/outbox/)