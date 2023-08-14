# MS SQL Server

- [MS SQL Server](#ms-sql-server)
	- [Масштабируемость](#масштабируемость)
	- [Паттерны](#паттерны)
	- [Производительность](#производительность)
		- [Виды ожиданий Wait statistics](#виды-ожиданий-wait-statistics)
	- [Мониторинг](#мониторинг)
	- [TODO](#todo)
	- [Version](#version)

## Масштабируемость

HA:

- Read Only Replica
  - [log-shipping or always on](https://dba.stackexchange.com/questions/199064/log-shipping-or-always-on-as-dr-for-sql-failover-cluster)
  	- AlwaysOn high availability group, HAG, is easier to maintain than log shipping
  	- Возможно больше трудностей с AlwaysOn, экспертиза DBA более высокая трубется

## Паттерны

- delete rows VS update rows state - удаление блокирующая и длительная операция
	- https://social.msdn.microsoft.com/Forums/sqlserver/en-US/d214f0ef-b995-4a14-bed9-0bf5b27a264c/performance-delete-rows-vs-update-rows-state?forum=transactsql
	- https://stackoverflow.com/questions/1271641/in-sql-is-update-always-faster-than-deleteinsert
	- https://dba.stackexchange.com/questions/8028/whats-better-for-large-changes-to-a-table-delete-and-insert-every-time-or-upd

## Производительность

- [Оценка производительности SQL Server](http://www.interface.ru/home.asp?artId=6968)
- [Benchmark](../benchmark.md)

Стратегии оптимизации запросов:

- можно использовать индексы
  - Не все индексы одинаково полезны. При разработке индексов необходимо учитывать их селективность
  - [Избыток может увеличить io wait](http://blogs.msmvps.com/gladchenko/2008/03/30/tips-for-dba-using-sys-dm_db_index_physicalstats-in-a-script-to-rebuild-or-reorganize-indexes-no-partitions-sql-server-2005/)
  - De-fragmentation of Index can help as more data can be obtained per page. (Assuming close to 100 fill-factor)
- другие варианты запроса
- сохранение промежуточных результатов
- Для проверки быстродействия запроса:	SET STATISTICS TIME ON
- Для проверки статистики ввода/вывода:	SET STATISTICS IO ON
- Для вывода плана запроса:	SET STATISTICS XML ON

Способ анализа производительности SQL Server:

1. Записать с помощью SQL Server Profiler (или AnjLab.SqlProfiler) запросы, исполняемые при запуске функции (например редактирование анкеты)
2. Добавить метки времени в начало и в конец запроса CONVERT(nvarchar(30), GETDATE(), 126)
3. Запустить скрипт на локальном сервере и на сервере разработчика
4. Вычислить времени выполнения на локальном сервере и на сервере разработчика (ручным способом)/ Результаты позволяют уверенно говорить о причинах медленной загрузки страниц (например редактирование анкеты) в браузере.

### Виды ожиданий Wait statistics

- Виды [ожиданий](https://msdn.microsoft.com/ru-ru/library/ms179984.aspx)
  - [SQL Wait Statistics скрипт](https://blog.sqlauthority.com/2021/03/08/sql-server-wait-stats-collection-scripts-updated-march-2021/?amp)
  - [PAGEIOLATCH_SH и PAGEIOLATCH_EX](https://blog.sqlauthority.com/2011/02/09/sql-server-pageiolatch_dt-pageiolatch_ex-pageiolatch_kp-pageiolatch_sh-pageiolatch_up-wait-type-day-9-of-28/)
    - см [нагружающие запросы по вводу/выводу](https://msdn.microsoft.com/ru-ru/magazine/cc135978.aspx)
  - [CXPACKET](https://blog.sqlauthority.com/2011/02/06/sql-server-cxpacket-parallelism-usual-solution-wait-type-day-6-of-28/)
    - [Advanced](https://blog.sqlauthority.com/2011/02/07/sql-server-cxpacket-parallelism-advanced-solution-wait-type-day-7-of-28/?amp)
  - Maxdop см и cost Threshold
  - LATCH_EX
  - LCK_M_IS - блокировка
  - [LCK_M_IX](https://www.sqlskills.com/help/waits/LCK_M_IX/) - блокировка
- [Локализация причин](https://www.google.ru/amp/s/blog.sqlauthority.com/2011/02/01/sql-server-wait-stats-wait-types-wait-queues-day-0-of-28-2/)

## Мониторинг

- Метрики
  - Database properties
  - Quick Stats
  - Database size
  - Performance counters
  - Memory break down
  - Database I/O
  - Database Latency
  - Availability Replica
- Use Grafana to monitor your [SQL Server + InfluxDB and Telegraf](https://tsql.tech/how-to-use-grafana-on-docker-to-monitor-your-sql-server-eventually-on-docker-too-feat-influxdb-and-telegraf/)
  - [Grafana Dashboard](https://grafana.com/grafana/dashboards/9386-sql-servers/)
  - [telegraf metric](https://github.com/influxdata/telegraf/tree/master/plugins/inputs/sqlserver)
- [sp_Blitz](https://github.com/BrentOzarULTD/SQL-Server-First-Responder-Kit/tree/main)
  - overall health check, run sp_Blitz.
  - To learn which queries have been using the most resources, run sp_BlitzCache.
  - To analyze which indexes are missing or slowing you down, run sp_BlitzIndex.
  - To find out why the server is slow right now, run sp_BlitzFirst.
- [MS: Мониторинг и настройка производительности](http://www.sql.ru/forum/actualthread.aspx?tid=858780)
  - [MS инструменты](https://learn.microsoft.com/en-us/sql/relational-databases/performance/performance-monitoring-and-tuning-tools?view=sql-server-ver15)
- Data collection - сбор авто метрик за период времени в отдельной БД с sqlplan.
  - Версия с 2008: используем 2012, DWH 2016
  - Блокировки
  - Настройки [СУБД get](https://www.mssqltips.com/sqlservertip/6090/sql-server-configuration-settings-query/)
    - SELECT * from sys.configurations ORDER BY name
  - Альтернатива [sp_Blitz](https://garrybargsley.com/2020/07/14/sp_blitz-for-all-servers/)
- [Мониторинг запросов, хранимых процедур и триггеров](https://habr.com/ru/articles/314494/)
  - AvgWorkerSec — само время выполнения запроса в секундах
  - AvgElapsedSec — время ожидания или ожидания + AvgWorkerSec
  - В результатах представлений важным показателем является следующее __равенство: AvgWorkerSec=AvgElapsedSec__
    - Если это не так, то __проблема не в самом запросе и не в плане запроса__
- [sp_WhoIsActive](https://habr.com/ru/articles/136481/) более подробная инф-я, кто что запустил
- [Dynamic Management Views](https://learn.microsoft.com/ru-ru/previous-versions/sql/sql-server-2005/ms188068(v=sql.90)?redirectedfrom=MSDN)

## TODO

- System view [dmv sql](http://www.sqlskills.com/blogs/paul/wait-statistics-or-please-tell-me-where-it-hurts/) 
  - минус показывают общую статистику, а не за период. При перезагрузке СУБД очищается

- http://f1incode.blogspot.com/2011/07/i_28.html	
- http://f1incode.blogspot.com/2011/08/performance-testing-part-2.html
- http://www.itcommunity.ru/Msgs/default.aspx?MessageID=60	
- http://msmvps.com/blogs/irinanaumova/archive/2011/05/06/1792775.aspx	
- http://www.mssqltips.com/tip.asp?tip=1039	

## Version

- 2012
- 2016
- 2019
