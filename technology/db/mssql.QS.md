# MSSQL Query Store

## Зачем

- Анализ за период времени (ТОП Х)
	- Планов выполнения запросов __estimated__ (не actual) (онлайн)
	- [Статистики потребления ресурсов СУБД при выполнении запроса](https://learn.microsoft.com/en-us/sql/relational-databases/performance/monitoring-performance-by-using-the-query-store) с заданным интервалом __15мин по умолчанию__
	- Wait Statistics
	- Регрессированные запросы - запросы, планы выполнения которых ухудшились в определенном диапазоне времени (последний час, день, неделя)
	- Queries With __Forced Plans__ (блокирование генерации нового планы выполнения, пока не unforce plan для запроса)
	- Запросы с [высокой вариативностью](https://learn.microsoft.com/en-us/sql/relational-databases/performance/best-practice-with-the-query-store?view=sql-server-ver16#Parameterize) - анализирует запросы и показывает запросы с наиболее __частыми проблемами параметризации__
- [Настройка](https://www.sqlshack.com/sql-server-query-store-overview/)
- [A/B testing оптимизации запросов](https://learn.microsoft.com/en-us/sql/relational-databases/performance/query-store-usage-scenarios?view=sql-server-ver16)
- [Архитектура](https://www.sqlshack.com/sql-server-query-store-overview/)

## Плюсы и минусы

Минусы

- deadlock не мониторит (есть в Extended Events)
- ошибки не мониторит (есть в Extended Events)
- [накладные расходы на СУБД](https://www.brentozar.com/archive/2018/06/building-sql-constantcare-why-people-arent-using-query-store/)
- SentryOne платный, но лучше Query Store (2018)