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
- Авто партиционирование данных для удаления устаревших
- [schema and data comparison tool for PostgreSQL](https://www.postgrescompare.com/)

### Термины

- RTO - [Recovery Time Objective](https://en.wikipedia.org/wiki/Disaster_recovery#Recovery_Time_Objective)

### Management

- PgAdmin
- [dbeaver](https://dbeaver.io/)

### Replication

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

- PSQL2MSSQL
  - [mssql bcp on linux](https://docs.microsoft.com/ru-ru/sql/linux/sql-server-linux-migrate-bcp?view=sql-server-ver16)
  - [mssql sqlcmd on linux](https://docs.microsoft.com/ru-ru/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-ver16)
    - support any T-SQL? exec stored procedure
  - [sqlpipe](https://sqlpipe.com/transfer-data-from-postgresql-to-sql-server/)
  - [Native Web Service до MSSQL 2012 поддерживает](https://www.developer.com/database/creating-native-web-services-in-sql-server/)
  - [Linked Server](https://www.mssqltips.com/sqlservertip/3662/sql-server-and-postgresql-linked-server-configuration-part-2/)
  - [ESF Database Migration Toolkit](https://www.dbsofts.com/articles/postgresql_to_sql_server/)
- MSSQL2PSQL
  - [foreign data wrapper](https://guriysamarin.medium.com/how-to-transfer-data-from-ms-sql-to-postgresql-or-good-design-vs-speed-1baad5665309) 
    - https://habr.com/ru/company/postgrespro/blog/309490/
    - https://www.mssqltips.com/sqlservertip/3663/sql-server-and-postgresql-foreign-data-wrapper-configuration-part-3/
