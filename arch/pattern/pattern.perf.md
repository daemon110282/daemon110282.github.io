# Производительность

- [Производительность](#производительность)
  - [Зачем](#зачем)
  - [Паттерны](#паттерны)
    - [Приложение back-end](#приложение-back-end)
    - [Приложение front-end](#приложение-front-end)
    - [БД](#бд)
    - [Сеть](#сеть)

## Зачем

Обеспечить достижение атрибутов качества архитектуры ПО - [характеристик производительности](../ability/performance.md).

- Ключевая метафора для понимания производительности - это **конвейер задач**. Которые прокачиваются через **трубу**. Количество и последовательность задач в конвейере определяются требованиями заказчика и техническими решениями программиста.
- Пропускная способность трубы определяется ее **шириной (Bandwitch)** и **длиной(Latency)**. Которые в свою очередь определены лежащим в фундаменте системы Hardware/Software.
- Пропускная способность системы в целом определяется тем, сколько задач можно прокачать через трубу в единицу времени. Здесь важны т.е., **ширина**(объем используемого CPU/RAM/IO) и **длина**(продолжительность выполнения) задач.

Производительность может быть повышена следующими способами:

- Сокращением "длины" и/или "ширины" задач
- Выполнением задач параллельно, ЕСЛИ в "трубе" есть для этого место.
- Исключением задач из конвейера - выполнением их асинхронно.

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
- [Балансировка](load.balancing.md)

### БД

- [CQRS](pattern.cqrs.md) - чтение и запись из разных бд
- [Шардирование](shard.db.md)
- [Репликация](sync.data.md)
- Кластеризация
- [Уровень изоляции данных](../store.isolation.level.md)

### Сеть

- [Windows Distributed File System (DFS) и Replication](https://windowsnotes.ru/activedirectory/distributed-file-system-arxitektura-i-bazovye-ponyatiya/)
  - A distributed file system (DFS) is a file system with data stored on a server. The data is accessed and processed as if it was stored on the local client machine.
  - The DFS makes it convenient to share information and files among users on a network in a controlled and authorized way. The server allows the client users to share files and store data just as if they are storing the information locally. However, the servers have full control over the data, and give access control to the clients.
- Каналы связи вертикальное масштабирование [дублирование каналов связи, защита](https://systempb.ru/company/our-articles/vysokie-skorosti-sovremennykh-tsod-kak-vozmozhnosti-stanovyatsya-ogranicheniyami-i-chto-s-etim-delat/)
- [топология сети](http://citforum.ru/nets/optimize/locnop_02.shtml) и используемое коммуникационное оборудование
