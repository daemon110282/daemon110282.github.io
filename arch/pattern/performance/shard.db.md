# Шардирование Секционирование (Партиционирование) данных

## Зачем

- [Производительность](../../ability/performance/performance.md) запросов
  - на __больших таблицах__, ускорение [поиска данных](https://severalnines.com/blog/guide-partitioning-data-postgresql/) (ускорение индекса на БД на меньших объемах данных)
- Удаление __устаревших данных__ (решение, например, проблемы vacuum в PGSQL)
- [Storage cost optimization](https://www.citusdata.com/blog/2023/08/04/understanding-partitioning-and-sharding-in-postgres-and-citus/)
- Compression

## Паттерны

- Вертикальный - партиционирование-секционирование, одну таблицу на несколько [таблиц в одной субд](https://technet.microsoft.com/library/Cc966380)
  - Секция - [файл группы](http://sqlcom.ru/partition/partition-and-high-availability/)
- [MSSQL](https://docs.microsoft.com/ru-ru/sql/relational-databases/partitions/partitioned-tables-and-indexes)
- Горизонтальный - таблицы на разных инстансах СУБД
- [скользящее окно](http://www.sql.ru/articles/mssql/2005/073102partitionedtablesandindexes.shtml)

## Технологии

- MSSQL
- PosgreSQL расширение [CITUS](../../../technology/db/postgresql/postgresql.citus.md)
