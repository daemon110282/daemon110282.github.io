# Индексы

- [Индексы](#индексы)
  - [Термины](#термины)
  - [Паттерны](#паттерны)
    - [Удаление не используемых индексов](#удаление-не-используемых-индексов)
    - [Missing Index](#missing-index)
  - [Рекомендации по выбору таблиц и столбцов для создания индексов](#рекомендации-по-выбору-таблиц-и-столбцов-для-создания-индексов)
  - [Рекомендации по использованию кластерных или некластерных индексов](#рекомендации-по-использованию-кластерных-или-некластерных-индексов)

## Термины

- __Кластеризованный индекс__
  - сортирует и __хранит строки данных таблицы__ или представления в __порядке__, определяемом [ключом кластеризованного индекса](https://learn.microsoft.com/ru-ru/sql/relational-databases/indexes/indexes?view=sql-server-ver16)
  - реализуется в виде __сбалансированного дерева__, которое поддерживает быстрое получение строк по значениям ключа кластеризованного индекса.
- __Некластеризованный индекс__
  - можно определить в таблице или представлении вместе с __кластеризованным индексом__ или в __куче__
  - Каждая строка некластеризованного индекса содержит некластеризованное ключевое значение и __указатель на строку__. Этот указатель определяет строку данных кластеризованного индекса или кучи, содержащую ключевое значение.
- __Кучей__
  - является таблица __без кластеризованного индекса__. Для таблиц, сохраненных как куча, может быть создан один или несколько некластеризованных индексов. Данные хранятся в куче __без указания порядка__.

## Паттерны

- Не все индексы одинаково полезны. При разработке индексов необходимо учитывать их __селективность__
  - Sorts can be limited with index usage. That is, a certain sort order is supported by an index that is sorted the same way, either ascending or descending.
- Using [sys.dm_db_index_physical_stats](http://blogs.msmvps.com/gladchenko/2008/03/30/tips-for-dba-using-sys-dm_db_index_physicalstats-in-a-script-to-rebuild-or-reorganize-indexes-no-partitions-sql-server-2005/) in a script to
  - rebuild
  - or reorganize indexes (no partitions / SQL Server 2005)
- [Избыток индексов может увеличить io wait](http://blogs.msmvps.com/gladchenko/2008/03/30/tips-for-dba-using-sys-dm_db_index_physicalstats-in-a-script-to-rebuild-or-reorganize-indexes-no-partitions-sql-server-2005/)
- __De-fragmentation of Index__ can help as more data can be obtained per page. (Assuming close to 100 fill-factor)
  - [ALTER INDEX REBUILD](https://infostart.ru/1c/articles/2017724/) блокирует таблицу на время выполнения
- Измените подходящие для Вашего сервера __опции ONLINE , SORT_IN_TEMPDB,
MAXDOP=10__
  - Помним про 3-х повышение производительности при использовании в 2012 и в 2014 SORT_IN_TEMPDB=ON SQL Server 2014. [TEMPDB Hidden Performance Gem](https://techcommunity.microsoft.com/t5/sql-server-support-blog/sql-server-2014-tempdb-hidden-performance-gem/ba-p/318255)  
- [Анализ __плана выполнения__](mssql.md#query-plan) после применения индексов: Scan, Seek, Lookup

### Удаление не используемых индексов 

Unused index

- Влияет на объем БД, скорость операций чтения, изменения данных
  - для __уменьшения физического объема БД__ необходимо (место после удаления попадает в unalocated область БД и используется уже данными)
    - ALTER TABLE myHeap REBUILD;
    - for clustered indexes: ALTER INDEX IX_myIndex ON myTable REBUILD;
- sys.dm_db_index_usage_stats
  - условия отбора по [UserSeek и UserScans и UserLookups](https://learn.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-db-index-usage-stats-transact-sql?view=sql-server-ver16) __почти везде нули__, что означает, что индексы не используются СУБД для работы, количество же вставок UserUpdates в них очень __велико__
  - перезапуск службы SQL Server __сбрасывает данные__ в sys.dm_db_index_usage_stats

### Missing Index

Упрощенное средство для __[поиска отсутствующих некластеризованных индексов](https://learn.microsoft.com/ru-ru/sql/relational-databases/indexes/tune-nonclustered-missing-index-suggestions?view=sql-server-ver16)__, которые могут значительно __повысить производительность запросов__:

  - имеет [ограничения](https://learn.microsoft.com/ru-ru/sql/relational-databases/indexes/tune-nonclustered-missing-index-suggestions?view=sql-server-ver16#limitations-of-the-missing-index-feature) и нужно тестировать предложения
    - Предложения отсутствующих индексов __не являются точными инструкциями__ по созданию индексов.
    - msqsql dmv __сбрасываются при перезапуске SQL Server__
  - параметры
    - длительность выполения запроса - elapsed_time
    - длительность обработки запроса CPU - cpu_time
    - длительность ожидания обработки запроса - wait_time = elapsed_time - cpu_time
    - [user_seeks](https://learn.microsoft.com/en-us/sql/relational-databases/system-dynamic-management-views/sys-dm-db-index-usage-stats-transact-sql?view=sql-server-ver16)
    - user_scans
    - логических операций чтения - logical_reads
    - логических операций записи - logical_writes
    - общая стоимость запроса для пользователя - avg_total_user_cost
    - эффект на пользователя - avg_user_impact
    - ожидаемый эффект - estimated_improvement = avg_total_user_cost * avg_user_impact * (user_seeks + user_scans)

Критерии проранжированы по сумме 4х значений: 

-	кол-во использования запросов uses
-	предполагаемый импакт от будущего индекса Impact
-	стоимость запроса - кол-во ЦПУ затрачиваемого на один запрос Avg query cost
- score

Предложения отсутствующих индексов в планах выполнения могут храниться для этих событий благодаря [хранилищу запросов](mssql.QS.md) Query Store.

__Проверить__ изменения индексов можно с помощью [хранилища запросов](mssql.QS.md) Query Store для обнаружения запросов по отсутствующим индексам.

## Рекомендации по выбору таблиц и столбцов для создания индексов

- __Не индексировать__
  - Таблицы с небольшим количеством строк
  - Столбцы, редко используемые в запросах
  - Столбцы, хранящие широкий диапазон значений и имеющие малую вероятность быть выбранными в типичном запросе
  - Столбцы, имеющие большой размер в байтах
  - Таблицы, где данные часто изменяются, но относительно редко считываются
- __Индексировать__
  - Таблицы с большим количеством строк
  - Столбцы, часто используемые в запросах
  - Столбцы, хранящие широкий диапазон значений и имеющие большую вероятность быть выбранными в типичном запросе
  - Столбцы, используемые в агрегатных функциях
  - Столбцы, применяемые в предложении GROUP BY
  - Столбцы, применяемые в предложении ORDER BY
  - Столбцы, используемые в соединениях таблиц

## Рекомендации по использованию кластерных или некластерных индексов

![logic](../../../img/technology/db/mssql/sql.clustered.index.png)

- Использовать __кластерный индекс__ для
  - __Первичных ключей__, часто [используемых при поиске, например номеров счетов](https://learn.microsoft.com/ru-ru/sql/relational-databases/sql-server-index-design-guide?view=sql-server-ver16#Clustered)
  - Запросов, возвращающих [обширные результирующие наборы](https://learn.microsoft.com/ru-ru/sql/relational-databases/sql-server-index-design-guide?view=sql-server-ver16#Nonclustered)
  - Столбцов, используемых во многих запросах
  - Столбцов с высокой селективностью
  - Столбцов, применяемых в предложениях ORDER BY или GROUP BY
  - Столбцов, используемых в соединениях таблиц
- Использовать __некластерный индекс__ для
  - Первичных ключей, хранящих последовательные значения идентификаторов, например идентификационных столбцов
  - Запросов, возвращающих небольшие результирующие наборы
  - Столбцов, используемых в агрегатных функциях
  - Внешних ключей


