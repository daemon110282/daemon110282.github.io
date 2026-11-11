# Блокировки

- [Блокировки](#блокировки)
  - [Зачем](#зачем)
  - [Паттерны](#паттерны)

## Зачем

- Если в системе установлен __бесконечный период ожидания завершения транзакции__ (а это задано __по умолчанию__), то при возникновении deadlock для двух транзакций вполне возможно, что, ожидая освобождения заблокированных ресурсов, в тупике окажутся и новые транзакции.
  - Чтобы избежать подобных проблем, в среде MS SQL Server реализован специальный механизм разрешения конфликтов deadlock.
  - Для этих целей сервер снимает одну из блокировок, вызвавших конфликт, и откатывает инициализировавшую ее транзакцию. При выборе блокировки, которой необходимо пожертвовать, сервер исходит из соображений минимальной стоимости.

## Паттерны

- Deadlock
- Lock Escalation
  - через [Extended Events](mssql.extended.events.md)
- Online
  - [Моментальный снимок ожидающих задач](https://www.sqlskills.com/blogs/paul/updated-sys-dm_os_waiting_tasks-script-to-correctly-parse-nodeid/)
  - [wait by CPU](https://docs.microsoft.com/ru-ru/archive/msdn-magazine/2008/january/sql-server-uncover-hidden-data-to-optimize-application-performance)
- Анализ [Wait Statistics](mssql.waits.md) by IO, CPU, Network, RAM
  - [Исторически Wait Statistics](mssql.waits.md#паттерны)
- [Локализация причин](https://www.google.ru/amp/s/blog.sqlauthority.com/2011/02/01/sql-server-wait-stats-wait-types-wait-queues-day-0-of-28-2/)
  - System view [DMV sql](http://www.sqlskills.com/blogs/paul/wait-statistics-or-please-tell-me-where-it-hurts/) 
