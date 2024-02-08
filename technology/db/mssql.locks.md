# Блокировки

Если в системе установлен бесконечный период ожидания завершения транзакции (а это задано по умолчанию), то при возникновении deadlock для двух транзакций вполне возможно, что, ожидая освобождения заблокированных ресурсов, в тупике окажутся и новые транзакции. 

Чтобы избежать подобных проблем, в среде MS SQL Server реализован специальный механизм разрешения конфликтов тупикового блокирования. 
Для этих целей сервер снимает одну из блокировок, вызвавших конфликт, и откатывает инициализировавшую ее транзакцию. При выборе блокировки, которой необходимо пожертвовать, сервер исходит из соображений минимальной стоимости. 

## Паттерны

- Deadlock
- Lock Escalation
  - через [Extended Events](mssql.extended.events.md)
- Online
  - [Моментальный снимок ожидающих задач](https://www.sqlskills.com/blogs/paul/updated-sys-dm_os_waiting_tasks-script-to-correctly-parse-nodeid/)
  - [wait by CPU](https://docs.microsoft.com/ru-ru/archive/msdn-magazine/2008/january/sql-server-uncover-hidden-data-to-optimize-application-performance)
- Исторически
  - [SQL Wait Statistics скрипт](https://blog.sqlauthority.com/2021/03/08/sql-server-wait-stats-collection-scripts-updated-march-2021/?amp)
  - [IO waits by query, database](https://docs.microsoft.com/ru-ru/archive/msdn-magazine/2008/january/sql-server-uncover-hidden-data-to-optimize-application-performance)
- [Локализация причин](https://www.google.ru/amp/s/blog.sqlauthority.com/2011/02/01/sql-server-wait-stats-wait-types-wait-queues-day-0-of-28-2/)
  - System view [DMV sql](http://www.sqlskills.com/blogs/paul/wait-statistics-or-please-tell-me-where-it-hurts/) 

## Виды ожиданий Wait statistics

- Виды [ожиданий](https://msdn.microsoft.com/ru-ru/library/ms179984.aspx)  
  - [PAGEIOLATCH_SH и PAGEIOLATCH_EX](https://blog.sqlauthority.com/2011/02/09/sql-server-pageiolatch_dt-pageiolatch_ex-pageiolatch_kp-pageiolatch_sh-pageiolatch_up-wait-type-day-9-of-28/)
    - см [нагружающие запросы по вводу/выводу](https://msdn.microsoft.com/ru-ru/magazine/cc135978.aspx)
  - [CXPACKET](https://blog.sqlauthority.com/2011/02/06/sql-server-cxpacket-parallelism-usual-solution-wait-type-day-6-of-28/) - Означает параллелизм, но не обязательно в нем проблема
    - [Advanced](https://blog.sqlauthority.com/2011/02/07/sql-server-cxpacket-parallelism-advanced-solution-wait-type-day-7-of-28/?amp)
    - Если у нас транзакционная система: имеет смысл установить Max Degree Parallelism = 1
    - Хранилища и витрины данных: установить Max Degree Parallelism = 0 или явное количество CPU
    - Смешанные: установить Max Degree Parallelism = 1 , a y запросов требующих параллелизма установить hint MAXDOP=0
    - Параллелизм Maxdop и cost Threshold
  - [LATCH_XX](http://www.sqlskills.com/blogs/paul/wait-statistics-or-please-tell-me-where-it-hurts/)
  - LCK_M_XX - блокировка
  - [LCK_M_IX](https://www.sqlskills.com/help/waits/LCK_M_IX/) - блокировка
  - [PREEMPTIVE_XE_DISPATCHER](https://blog.sqlauthority.com/2011/02/19/sql-server-preemptive-and-non-preemptive-wait-type-day-19-of-28/) - связано с фоновыми потоками расширенных событий [Extended Events](mssql.extended.events.md)
  - [ASYNC_IO_COMPLETION](https://www.sqlskills.com/help/waits/ASYNC_IO_COMPLETION/) - Возникает, когда задача ожидает завершения ввода-вывода
  - [ASYNC_NETWORK_IO](https://habr.com/ru/articles/216309/) - SQL Server ждет, пока клиент закончит получать данные
