# Postgresql

- [Postgresql](#postgresql)
  - [Зачем](#зачем)
  - [Термины](#термины)
  - [Типы данных](#типы-данных)
    - [JSONB](#jsonb)
  - [Функции](#функции)
    - [Management](#management)
    - [Replication](#replication)
      - [Log Shipping](#log-shipping)
    - [Reporting Tools](#reporting-tools)
    - [Hith Availability](#hith-availability)
    - [Мониторинг](#мониторинг)
  - [Плюсы-минусы](#плюсы-минусы)
  - [Паттерны](#паттерны)
    - [ETL PSQL2MSSQL](#etl-psql2mssql)
    - [ETL MSSQL2PSQL](#etl-mssql2psql)
    - [Benchmark](#benchmark)
    - [Блокировки Locks](#блокировки-locks)
  - [Миграция с MS SQL](#миграция-с-ms-sql)
    - [Миграция с простоем](#миграция-с-простоем)
    - [Миграция без простоя Zero Downtime](#миграция-без-простоя-zero-downtime)
  - [Версии](#версии)

## Зачем

Решение РСУБД для [хранилищ данных](../../store.md).

## Термины

- RTO - [Recovery Time Objective](https://en.wikipedia.org/wiki/Disaster_recovery#Recovery_Time_Objective)

## Типы данных

- [Enum](https://www.postgresql.org/docs/current/datatype-enum.html)
  - Работает быстро на больших объемах, синтаксический сахар, [реализовано как отдельная таблица с join по сути](https://habr.com/ru/companies/domclick/articles/525530/)

### JSONB

- [JSONB](https://medium.com/geekculture/postgres-jsonb-usage-and-performance-analysis-cdbd1242a018)
  - работает очень быстро, особенно в контексте бизнес автоматизации
  - но требует [индексов](https://habr.com/ru/companies/domclick/articles/701012/) правильных (GIN, Hash, btree)
  - Его удобно использовать для тех случаев, когда его данные __не используются для работы БД__, его можно легко и просто сразу передать веб-страницам
  - Если же по данным осуществляются операции БД, например, __фильтрация, сортировка, группировка и объединения__, то такие данные лучше хранить вне jsonb, в структуре самой БД
  - Это связано с тем, что Postgres __не умеет собирать статистику по внутренностям jsonb__, он рассматривает его только целиком, что обычно совершенно бессмысленно (можно отключать, так как статистика по __jsonb сильно раздувает таблицу статистики__)
  - [проблемы (2020) с OLTP нагрузкой](https://habr.com/ru/amp/publications/646987/)
  - примеры запросов (json_each, jsonb_to_record, jsonb_to_recordset) по [JSONB](https://habr.com/ru/companies/tensor/articles/771406/)
- [JSON](https://medium.com/geekculture/postgres-jsonb-usage-and-performance-analysis-cdbd1242a018)
- Сравнение с [MongoDB](https://habr.com/ru/companies/amvera/articles/757534/)
  - MongoDB
    - возможность легкого горизонтального масштабирования уже заложена в ее архитектуру
    - нет полного ACID
    - Встроенный валидатором схемы
    - обычно работает быстрее в том случае, если в операции задействованы различные объекты

Плюсы:

- Просто хранить не строго типизированную структуру
- Поддерживает индексы

Минусы:

- Сохранение медленее (конвертация в бинарный формат)
- Нет валидации на уровне БД
- Продолжается оптимизации производительности на уровне PGSQL
- Нужно применять правильные индексы на больших объемах данных
- Нужно тестировать с CITUS поддержку JSONB

## Функции

- Timeseries Data (pg_partman extension)
- [schema and data comparison tool for PostgreSQL](https://www.postgrescompare.com/)
- Партиционирование (Сеционирование) вертикальное - built in PGSQL
- Партиционирование горизонтальное - [Шардирование](../../arch/pattern/performance/shard.db.md) CITUS
  - [When to use Citus to shard Postgres?](https://www.citusdata.com/blog/2023/08/04/understanding-partitioning-and-sharding-in-postgres-and-citus/)

### Management

- PgAdmin
- [dbeaver](https://dbeaver.io/)

### Replication

- hot-standby потоковая [репликация](../../arch/pattern/sync.data.md)
- [log shipping](https://medium.com/@PinkOwl/postgresql-and-me-log-shipping-replication-6bc945757822)
- [Config](https://www.postgresql.org/docs/current/runtime-config-replication.html)

#### Log Shipping

- Master (Primary) -> Slave (standby or secondary)
  - accept connections and serves __read-only queries__ is called a __Hot Standby Server__
- [warm standby](https://www.postgresql.org/docs/current/warm-standby.html)
- [log shipping methodology](https://medium.com/@PinkOwl/postgresql-and-me-log-shipping-replication-6bc945757822)
  - File based log shipping - asynchronous in nature and logs are shipped after they have been written to disk and thus may increase the RTO
  - Record base log shipping (Streaming Replication) - data loss can be minimised

### Reporting Tools

- [Tools](https://www.postgresql.org/download/products/5/)
- [BIRT](https://eclipse.github.io/birt-website/)

### Hith Availability

- кластер PostgreSQL на [WAL репликации](https://habr.com/ru/companies/avito/articles/775922/)
  - на repmgr в [Docker и Testcontainers](https://habr.com/ru/articles/754168/)
  - Patroni
  - Stolon
- необходимо Distributed Key-Value хранилище (DCS_: etcd, Consul, ZooKeeper и Kubernetes API

### Мониторинг

- [Метрики производительности](postgresql.performance.metric.md)
- [Стандартные возможности](https://postgrespro.ru/docs/postgrespro/9.5/monitoring)

## Плюсы-минусы

- опытный специалист, обладающий достаточными компетенциями в настройке и оптимизации CentOS, файловой системы и самого PostgreSQL.
- На юникс быстрее чем виндовс

## Паттерны

### ETL PSQL2MSSQL

- ODBC Driver 17, [18](https://learn.microsoft.com/ru-ru/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver16&tabs=alpine18-install%2Calpine17-install%2Cdebian8-install%2Credhat7-13-install%2Crhel7-offline)
- DBLink
  - массовая загрузка [mssql bcp on linux](https://docs.microsoft.com/ru-ru/sql/linux/sql-server-linux-migrate-bcp?view=sql-server-ver16)
    - export the source data into __text files__
    - importing them using __BCP or BULK INSERT__
    - [Проблемы драйвера ODBC](https://learn.microsoft.com/ru-ru/sql/connect/odbc/linux-mac/known-issues-in-this-version-of-the-driver?view=sql-server-ver16)
  - [mssql sqlcmd on linux](https://docs.microsoft.com/ru-ru/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-ver16)
    - support any T-SQL? exec stored procedure
  - [sqlpipe](https://sqlpipe.com/transfer-data-from-postgresql-to-sql-server/) - free, open-source tool that can transfer the result of a query from one database to another:
    - A command-line tool
    - A long-lived server with an API and UI
  - MSSQL read data from PGSQL by [Linked Server](https://www.mssqltips.com/sqlservertip/3662/sql-server-and-postgresql-linked-server-configuration-part-2/)
- Ручной + Job
  - [ESF Database Migration Toolkit](https://www.dbsofts.com/articles/postgresql_to_sql_server/)
- WS
  - [Native Web Service до MSSQL 2012 поддерживает](https://www.developer.com/database/creating-native-web-services-in-sql-server/)

### ETL MSSQL2PSQL

- [foreign data wrapper](https://guriysamarin.medium.com/how-to-transfer-data-from-ms-sql-to-postgresql-or-good-design-vs-speed-1baad5665309)
  - [samole 1](https://habr.com/ru/company/postgrespro/blog/309490/)
  - [sample 2](https://www.mssqltips.com/sqlservertip/3663/sql-server-and-postgresql-foreign-data-wrapper-configuration-part-3/)

### Benchmark

- Open Source Tool
  - [HammerDB TPM](https://www.enterprisedb.com/blog/how-to-benchmark-postgresql-using-hammerdb-open-source-tool)
  - [Pgbench TPS vs Connection](https://www.enterprisedb.com/blog/pgbench-performance-benchmark-postgresql-12-and-edb-advanced-server-12)

### Блокировки Locks

- [Locky type by DELETE](https://pglocks.org/?pgcommand=DELETE)
- [Явные блокировки - режимы](https://postgrespro.ru/docs/postgrespro/9.5/explicit-locking) блокировки на уровне
  - таблицы
    - все и режимы блокировки __работают на уровне таблицы__, даже если имя режима содержит слово «__row__»; такие имена сложились исторически.
  - [строки](https://postgrespro.ru/docs/postgrespro/9.5/explicit-locking#locking-rows)
- системное представление pg_locks

## Миграция с MS SQL

- Compare [SSIS, SQLPipe, Airbyte, AWS Data pipeline](https://www.sqlpipe.com/blog/ssis-alternatives) в [таблице](https://docs.google.com/spreadsheets/d/16DrvIIczpy4V-4BzNvtI-IyNQfkU21GFX-JcWEjkf4A/edit#gid=0)

### Миграция с простоем

[Миграция](../../arch/pattern/refactoring/migration.md) "большим взрывом" с простоем

- Free
    - Через CSV
      - Эскпорт CSV MS SQL [bcp export](https://learn.microsoft.com/ru-ru/sql/tools/bcp-utility?view=sql-server-ver16)
      - Импорт CSV [Copy PostgresSQL](https://www.postgresql.org/docs/current/sql-copy.html)
    - [PostgresSQL TDS Foreign data wrapper for MS SQL](https://github.com/tds-fdw/tds_fdw)
    - [Pgloader](https://pgloader.io/)
    - [sqlserver2pgsql](https://github.com/dalibo/sqlserver2pgsql) Perl
      - great for one off database migrations, but it’s [not suitable for use cases that require continuous data synchronization](https://nuvalence.io/insights/microsoft-sql-server-to-postgresql-migration-using-sqlserver2pgsql/) between the source and target databases for an extended period of time.
      - [Пример docker + Pentaho Kettle](https://nuvalence.io/insights/microsoft-sql-server-to-postgresql-migration-using-sqlserver2pgsql/)
    - Bulk Loader?
      - Высокая скорость вставки (2-10 раз)
      - 120к строк\сек
      - 1Mb менее чем за 10сек
    - SQLPipe + [Airflow, Flower Docker пример](https://habr.com/ru/articles/512386/)
    - AWS Database Migration Service (DMS)  
      - TODO DMS
    - [SQL скрипты на схему и данные через CSV](https://github.com/yogimehla/SQLtoPostgresMigrationScript)

### Миграция без простоя Zero Downtime

Постепенная, __итеративная__ миграция - Zero Downtime

- Free
  - AWS [Babelfish](https://babelfishpg.org) - минус: __схемы БД не изменяются__
    - плагин PostgreSQL - поддержка T-SQL синтаксиса (приложение можно не переписывать сразу при смене СУБД) по протоколу TDS при миграции на СУБД PostgreSQL
    - план:
      - генерируется схема БД из MS SQL Managment
      - Compass проверяет схему на возможность миграции на PostgreSQL Babelfish
      - генерируется схема БД в PostgreSQL - __минус повторяет схему MSSQL без рефакторинга схем БД__
      - __миграция данных__ через AWS DMS
      - приложение направляет запросы в Babelfish в формате MSSQL T-SQL, BabelFish [конвертирует их в формате PostgreSQL](https://disk.yandex.ru/i/ovwejkZmzQ7_SA)
  - [CDC](../../arch/system.class/cdc.md) [Debezium](../../technology/cdc/debezium.md) используя Снимки (snapshots)
  - AWS SCT + Database Migration Service (DMS) - минус: __схемы БД не изменяются__
    - TODO DMS
    - [Пример MSSQL2PGSQL](https://transactts.com/complex-aws-migrations-sct/)
    - [Пример](https://www.youtube.com/watch?v=3oG_xewMpOM&ab_channel=CodeSpace)
    - [Пример](https://www.youtube.com/watch?v=3DcCX89Mz78&ab_channel=DotNext)
- Commercial
  - Без изменений исходного приложения [Albatros + AWS Babelfish + SQL Pipe](https://www.sqlpipe.com/blog/migrate-sql-server-to-postgresql) сравнение с AWS DMS и sqlserver2pgsql
  - [SQL Server to PostgreSQL converter](https://www.convert-in.com/mss2pgs.htm) need __equal structures__ DB
  - [MSSQL-PostgreSQL Sync](https://www.convert-in.com/m2psync.htm) need __equal structures__ DB

## Версии

- 13
- 14
