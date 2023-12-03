# Производительность

- [Производительность](#производительность)
  - [Зачем](#зачем)
  - [Паттерны](#паттерны)
    - [Приложение back-end](#приложение-back-end)
    - [Приложение front-end](#приложение-front-end)
    - [СУБД](#субд)
      - [Sql query plan](#sql-query-plan)
    - [Сеть](#сеть)

## Зачем

Обеспечить достижение атрибутов качества архитектуры ПО - [характеристика производительности](../ability/performance.md).

## Паттерны

### Приложение back-end

- [кэш](pattern.cache.md) вывода, данных (sqldependency)
- денормализация
- Масштабирование: горизонтальный ( рядом новый сервер), вертикальные (ядер, памяти и ТП)
- Решение принимаем по каждому виду данных/бизнес сущности отдельно.
- Ищем баланс с учетом
  - размера данных
  - стоимости их вычисления/чтения с HDD
  - вероятности их повторной востребованности
  - размера, который они занимают в кеше/частоты изменения данных/того
  - насколько “болезненно” будет для пользователя получение “устаревших” данных из кеша.

### Приложение front-end

- JavaScript
  - существует инструмент под названием Navigation Timing API, который позволяет собирать на стороне клиента данные по скорости страницы, продолжительности DNS resolve, передачи данных по сети, работы на Backend’е, отрисовки страницы.
- [Балансировка](deployment/load.balancing.md)

### СУБД

- [CQRS](pattern.cqrs.md) - чтение и запись из разных бд
- Секционирование [Шардирование](shard.db.md)
- [Репликация](sync.data.md)
- Кластеризация
- [Уровень изоляции данных](../store.isolation.level.md)

- [ms sql](../../technology/db/mssql.md)

#### Sql query plan

- Плохо
  - Index scan
  - Rid / key lookup - чтение из кучи databaselog. https://dotnettutorials.net/lesson/how-to-use-covering-index-to-reduce-rid-lookup/
  - Статистика плана запросов устаревает- см сколько записей оптимизатор предполагает вернуть, а сколько по факту
  - Physical reads не из Кеша данных
- Хорошо
  - Index seek
  - Logical reads

### Сеть

- [Windows Distributed File System (DFS) и Replication](https://windowsnotes.ru/activedirectory/distributed-file-system-arxitektura-i-bazovye-ponyatiya/)
  - A distributed file system (DFS) is a file system with data stored on a server. The data is accessed and processed as if it was stored on the local client machine.
  - The DFS makes it convenient to share information and files among users on a network in a controlled and authorized way. The server allows the client users to share files and store data just as if they are storing the information locally. However, the servers have full control over the data, and give access control to the clients.
- Каналы связи вертикальное масштабирование [дублирование каналов связи, защита](https://systempb.ru/company/our-articles/vysokie-skorosti-sovremennykh-tsod-kak-vozmozhnosti-stanovyatsya-ogranicheniyami-i-chto-s-etim-delat/)
- [топология сети](http://citforum.ru/nets/optimize/locnop_02.shtml) и используемое коммуникационное оборудование
