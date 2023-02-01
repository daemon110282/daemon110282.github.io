# Производительность

- [Производительность](#производительность)
  - [Зачем](#зачем)
  - [Паттерны](#паттерны)
    - [Приложение back-end](#приложение-back-end)
    - [Приложение front-end](#приложение-front-end)
    - [БД](#бд)
      - [MS SQL](#ms-sql)
    - [Сеть](#сеть)

## Зачем

Обеспечить достижение атрибутов качества архитектуры ПО - [характеристик производительности](../ability/performance.md).

Ключевая метафора для понимания производительности - это **конвейер задач**. Которые прокачиваются через **трубу**. Количество и последовательность задач в конвейере определяются требованиями заказчика и техническими решениями программиста.
Пропускная способность трубы определяется ее **шириной (Bandwitch)** и **длиной(Latency)**. Которые в свою очередь определены лежащим в фундаменте системы Hardware/Software.
Пропускная способность системы в целом определяется тем, сколько задач можно прокачать через трубу в единицу времени. Здесь важны т.е., **ширина**(объем используемого CPU/RAM/IO) и **длина**(продолжительность выполнения) задач.

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

### БД

- [CQRS](pattern.cqrs.md) - чтение и запись из разных бд
- Master-slave, Logshipping
- Шардирование (CITUS)
  - Вертикальный - партиционирование-секционирование, одну таблицу на несколько таблиц в одной субд
  - Горизонтальный - таблицы на разных субд
- Репликация
- Кластеризация
- [Уровень изоляции данных](store.../store.isolation.level.md)

#### MS SQL

Способ анализа производительности SQL Server:

1. Записать с помощью SQL Server Profiler (или AnjLab.SqlProfiler) запросы, исполняемые при запуске функции (например редактирование анкеты)
2. Добавить метки времени в начало и в конец запроса CONVERT(nvarchar(30), GETDATE(), 126)
3. Запустить скрипт на локальном сервере и на сервере разработчика
4. Вычислить времени выполнения на локальном сервере и на сервере разработчика (ручным способом)/ Результаты позволяют уверенно говорить о причинах медленной загрузки страниц (например редактирование анкеты) в браузере.

Стратегии оптимизации запросов:

- можно использовать индексы, другие варианты запроса, сохранение промежуточных результатов.	Выбор варианта оптимизации зависит от конкретного случая. При этом могут быть использованы сразу несколько подходов.
- Не все индексы одинаково полезны. При разработке индексов необходимо учитывать их селективность.	
- Для проверки быстродействия запроса:	SET STATISTICS TIME ON
- Для проверки статистики ввода/вывода:	SET STATISTICS IO ON
- Для вывода плана запроса:	SET STATISTICS XML ON

TODO

- http://f1incode.blogspot.com/2011/07/i_28.html	
- http://f1incode.blogspot.com/2011/08/performance-testing-part-2.html
- http://www.itcommunity.ru/Msgs/default.aspx?MessageID=60	
- http://msmvps.com/blogs/irinanaumova/archive/2011/05/06/1792775.aspx	
- http://www.mssqltips.com/tip.asp?tip=1039	
- [Оценка производительности SQL Server](http://www.interface.ru/home.asp?artId=6968)
- [Microsoft: Мониторинг и настройка производительности](http://www.sql.ru/forum/actualthread.aspx?tid=858780)

### Сеть

- [Windows Distributed File System (DFS) и Replication](https://windowsnotes.ru/activedirectory/distributed-file-system-arxitektura-i-bazovye-ponyatiya/)
  - A distributed file system (DFS) is a file system with data stored on a server. The data is accessed and processed as if it was stored on the local client machine.
  - The DFS makes it convenient to share information and files among users on a network in a controlled and authorized way. The server allows the client users to share files and store data just as if they are storing the information locally. However, the servers have full control over the data, and give access control to the clients.
- Каналы связи вертикальное масштабирование [дублирование каналов связи, защита](https://systempb.ru/company/our-articles/vysokie-skorosti-sovremennykh-tsod-kak-vozmozhnosti-stanovyatsya-ogranicheniyami-i-chto-s-etim-delat/)
- [топология сети](http://citforum.ru/nets/optimize/locnop_02.shtml) и используемое коммуникационное оборудование
