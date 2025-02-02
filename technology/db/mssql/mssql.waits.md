# Ожидания Waits statistics

[Waits statistics](https://learn.microsoft.com/ru-ru/sql/relational-databases/performance-monitor/sql-server-wait-statistics-object?view=sql-server-ver16) - содержит счетчики производительности, сообщающие сведения о состояниях __ожидания__ различных категорий

Категории:

- CPU
	- Thread-safe memory objects waits
	- Wait for the worker

## Виды ожиданий Wait statistics

Виды [ожиданий](https://msdn.microsoft.com/ru-ru/library/ms179984.aspx):

### IO

- [PAGEIOLATCH_SH и PAGEIOLATCH_EX](https://blog.sqlauthority.com/2011/02/09/sql-server-pageiolatch_dt-pageiolatch_ex-pageiolatch_kp-pageiolatch_sh-pageiolatch_up-wait-type-day-9-of-28/)
- см [нагружающие запросы по вводу/выводу](https://msdn.microsoft.com/ru-ru/magazine/cc135978.aspx)
- [ASYNC_IO_COMPLETION](https://www.sqlskills.com/help/waits/ASYNC_IO_COMPLETION/) - Возникает, когда задача ожидает завершения ввода-вывода

### CPU, CPU Parallelizm

- [CXPACKET](https://blog.sqlauthority.com/2011/02/06/sql-server-cxpacket-parallelism-usual-solution-wait-type-day-6-of-28/) - Означает параллелизм, но не обязательно в нем проблема
	- [Advanced](https://blog.sqlauthority.com/2011/02/07/sql-server-cxpacket-parallelism-advanced-solution-wait-type-day-7-of-28/?amp)
	- Если у нас транзакционная система: имеет смысл установить Max Degree Parallelism = 1
	- Хранилища и витрины данных: установить Max Degree Parallelism = 0 или явное количество CPU
	- Смешанные: установить Max Degree Parallelism = 1 , a y запросов требующих параллелизма установить hint MAXDOP=0
	- Параллелизм Maxdop и cost Threshold
- THREADPOOL - Такой тип говорит, что __недостаточно рабочих потоков__ в системе для того, чтобы удовлетворить запрос. Обычно причина в большом количестве сильно параллелизованных запросов, пытающихся выполниться. 
- SOS_SCHEDULER_YIELD - Имеет место, когда задача добровольно __отказывается от выполнения планировщиком в пользу других задач__. Во время этого ожидания задача ожидается в очереди запуска для возобновления квантового кванта, т. е., ожидая, чтобы он снова выполнялся на ЦП. Длительные ожидания этого типа ожидания чаще всего указывают возможности оптимизации запросов, выполняющих сканирование индекса или таблицы.

### Locks

- [LATCH_XX](http://www.sqlskills.com/blogs/paul/wait-statistics-or-please-tell-me-where-it-hurts/)
- LCK_M_XX - блокировка
- [LCK_M_IX](https://www.sqlskills.com/help/waits/LCK_M_IX/) - блокировка
- [PREEMPTIVE_XE_DISPATCHER](https://blog.sqlauthority.com/2011/02/19/sql-server-preemptive-and-non-preemptive-wait-type-day-19-of-28/) - связано с фоновыми потоками расширенных событий [Extended Events](mssql.extended.events.md)

### Network

- [ASYNC_NETWORK_IO](https://habr.com/ru/articles/216309/) - SQL Server ждет, пока клиент закончит получать данные

## Паттерны

- Исторически Wait Statistics
  - [SQL Wait Statistics скрипт](https://blog.sqlauthority.com/2021/03/08/sql-server-wait-stats-collection-scripts-updated-march-2021/?amp)
  - [IO waits by query, database](https://docs.microsoft.com/ru-ru/archive/msdn-magazine/2008/january/sql-server-uncover-hidden-data-to-optimize-application-performance)