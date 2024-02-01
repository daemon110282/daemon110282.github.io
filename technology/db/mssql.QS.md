# MSSQL Query Store

## Зачем

- Анализ за период времени (ТОП Х)
	- Планов выполнения запросов
	- [Статистики потребления ресурсов СУБД при выполнении запроса](https://learn.microsoft.com/en-us/sql/relational-databases/performance/monitoring-performance-by-using-the-query-store)
	- Wait Statistics
	- Регрессированные запросы - запросы, планы выполнения которых ухудшились в определенном диапазоне времени (последний час, день, неделя)
	- Queries With __Forced Plans__ (блокирование генерации нового планы выполнения, пока не unforce plan для запроса)
	- Запросы с высокой вариативностью - анализирует запросы и показывает запросы с наиболее __частыми проблемами параметризации__
- [Настройка](https://www.sqlshack.com/sql-server-query-store-overview/)

Минусы

- deadlock не мониторит

[Архитектура](https://www.sqlshack.com/sql-server-query-store-overview/)
- сбор
	- запросов (онлайн)
	- плана выполнения __estimated__ (не actual) (онлайн)
	- статистики (с заданным интервалом 15мин по умолчанию)