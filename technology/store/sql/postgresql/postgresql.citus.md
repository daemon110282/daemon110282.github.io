# CITUS

## Зачем

Расширение [Postgres](postgresql.md)

- Реализация Паттерна вертикального, горизонтального [шардирования](../../arch/pattern/performance/shard.db.md) (партиционирование, секционирование)
- Fast queries for all [tenants](../../arch/pattern/mta/mta.md)
	- [ASP.NET Core sample](https://www.citusdata.com/blog/2018/01/22/multi-tenant-web-apps-with-dot-net-core-and-postgres)
- Sharding logic in the database, not the application
- Hold more data than possible in single-node PostgreSQL
- Scale out without giving up SQL
- Maintain performance under high concurrency
- Fast metrics analysis across customer base
- Easily scale to handle new customer signups
- Isolate resource usage of large and small customers

## Плюсы и минусы

Плюсы:

- Прозначный, быстрый для разработчика способ горизонтального партиционирования\шардирования данных между инстансами СУБД

Минусы:

- Отдельный инстанс СУБД PostgreSQL Coordinator – Точка отказа, bottleneck, реплику StandBy Можно настроить PostgreSQL
- Нет экспертизы
- Нужен DBA\INFRA
- Enterprise Version
	Rebalance Shard New Node (в ручном режиме больше Downtime)
	Monitoring (без нужно разбираться)
	Репликация Master-Slave (без нужно разбираться)
	Tenant Isolation
- Есть [ограничения SQL](https://docs.citusdata.com/en/v9.5/faq/faq.html#are-there-any-postgresql-features-not-supported-by-citus)
	- Correlated subqueries
	- Recursive CTEs
	- Table sample
	- SELECT … FOR UPDATE
	- Grouping sets

## Паттерны

- Создание масштабируемой и высокодоступной системы [Postgres с помощью Patroni 3.0 и Citus (docker пример)](https://habr.com/ru/companies/otus/articles/755032/)
- Типы данных
	- Distributed Tables
	Distribution Column=TenantId
	Таблица горизонтально шардируется на ноды PostgreSQL
	Co-Location размещение связанных таблиц на одной ноде для производительности запросов
	- Reference Tables
	Справочники размещаются на каждой ноде с репликацией данных
	- Local Tables
	Не шардируемые по нодам таблицы (Пользователи например)
	- [Timeseries Data](https://docs.citusdata.com/en/v9.5/use_cases/timeseries.html)
	Авто партиционирование данных для возможности удаления устаревших данных онлайн без снижения доступности БД

## Версии

- 12.1
	- поддержка [Postgres 16](https://www.citusdata.com/blog/2023/09/22/adding-postgres-16-support-to-citus-12-1/)
