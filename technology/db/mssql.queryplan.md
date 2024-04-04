# Query plan

![plan](../../img/technology/db/mssql/sql.query.life.jpg)

- How to [view xml query plans graphically](https://docs.microsoft.com/ru-ru/sql/relational-databases/performance/save-an-execution-plan-in-xml-format?view=sql-server-ver15)
	- Rename the file from .xml to .sqlplan and use Open File to launch it.
- Анализ плана выполнения
  - __Плохо__
    - Index scan
    - Rid / key lookup - чтение из [кучи databaselog](https://dotnettutorials.net/lesson/how-to-use-covering-index-to-reduce-rid-lookup/) - индексы надо настраивать
    - Статистика плана запросов устаревает- см сколько записей оптимизатор предполагает вернуть, а сколько по факту
    - Physical reads не из Buffer Cache Кеша данных (logical reads)
  - __Хорошо__
    - Index seek
    - Logical reads
      - но если их очень много, то ресурсы RAM сильно потребляются?
