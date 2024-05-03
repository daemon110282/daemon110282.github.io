# Метрики производительности

- Requests
	- calls [pg_stat_statements](https://habr.com/ru/articles/520460/)
	- TPS = sum(commits + rollbacks) [pg_stat_database](https://habr.com/ru/articles/486710/)
	- QPS = sum(calls)
	- Tuples (строки - не равно calls) Ins, Upd, Delete, Select by таблица
	- top 5 частых query модуль pg_stat_statements
- Errors
	- xact_rollback [pg_stat_database](https://www.postgresql.org/docs/current/monitoring-stats.html#PG-STAT-DATABASE-VIEW)
- Duration
	- total_time [pg_stat_statements](https://habr.com/ru/articles/520460/)
	- длительность транзакций
	- top 5 долгих query модуль pg_stat_statements
	- Autovacuum - pg_stat_user_tables.last_autovasuum
- Saturation
	- максимальное [время простоя внутри транзакции ('idle in transaction', 'idle in transaction (aborted)') pg_stat_activity](https://habr.com/ru/articles/520460/)
	- максимальное время ожидания клиентов (wait_event_type = 'Lock' pg_stat_activity)
	- состояние соединений (active, idle и тп) pg_stat_activity - На каждый процесс есть отдельная строчка, которая показывает информацию [по этому процессу](https://habr.com/ru/articles/486710/): 
		- с какого хоста выполнено подключение
		- под каким пользователем, под каким именем
		- когда запущена транзакция
		- какой сейчас выполняется запрос, какой запрос выполнялся последним
	- размеры таблиц
	- top 5 больших (кол-во возвращаемых данных) query модуль pg_stat_statements
	- частые чекпоинты pg_stat_bgwriter (IO влияние)


TODO:

1.	Cache read speed (MB/s) Скорость чтения в Мб/c из памяти (кэша) 
2.	Cache write speed (MB/s)  Скорость записи в Мб/c в память (кеш) 
3.	Temp read speed (MB/s)  Скорость чтения в Мб/c данных из временных файлов 
4.	Temp write speed (MB/s)  Скорость записи в Мб/c данных во временные файлы 
5.	Cache Hit Ratio – вероятность попадания в кеш 
6.	Memory/Temp ratio  Соотношение записи в память и временные файлы 
7.	CPU heavy queries (s )  Потреблённые ресурсы CPU (в сек) со стороны тяжелого запроса в момент его окончания, если его длительность больше чем 10 сек.

## Доступность

- sum(total_time)/sum(calls) [pg_stat_statements](https://habr.com/ru/articles/486710/)
- Uptime 
	- Когда PostgreSQL запустился, начинается отчитываться uptime. Но если в какой-то момент, например, ночью выполнялась какая-то задача, пришел OOM-killer и завершил принудительно дочерний процесс PostgreSQL, то в этом случае PostgreSQL __завершает соединение всех клиентов__, сбрасывает область shared памяти и начинает восстановление с последней контрольной точки. И пока длится это восстановление с контрольной точки, база не принимает подключения, т. е. эту ситуацию можно оценивать, как __downtime__. Но при этом __счетчик uptime не сбросится__, потому что он учитывает время запуска postmaster с самого первого момента. 
- Количество воркеров Autovacuum
	- [pg_stat_activity](https://habr.com/ru/articles/486710/)
