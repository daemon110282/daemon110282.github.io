# Хранилища данных

- [Хранилища данных](#хранилища-данных)
  - [Зачем](#зачем)
  - [Structured Data](#structured-data)
    - [OLTP RDBMS (Relational)](#oltp-rdbms-relational)
    - [OLAP](#olap)
  - [Semi Structured Data](#semi-structured-data)
    - [Time Series Database](#time-series-database)
    - [Full text search Полнотекстовый поиск](#full-text-search-полнотекстовый-поиск)
  - [UnStructured Data](#unstructured-data)

## Зачем

Решения для [хранилищ данных](../arch/system.class/store.md).
[Критерии выбора](../arch/system.class/store.md#критерии-выбора).

## Structured Data

### OLTP RDBMS (Relational)

- [MS SQL](db/mssql/mssql.md)
- [PostgreSQL](db/postgresql/postgresql.md)
- [Tarantool](store/tarantool.md)
- Импортозамещение (реестр отечественного ПО, сертификация СФТЭК)
  - на базе PostgreSQL (коммерческие)
    - Astra [Tantor](db/postgresql/tantor.md)
    - [PostgreSQL PRO](db/postgresql/postgresql.pro.md)
    - [Jatoba](db/postgresql/jatoba.md)

### OLAP

- [ClickHouse](store/clickhouse.md)

## Semi Structured Data

- [NoSQL](store.nosql.md)

### Time Series Database

- InfluxDB
- [Prometheus](store/prometheus.md)
- [Victoria metrics](store/victoriametrics.md)
- TimescaleDB PostgreSQL

### Full text search Полнотекстовый поиск

- [Sphinx](store/sphinx.md)
- [Elasticsearch](store/elasticsearch.md)
- [manticore](https://github.com/manticoresoftware/manticoresearch) fork Sphinx

## UnStructured Data

- [Minio](store/minio.md)
