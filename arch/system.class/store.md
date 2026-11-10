# Хранилища данных

- [Хранилища данных](#хранилища-данных)
  - [Зачем](#зачем)
  - [Виды](#виды)
  - [Критерии выбора](#критерии-выбора)
  - [Технологии](#технологии)

## Зачем

- [MS Хранилища данных](https://docs.microsoft.com/ru-ru/azure/architecture/guide/technology-choices/data-store-overview)
- Интегрирует множество источников данных и помогает снизить нагрузку на производственную систему
- Оптимизированные данные для доступа к чтению и последовательного сканирования диска
- Хранилище данных помогает защитить данные от обновлений исходной системы
- Позволяет пользователям выполнять управление основными данными
- Улучшение качества данных в исходных системах

Основные [типы хранилищ](https://yandex.cloud/ru/docs/glossary/datavault
):

- хранилища в третьей нормальной форме (3NF)
- хранилища с измерениями (типа «Звезда» или «Снежинка»)
- хранилища с измерениями [Data Vault](../pattern/system.design/data/data.vault.md)

[Паттерны](../pattern/system.design/data/data.md)

## Виды

[Критерии](../arch.criteria.md)

- Structured
  - OLTP (MSSQL..)
    - RDBMS (Relational Database Management System)
      - Almost anything could be solved by them
  - OLAP
    - Column Family (ClickHouse..)
- Time-series database (Prometheus..)
  - Store and manage time-stamped data
- Semi Structured
  - [NoSQL](store.nosql.md)
    - Key Value (Redis)
    - Graph database (Neo4J)
    - Document store (MongoDB)
    - Wide column store (Cassandra)
  - Full text search Полнотекстовый поиск (ElasticSearch) - [DSE](dse.md) системы
- UnStructured
  - BLOB (Minio)

## Критерии выбора

![Выбор хранилища http://architecturethehardparts.com/](../../img/arch/choose_store.jpg)

- [Варианты, TOP](https://db-engines.com/en/ranking)
- [SQL vs NoSQL](https://towardsdatascience.com/datastore-choices-sql-vs-nosql-database-ebec24d56106)
  - ![choose](../../img/technology/store/sql.vs.nosql.webp)
  - [Clickhouse vs ELK vs Google Big Query и Amazon RedShift vs TimescaleDB](https://habr.com/ru/company/ua-hosting/blog/483112/)
  - [redis vs PgSQL](https://habr.com/ru/company/cloud_mts/blog/716548/)
  - Memcached vs Redis
    - может показывать отличные результаты производительности в ограниченных окружениях кеширования
    - А при использовании этой системы в [распределённом кластере](https://habr.com/ru/company/wunderfund/blog/685894/) нужны дополнительные настройки. Redis же поддерживает подобные сценарии работы сразу после установки.
- SQL, NoSQL, TimeSeries
  - ![плюсы-минусы](../../img/technology/db/types.db.jpeg)
- Производительность (QPS RPS)
    - более 100k RPS
      - Tarantool
    - до 1000 RPS
      - MSSQL
      - PostgreSQL

Решение принимаем по каждому виду данных/бизнес сущности отдельно. Ищем __баланс__ с учетом:

- размера данных
- стоимости их вычисления/чтения с HDD
- вероятности их повторной востребованности
- размера, который они занимают в кэше/частоты изменения данных/того
- насколько "болезненно" будет для пользователя получение "устаревших" данных из __кэша__

## Технологии

[Технологии](../../technology/store.md)
