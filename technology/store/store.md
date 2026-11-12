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

Решения для [хранилищ данных](../../arch/system.class/store.md).
[Критерии выбора](../../arch/system.class/store.md#критерии-выбора).

## Structured Data

### OLTP RDBMS (Relational)

- [MS SQL](sql/mssql/mssql.md)
- [PostgreSQL](sql/postgresql/postgresql.md)
- [Tarantool](tarantool.md)
- Импортозамещение (реестр отечественного ПО, сертификация СФТЭК)
  - на базе PostgreSQL (коммерческие)
    - Astra [Tantor](sql/postgresql/tantor.md)
    - [PostgreSQL PRO](sql/postgresql/postgresql.pro.md)
    - [Jatoba](sql/postgresql/jatoba.md)

### OLAP

- [ClickHouse](clickhouse.md)
- BigQuery

## Semi Structured Data

- [NoSQL](./nosql/store.nosql.md)

### Time Series Database

- InfluxDB
- [Prometheus](timeseries/prometheus.md)
- [Victoria metrics](timeseries/victoriametrics.md)
- TimescaleDB PostgreSQL

### Full text search Полнотекстовый поиск

- [Sphinx](nosql/sphinx.md)
- [Elasticsearch](elasticsearch.md)
- [manticore](https://github.com/manticoresoftware/manticoresearch) fork Sphinx

## UnStructured Data

- [Minio](minio.md)
