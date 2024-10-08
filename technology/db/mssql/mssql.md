# MS SQL Server

- [MS SQL Server](#ms-sql-server)
  - [Масштабируемость](#масштабируемость)
  - [Паттерны](#паттерны)
    - [Секционирование](#секционирование)
  - [Производительность](#производительность)
    - [Способы анализа производительности](#способы-анализа-производительности)
      - [SQL Trace Profiler (Deprecated)](#sql-trace-profiler-deprecated)
      - [Benchmark Load Test](#benchmark-load-test)
      - [Стратегии оптимизации запросов](#стратегии-оптимизации-запросов)
    - [Настройки](#настройки)
      - [Параллелизм MAXDOP](#параллелизм-maxdop)
  - [Мониторинг](#мониторинг)
    - [Онлайн](#онлайн)
    - [Исторически](#исторически)
  - [Performance Reports](#performance-reports)
  - [TODO](#todo)
  - [Version](#version)
    - [2019](#2019)

## Масштабируемость

HA:

- Read Only Replica
  - log-shipping
  - Always On Group из за использования возможности чтения со вторичной реплики (read-intent access)
    - Увеличение в скорости формирования в два и более раза, возможность использования maxdop
    - Не потребляются ресурсы первичной реплики
      - tempdb
      - Сеть
      - I/O
      - CPU
  - [Log-shipping VS Always on](https://dba.stackexchange.com/questions/199064/log-shipping-or-always-on-as-dr-for-sql-failover-cluster)
  	- AlwaysOn High Availability Group (HAG), is easier to maintain than log shipping
  	- Возможно больше трудностей с AlwaysOn, экспертиза DBA более высокая трубется

## Паттерны

- delete rows VS update rows state - удаление __блокирующая и длительная операция__
	- [TODO](https://social.msdn.microsoft.com/Forums/sqlserver/en-US/d214f0ef-b995-4a14-bed9-0bf5b27a264c/performance-delete-rows-vs-update-rows-state?forum=transactsql)
	- [TODO](https://stackoverflow.com/questions/1271641/in-sql-is-update-always-faster-than-deleteinsert)
	- [TODO](https://dba.stackexchange.com/questions/8028/whats-better-for-large-changes-to-a-table-delete-and-insert-every-time-or-upd)

### Секционирование

[Секционирование](https://habr.com/ru/articles/464665/) (партиционирование горизонтальное)

- отдельные FileGroup под хранение партиции
- пример [INSERT](https://www.tutorialgateway.org/table-partitioning-in-sql-server/), [SELECT](https://www.sqlservertutorial.net/sql-server-administration/sql-server-table-partitioning/)
- [Partition details with Row count](https://www.sqlshack.com/how-to-automate-table-partitioning-in-sql-server/), Table Rows with Partition Number
- [Automate the Partition flow](https://www.sqlshack.com/how-to-automate-table-partitioning-in-sql-server/)
- Минусы
  - миграции БД не поддерживаются? Необходимо вручную обновлять партиции

## Производительность

Зависит от:

- [Настроек OS, SQL Server](#настройки)
  - Сервер [Uptime](https://www.sqlshack.com/different-ways-to-check-sql-server-uptime/)
- [Блокировки](mssql.locks.md)
  - Blocking can be reduced with __index design__ and __short transactions__.
- [Индексирование](mssql.index.md)
  - REBUILD индексов (INDEX REORGANIZE не рекомендуется на больших объемах БД)
- [Стратегии оптимизации запросов](#стратегии-оптимизации-запросов)
- Дизайна (архитектуры) приложения
- Обслуживания БД
  - __SHRINK__ [не всегда хорошо на больших БД](https://habr.com/ru/articles/741212/)
  - Rebuild table
  - Clear statistics
  - Index by table uses in night
- __[SQL Plan](mssql.queryplan.md)__  
  - CPU can be reduced with __plan reuse__ and __join reduction__
- __IO__ performance
  - can be reduced with good __indexing__, __join reduction__, and __high page life expectancy__.
- Memory
  - is optimal when there are no sudden drops in __Page Life Expectancy__

### Способы анализа производительности

- [Оценка производительности SQL Server](http://www.interface.ru/home.asp?artId=6968)
  - TODO [Анализ медленных запросов](https://learn.microsoft.com/ru-ru/troubleshoot/sql/database-engine/performance/troubleshoot-slow-running-queries?source=recommendations)
- [MS инструменты](https://learn.microsoft.com/en-us/sql/relational-databases/performance/performance-monitoring-and-tuning-tools?view=sql-server-ver15)
  - [Performance Report](#performance-reports)
  - Data Collection
  - [Extended Events](mssql.extended.events.md)
  - [DMV](mssql.dmv.md)
  - [Query Store](mssql.QS.md)
  - [SQL Trace Profiler (deprecated)](#sql-trace-profiler-deprecated)
  - QTA
- [Мониторинг](#мониторинг)
- [Benchmark](#benchmark-load-test)

#### SQL Trace Profiler (Deprecated)

1. Записать с помощью SQL Server Profiler (или AnjLab.SqlProfiler) запросы, исполняемые при запуске функции (например редактирование анкеты)
2. Добавить метки времени в начало и в конец запроса CONVERT(nvarchar(30), GETDATE(), 126)
3. Запустить скрипт на локальном сервере и на сервере разработчика
4. Вычислить времени выполнения на локальном сервере и на сервере разработчика (ручным способом)/ Результаты позволяют уверенно говорить о причинах медленной загрузки страниц (например редактирование анкеты) в браузере.

- Аналитический отчёт по [трейсу Microsoft SQL Server tutorial](http://habrahabr.ru/post/243587/)

#### Benchmark Load Test

- [Benchmark](../../benchmark.md)
  - [Тестирование производительности баз данных при помощи tSQLt и SQLQueryStress](https://habr.com/ru/articles/310328/)

#### Стратегии оптимизации запросов

- можно использовать [индексы](mssql.index.md)
- другие варианты запроса
  - To write __sargable queries__:
    - Avoid using functions or calculations on indexed columns in the WHERE clause
    - Use direct comparisons when possible, instead of wrapping the column in a function
    - If we need to use a function on a column, consider creating a computed column or a function-based index, if the database system supports it
- сохранение промежуточных результатов
- Для проверки быстродействия запроса:	SET STATISTICS TIME ON
- Для проверки статистики ввода/вывода:	SET STATISTICS IO ON
- Для вывода плана запроса:	SET STATISTICS XML ON

### Настройки

- Настройки [СУБД get](https://www.mssqltips.com/sqlservertip/6090/sql-server-configuration-settings-query/)
  - SELECT * from sys.configurations ORDER BY name

#### Параллелизм MAXDOP

- SQL OLTP Max degree of parall [maxdop](https://habr.com/ru/post/448044/)
  - __Max Degree of Parallelism__ - задает максимальное количество потоков, которые могут быть выделены каждому запросу (по умолчанию стоит 0-ограничение только самой операционной системой и редакцией MS SQL Server)
  - __Cost Threshold for Parallelism__ - оценочная стоимость параллелизма (по умолчанию стоит 5)
  - __Max DOP__ - задает максимальное количество потоков, которые могут быть выделены каждому запросу на уровне базы данных (но не более, чем значение свойства «Max Degree of Parallelism») (по умолчанию стоит 0-ограничение только самой операционной системой и редакцией MS SQL Server, а также ограничение по свойству «Max Degree of Parallelism» всего экземпляра MS SQL Server)
- Для выявления __нехватки процессорного времени__ достаточно воспользоваться системным представлением __sys.dm_os_schedulers__.
  - показатель runnable_tasks_count постоянно больше 1, то существует большая вероятность того, что количество ядер не хватает экземпляру MS SQL Server.
  - select max([runnable_tasks_count]) as [runnable_tasks_count] from sys.dm_os_schedulers where scheduler_id<255;
- алгоритм действий для __OLTP__-систем для настройки свойств параллелизма:
  - сначала запретить параллелизм, выставив на уровне всего экземпляра Max Degree of Parallelism в 1
  - проанализировать самые тяжелые запросы и подобрать для них оптимальное количество потоков
  - выставить Max Degree of Parallelism в подобранное оптимальное количество потоков, полученное из п.2, а также для конкретных баз данных выставить Max DOP значение, полученное из п.2 для каждой базы данных
  - проанализировать самые тяжелые запросы и выявить негативный эффект от многопоточности. Если он есть, то повышать __Cost Threshold for Parallelism__.
  - Для таких систем как 1С, Microsoft CRM и Microsoft NAV в большинстве случаев [подойдет запрет многопоточности](https://its.1c.ru/db/metod8dev#content:5945:hdoc)
- [Как определить maxdop](https://www.sentryone.com/blog/is-maxdop-configured-correctly)
  - I set the __Maximum Degree of Parallelism__ to 2, which means the query still uses __parallelism but only on 2 CPUs__.
  - However, I keep the __Cost Threshold for Parallelism__ very high. This way, not all the queries will qualify for parallelism but __only the query with higher cost will go for parallelism__. I have found this to work best for a system that has OLTP queries and also where the reporting server is set up.

## Мониторинг

- [MS: Мониторинг и настройка производительности](http://www.sql.ru/forum/actualthread.aspx?tid=858780)
- [Performance dashboard](#performance-reports)
- [Метрики](mssql.performance.metric.md)

### Онлайн

- sp_check_query - mssql default
- [sp_Blitz](https://github.com/BrentOzarULTD/SQL-Server-First-Responder-Kit/tree/main)
  - To find out why the server is slow right now, run sp_BlitzFirst.
- Sp_Who2
- [sp_WhoIsActive](https://habr.com/ru/articles/136481/) более подробная инф-я, кто что запустил
- Общая статистика без детализации до запросов, планов выполнения [SQL Server + InfluxDB and Telegraf](https://tsql.tech/how-to-use-grafana-on-docker-to-monitor-your-sql-server-eventually-on-docker-too-feat-influxdb-and-telegraf/)
  - [Grafana Dashboard](https://grafana.com/grafana/dashboards/9386-sql-servers/)
  - [telegraf metric](https://github.com/influxdata/telegraf/tree/master/plugins/inputs/sqlserver)
- [Dynamic Management Views](mssql.dmv.md)

### Исторически

- Стандартные отчеты [Performance dashboard](#performance-reports)  
- [sp_Blitz](https://github.com/BrentOzarULTD/SQL-Server-First-Responder-Kit/tree/main)
  - overall health check, run sp_Blitz.
  - To learn which queries have been using the most resources, run sp_BlitzCache.
  - To analyze which indexes are missing or slowing you down, run sp_BlitzIndex.
  - [Мониторинг нескольких серверов](https://garrybargsley.com/2020/07/14/sp_blitz-for-all-servers/)
- [Мониторинг запросов, хранимых процедур и триггеров](https://habr.com/ru/articles/314494/)
  - AvgWorkerSec — само время выполнения запроса в секундах
  - AvgElapsedSec — время ожидания или ожидания + AvgWorkerSec
  - В результатах представлений важным показателем является следующее __равенство: AvgWorkerSec=AvgElapsedSec__
    - Если это не так, то __проблема не в самом запросе и не в плане запроса__

## Performance Reports

- Стандартные отчеты [Performance dashboard](https://learn.microsoft.com/en-us/sql/relational-databases/performance/performance-dashboard)
  - Performance
    - Top Queries by Average IO
    - Top Queries by Average CPU Time
    - Object Execution Statistics
    - Missing Index
    - IO Statistics
    - Expensive Queries – Duration
- __Data Collection__  - сбор авто метрик за период времени в отдельной БД с sql plan
  - Query Statistics History: by CPU, duration, IO, Physical Reads, Logical Reads
  - Server Activity History: CPU, RAM, IO, Network, Waits
  - Версия MS SQL с 2008: используем 2012, DWH 2016
  - [Блокировки Dead Locks](mssql.locks.md)
  - [Waits](mssql.waits.md) - ожидания
  - [Latches](mssql.latches.md) - внутренние блокировки

## TODO

- http://f1incode.blogspot.com/2011/07/i_28.html
- http://f1incode.blogspot.com/2011/08/performance-testing-part-2.html
- http://www.itcommunity.ru/Msgs/default.aspx?MessageID=60
- http://msmvps.com/blogs/irinanaumova/archive/2011/05/06/1792775.aspx
- http://www.mssqltips.com/tip.asp?tip=1039

## Version

- [2012](https://sqlserverbuilds.blogspot.com/2012/01/sql-server-2012-versions.html) 11.0.x.x
  - use 11.0.6579.0
- [2014](https://sqlserverbuilds.blogspot.com/2014/01/sql-server-2014-versions.html) 12.0.x.x
  - Always On Availability Groups
- 2016
  - use CTI
  - Query Store

### 2019

Плюсы:

- добавляет много интересных [улучшений в производительности](https://otus.ru/nest/post/1182/), когда вы включаете режим совместимости с 2019
  - [function](https://www.brentozar.com/archive/2018/11/sql-server-2019-faster-functions/)
  - [Faster Table Variables](https://www.brentozar.com/archive/2018/09/sql-server-2019-faster-table-variables-and-new-parameter-sniffing-issues/)
- Query Store
  - Custom capture policy for Query Store
- [In-Memory Database](https://learn.microsoft.com/en-us/sql/sql-server/what-s-new-in-sql-server-2019?view=sql-server-ver15&preserve-view=true)
- Linux better Support
  - CDC
- k8s Containers

Минусы:

- больше нет Service Pack, только Cumulative Updates

Upgrade

- [Process Support 2012SP4 to 2019](https://learn.microsoft.com/ru-ru/sql/database-engine/install-windows/supported-version-and-edition-upgrades-2019?view=sql-server-ver16)
