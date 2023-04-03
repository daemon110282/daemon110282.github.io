# MS SQL Server

HA, Read Only Replica
- [log-shipping or always on](https://dba.stackexchange.com/questions/199064/log-shipping-or-always-on-as-dr-for-sql-failover-cluster)
	- AlwaysOn high availability group, HAG, is easier to maintain than log shipping
	- Возможно больше трудностей с AlwaysOn, экспертиза DBA более высокая трубется

## Паттерны

- delete rows VS update rows state - удаление блокирующая и длительная операция
	- https://social.msdn.microsoft.com/Forums/sqlserver/en-US/d214f0ef-b995-4a14-bed9-0bf5b27a264c/performance-delete-rows-vs-update-rows-state?forum=transactsql
	- https://stackoverflow.com/questions/1271641/in-sql-is-update-always-faster-than-deleteinsert
	- https://dba.stackexchange.com/questions/8028/whats-better-for-large-changes-to-a-table-delete-and-insert-every-time-or-upd
	