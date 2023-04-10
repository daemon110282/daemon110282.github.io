# Postgresql

- [Postgresql](#postgresql)
  - [Функции](#функции)
    - [Термины](#термины)
    - [Management](#management)
    - [Replication](#replication)
      - [Log Shipping](#log-shipping)
    - [Reporting Tools](#reporting-tools)
  - [Паттерны](#паттерны)
    - [ETL MSSQL](#etl-mssql)

## Функции

- Timeseries Data (pg_partman extension)
- [schema and data comparison tool for PostgreSQL](https://www.postgrescompare.com/)
- Шардирование (CITUS)
  - Вертикальный - партиционирование-секционирование, одну таблицу на несколько таблиц в одной субд
    - Авто партиционирование данных для удаления устаревших
  - Горизонтальный - таблицы на разных субд


### Термины

- RTO - [Recovery Time Objective](https://en.wikipedia.org/wiki/Disaster_recovery#Recovery_Time_Objective)

### Management

- PgAdmin
- [dbeaver](https://dbeaver.io/)

### Replication

- hot-standby потоковая репликация
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

## Паттерны

### ETL MSSQL

- PSQL2MSSQL (ODBC Driver 17, [18](https://learn.microsoft.com/ru-ru/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver16&tabs=alpine18-install%2Calpine17-install%2Cdebian8-install%2Credhat7-13-install%2Crhel7-offline))
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
- MSSQL2PSQL
  - [foreign data wrapper](https://guriysamarin.medium.com/how-to-transfer-data-from-ms-sql-to-postgresql-or-good-design-vs-speed-1baad5665309) 
    - https://habr.com/ru/company/postgrespro/blog/309490/
    - https://www.mssqltips.com/sqlservertip/3663/sql-server-and-postgresql-foreign-data-wrapper-configuration-part-3/
