# Хранилища данных

- [Хранилища данных](#хранилища-данных)
	- [RDBMS (Relational)](#rdbms-relational)
	- [Time Series Database](#time-series-database)
	- [NoSQL](#nosql)
		- [Document-Oriented store](#document-oriented-store)
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

### Document-Oriented store

- Похожий на Column-Family, но поддерживает __более глубокую структуру вложений__ сложных структур (документ, в который вложен Документ, в который вложен другой документ).
  - Документы снимают ограничения одно-двухуровневого вложения в Column-Family базах данных
  - Возможность сформировать документ, который будет храниться в виде записи в БД
- Плюсы и минусы
  - * Performance - зависит от реализации, но в целом не производительность ниже, чем у Column-Family 
  - *** Scalability - более 100 организаций используют кластеры на 100+ хостов. Некоторые используют кластеры на 1000+ хостов.
  - *** Availability - высокая доступность за счет кластеризации и репликации
  - * Ad-hoc анализ - немного лучше, что другие Семейства NoSQL БД, то все еще хуже, чем реляционные БД или Interactive Query Engine
- Технологии
  - [MongoDB](store/mongo.md) — документоориентированная система управления базами данных, не требующая описания схемы таблиц. Считается одним из классических примеров NoSQL-систем, использует JSON-подобные документы и схему базы данных.
  - CouchDB

### In-memory store

- Key Value Ключ-Значение
	- [Redis](store/redis.md)
		- это однопоточная система
		- [redis vs PgSQL](https://habr.com/ru/company/cloud_mts/blog/716548/)
	- Memcached
		— многопоточная
		- Memcached может показывать отличные результаты производительности в ограниченных окружениях кеширования. А при использовании этой системы в [распределённом кластере](https://habr.com/ru/company/wunderfund/blog/685894/) нужны дополнительные настройки. Redis же поддерживает подобные сценарии работы сразу после установки.

### Column Based

- Расширяет базы данных на основе Ключ-Значение за счет хранения слабо определенных коллекций одной или более пар Ключ-значение.
- Может иметь представление двумерного массива, в котором каждому ключу соответствует одна и более пара ключ-значение
- Плюсы и минусы
  - *** Performance очень быстрая из-за отсутствия схемы, функций реляционности и транзакционности и ссылочной целостности
  - *** Scalability может линейно масштабироваться с помощью разделения данных по хэшу, вычесленному на основе ключа
  - *** Availability - высокая доступность за счет кластеризации и распределенных файловых систем (HDFS)
  - * Ad-hoc Analysis - поддерживает вторичные индексы, но отсутствуют функции агрегирования данных
- Технологии
  - [ClickHouse](store/clickhouse.md)
  - Cassandra
  - HBase

## Full text search Полнотекстовый поиск

- [Sphinx](store/sphinx.md)
- [Elasticsearch](store/elasticsearch.md)
- [manticore](https://github.com/manticoresoftware/manticoresearch) fork Sphinx
