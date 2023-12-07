# Блокировки

## Паттерны

- Deadlock
- Lock Escalation
  - через [Extended Events](mssql.extended.events.md)

## Виды ожиданий Wait statistics

- Виды [ожиданий](https://msdn.microsoft.com/ru-ru/library/ms179984.aspx)
  - [SQL Wait Statistics скрипт](https://blog.sqlauthority.com/2021/03/08/sql-server-wait-stats-collection-scripts-updated-march-2021/?amp)
  - [PAGEIOLATCH_SH и PAGEIOLATCH_EX](https://blog.sqlauthority.com/2011/02/09/sql-server-pageiolatch_dt-pageiolatch_ex-pageiolatch_kp-pageiolatch_sh-pageiolatch_up-wait-type-day-9-of-28/)
    - см [нагружающие запросы по вводу/выводу](https://msdn.microsoft.com/ru-ru/magazine/cc135978.aspx)
  - [CXPACKET](https://blog.sqlauthority.com/2011/02/06/sql-server-cxpacket-parallelism-usual-solution-wait-type-day-6-of-28/)
    - [Advanced](https://blog.sqlauthority.com/2011/02/07/sql-server-cxpacket-parallelism-advanced-solution-wait-type-day-7-of-28/?amp)
    - Если у нас транзакционная система: имеет смысл установить Max Degree Parallelism = 1
    - Хранилища и витрины данных: установить Max Degree Parallelism = 0 или явное количество CPU
    - Смешанные: установить Max Degree Parallelism = 1 , a y запросов требующих параллелизма установить hint MAXDOP=0
    - Параллелизм Maxdop и cost Threshold
  - [LATCH_XX](http://www.sqlskills.com/blogs/paul/wait-statistics-or-please-tell-me-where-it-hurts/)
  - LCK_M_XX - блокировка
  - [LCK_M_IX](https://www.sqlskills.com/help/waits/LCK_M_IX/) - блокировка
- [Локализация причин](https://www.google.ru/amp/s/blog.sqlauthority.com/2011/02/01/sql-server-wait-stats-wait-types-wait-queues-day-0-of-28-2/)
  - System view [DMV sql](http://www.sqlskills.com/blogs/paul/wait-statistics-or-please-tell-me-where-it-hurts/) 

