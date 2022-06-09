# Производительность

- [Производительность](#производительность)
	- [Приложение back-end](#приложение-back-end)
	- [Приложение front-end](#приложение-front-end)
	- [БД](#бд)
	- [Сеть](#Сеть)
	- [Метрики](#метрики)
	- [Links](#links)

## Приложение back-end

- кеш вывода
- кеш данных sqldependency
- денормализация
- Масштабирование: горизонтальный ( рядом новый сервер), вертикальные (ядер, памяти и ТП)
- Решение принимаем по каждому виду данных/бизнес сущности отдельно.
- Ищем баланс с учетом
  - размера данных
  - стоимости их вычисления/чтения с HDD
  - вероятности их повторной востребованности
  - размера, который они занимают в кеше/частоты изменения данных/того
  - насколько “болезненно” будет для пользователя получение “устаревших” данных из кеша.

## Приложение front-end

- JavaScript
  - существует инструмент под названием Navigation Timing API, который позволяет собирать на стороне клиента данные по скорости страницы, продолжительности DNS resolve, передачи данных по сети, работы на Backend’е, отрисовки страницы.

## БД

- CQRS - чтение и запись из разных бд
- Master-slave, Logshipping
- Шардирование (CITUS)
  - Вертикальный - партиционирование-секционирование, одну таблицу на несколько таблиц в одной субд
  - Горизонтальный - таблицы на разных субд
- Репликация
- Кластеризация
- [Уровень изоляции данных](store.../store.isolation.level.md)

## Сеть

- [Windows Distributed File System (DFS) и Replication](https://windowsnotes.ru/activedirectory/distributed-file-system-arxitektura-i-bazovye-ponyatiya/)
  - A distributed file system (DFS) is a file system with data stored on a server. The data is accessed and processed as if it was stored on the local client machine.
  - The DFS makes it convenient to share information and files among users on a network in a controlled and authorized way. The server allows the client users to share files and store data just as if they are storing the information locally. However, the servers have full control over the data, and give access control to the clients.
- Каналы связи вертикальное масштабирование [дублирование каналов связи, защита](https://systempb.ru/company/our-articles/vysokie-skorosti-sovremennykh-tsod-kak-vozmozhnosti-stanovyatsya-ogranicheniyami-i-chto-s-etim-delat/)
- [топология сети](http://citforum.ru/nets/optimize/locnop_02.shtml) и используемое коммуникационное оборудование

## Метрики

- Сколько операций может выполнить система за определенный период времени? (пропускная способность)
- Сколько операций могут быть выполнены одновременно? (параллелизм)
- Как долго система выполняет операцию? (время отклика/задержка)
- Сколько резервной мощности требуется системе для обеспечения роста нагрузки? (запас ресурсов)
- Сколько исключений система генерит под нагрузкой? (частота ошибок)
- Макс пользователей
- Максимальное время загрузки страницы (300мс отлично)


## Links

- http://sixrevisions.com/web-performance/improve-website-speed-02/
- https://www.techdays.ru/videos/4250.html
