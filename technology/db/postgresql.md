# Postgresql

- [Postgresql](#postgresql)
  - [Термины](#термины)
  - [Функции](#функции)
    - [Management](#management)
    - [Replication](#replication)
      - [Log Shipping](#log-shipping)
    - [Reporting Tools](#reporting-tools)
  - [Плюсы-минусы](#плюсы-минусы)
  - [Паттерны](#паттерны)
    - [ETL PSQL2MSSQL](#etl-psql2mssql)
    - [ETL MSSQL2PSQL](#etl-mssql2psql)
    - [Миграция с MS SQL](#миграция-с-ms-sql)
      - [Миграция с простоем](#миграция-с-простоем)
      - [Миграция без простоя Zero Downtime](#миграция-без-простоя-zero-downtime)

## Термины

- RTO - [Recovery Time Objective](https://en.wikipedia.org/wiki/Disaster_recovery#Recovery_Time_Objective)

## Функции

- Timeseries Data (pg_partman extension)
- [schema and data comparison tool for PostgreSQL](https://www.postgrescompare.com/)
- [Шардирование](../../arch/pattern/performance/shard.db.md) CITUS
- Json/jsonb тип колонки

### Management

- PgAdmin
- [dbeaver](https://dbeaver.io/)

### Replication

- hot-standby потоковая [репликация](../../arch/pattern/sync.data.md)
- https://medium.com/@PinkOwl/postgresql-and-me-log-shipping-replication-6bc945757822
- [Config](https://www.postgresql.org/docs/current/runtime-config-replication.html)

#### Log Shipping

- Master (Primary) -> Slave (standby or secondary) 
  - accept connections and serves **read-only queries** is called a **Hot Standby Server**
- https://www.postgresql.org/docs/current/warm-standby.html
- [log shipping methodology](https://medium.com/@PinkOwl/postgresql-and-me-log-shipping-replication-6bc945757822)
  - File based log shipping - asynchronous in nature and logs are shipped after they have been written to disk and thus may increase the RTO
  - Record base log shipping (Streaming Replication) - data loss can be minimised

### Reporting Tools

- [Tools](https://www.postgresql.org/download/products/5/)
- [BIRT](https://eclipse.github.io/birt-website/)

## Плюсы-минусы

- опытный специалист, обладающий достаточными компетенциями в настройке и оптимизации CentOS, файловой системы и самого PostgreSQL.
- На юникс быстрее чем виндовс

## Паттерны

### ETL PSQL2MSSQL

- (ODBC Driver 17, [18](https://learn.microsoft.com/ru-ru/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver16&tabs=alpine18-install%2Calpine17-install%2Cdebian8-install%2Credhat7-13-install%2Crhel7-offline))
- DBLink
  - [mssql bcp on linux](https://docs.microsoft.com/ru-ru/sql/linux/sql-server-linux-migrate-bcp?view=sql-server-ver16)
    - [Проблемы драйвера ODBC](https://learn.microsoft.com/ru-ru/sql/connect/odbc/linux-mac/known-issues-in-this-version-of-the-driver?view=sql-server-ver16)
  - [mssql sqlcmd on linux](https://docs.microsoft.com/ru-ru/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-ver16)
    - support any T-SQL? exec stored procedure
  - [sqlpipe](https://sqlpipe.com/transfer-data-from-postgresql-to-sql-server/) - free, open-source tool that can transfer the result of a query from one database to another:
    - A command-line tool
    - A long-lived server with an API and UI
  - [Linked Server](https://www.mssqltips.com/sqlservertip/3662/sql-server-and-postgresql-linked-server-configuration-part-2/)
- Ручной + Job
  - [ESF Database Migration Toolkit](https://www.dbsofts.com/articles/postgresql_to_sql_server/)
- WS
  - [Native Web Service до MSSQL 2012 поддерживает](https://www.developer.com/database/creating-native-web-services-in-sql-server/)
- export the source data into text files and importing them using BCP or BULK INSERT.

### ETL MSSQL2PSQL

- [foreign data wrapper](https://guriysamarin.medium.com/how-to-transfer-data-from-ms-sql-to-postgresql-or-good-design-vs-speed-1baad5665309) 
  - https://habr.com/ru/company/postgrespro/blog/309490/
  - https://www.mssqltips.com/sqlservertip/3663/sql-server-and-postgresql-foreign-data-wrapper-configuration-part-3/

### Миграция с MS SQL

- Compare [SSIS, SQLPipe, Airbyte, AWS Data pipeline](https://www.sqlpipe.com/blog/ssis-alternatives) в [таблице](https://docs.google.com/spreadsheets/d/16DrvIIczpy4V-4BzNvtI-IyNQfkU21GFX-JcWEjkf4A/edit#gid=0)

#### Миграция с простоем

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

#### Миграция без простоя Zero Downtime

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