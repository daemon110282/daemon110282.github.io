# Шардирование Секционирование данных

## Зачем

- [Производительность](../../ability/performance.md)
- Авто партиционирование данных для удаления устаревших

## Паттерны

- Вертикальный - партиционирование-секционирование, одну таблицу на несколько [таблиц в одной субд](https://technet.microsoft.com/library/Cc966380)
  - Секция - [файл группы](http://sqlcom.ru/partition/partition-and-high-availability/)
- [MSSQL](https://docs.microsoft.com/ru-ru/sql/relational-databases/partitions/partitioned-tables-and-indexes)
- Горизонтальный - таблицы на разных субд
- [скользящее окно](http://www.sql.ru/articles/mssql/2005/073102partitionedtablesandindexes.shtml)

## Технологии

- MSSQL
- PosgreSQL расширение [CITUS](../../../technology/db/postgresql.citus.md)
