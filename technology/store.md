# Хранилища данных

- [Хранилища данных](#хранилища-данных)
	- [RDBMS (Relational)](#rdbms-relational)
	- [Time Series Database](#time-series-database)
	- [NoSQL](#nosql)
		- [Document store](#document-store)
		- [In-memory store](#in-memory-store)
		- [Column Based](#column-based)
	- [Full text search Полнотекстовый поиск](#full-text-search-полнотекстовый-поиск)

Решения для [хранилищ данных](../arch/store.md).
[Варианты, TOP](https://db-engines.com/en/ranking).

## RDBMS (Relational)

- [MS SQL](db/mssql/mssql.md)
- [PostgreSQL](db/postgresql/postgresql.md)

## Time Series Database

- InfluxDB
- [Prometeus](store/prometheus.md)
- [Victoria metrics](observability/monitoring/victoriametrics.md)
- TimescaleDB PostgreSQL

## NoSQL

### Document store

- [MongoDB](store/mongo.md) — документоориентированная система управления базами данных, не требующая описания схемы таблиц. Считается одним из классических примеров NoSQL-систем, использует JSON-подобные документы и схему базы данных.

### In-memory store

- Key Value
	- [Redis](store/redis.md)
		- это однопоточная система
		- [redis vs PgSQL](https://habr.com/ru/company/cloud_mts/blog/716548/)
	- Memcached
		— многопоточная
		- Memcached может показывать отличные результаты производительности в ограниченных окружениях кеширования. А при использовании этой системы в [распределённом кластере](https://habr.com/ru/company/wunderfund/blog/685894/) нужны дополнительные настройки. Redis же поддерживает подобные сценарии работы сразу после установки.

### Column Based

- [ClickHouse](store/clickhouse.md)

## Full text search Полнотекстовый поиск

- [Sphinx](store/sphinx.md)
- [Elasticsearch](store/elasticsearch.md)
- [manticore](https://github.com/manticoresoftware/manticoresearch) fork Sphinx
