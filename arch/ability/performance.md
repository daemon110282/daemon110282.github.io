# Производительность Performance

- [Производительность Performance](#производительность-performance)
  - [web app](#web-app)
  - [Кэш](#кэш)
  - [Инструменты](#инструменты)
  - [ms sql](#ms-sql)
    - [Секционирование Шардирование](#секционирование-шардирование)
    - [Sql query plan](#sql-query-plan)
  - [Метрики](#метрики)
  - [Требования пример](#требования-пример)
  - [TODO merge](#todo-merge)

[Паттерны](../pattern/pattern.perf.md)

  - [Балансировка](../pattern/load.balancing.md)
  - concurrency

## web app

- WIN32_ERROR_DESCRIPTION(sc-win32-status) as Description, TO_LOCALTIME
- НТ метрика от. Netexport записать, эталон. Конфигурация ПК клиента. С кешем из firebug. Yslow, pagespeed
- тайминг логировать
- Yslow, page speed chrome
- HTTP Error 503.2 — Service Unavailable в логах IIS есть - __очередь запросов__
- The Time-Taken - field shows the length of time that it takes for a request to be processed and its response to be sent.  
  - This value gets calculated by a timer that gets initialized when the __IIS server receives the first byte of an HTTP request__, and stopped when the __last IIS response send operation completes__.  
  - It is important to note that the Time-Taken field __usually includes the time that the request and response packets are travelling over the network__.
  - Время когда был рост времени ответа совпадает с current connection пиками?
- [http-status-code](https://support.microsoft.com/ru-ru/help/943891/the-http-status-code-in-iis-7.0,-iis-7.5,-and-iis-8.0)
- [network speed??](https://serverfault.com/questions/412419/iis-how-to-tell-if-a-slow-time-taken-is-due-to-a-slow-network-connection)
- [DOS attack](https://serverfault.com/questions/288262/dos-attack-slow-post-how-to-prevent-in-iis?rq=1) "slow post"
- выявить источник и тип трафика, а также точки входа на сайт или скрипты, которые вызываются чаще всего. Причины высокой нагрузки в результатах анализа следует посмотреть:  
  - TOP 20 запросов методом POST
  - TOP 20 запросов методом GET/HEAD
  - TOP 20 IP адресов по числу хитов
  - TOP 20 ссылающихся страниц по числу хитов
- настройка трейса FREB по длительным [запросам time-taken](https://blogs.msdn.microsoft.com/docast/2016/04/28/troubleshooting-iis-request-performance-slowness-issues-using-freb-tracing/) ЗАМЕДЛЯЕТ САЙТ!  
- [long time-taken and win32 status code = 64](https://forums.iis.net/t/1169411.aspx)
  - is connection is already lost? common by proxies, to not have too many socket connections?

## Кэш

- Сервис может отвечать заголовками, сколько можно кэшировать один или другой запрос. И если поставить между сервисом и вызывающей стороной nginx, то он может держать у себя кэш на основе этих заголовков.
- Для более продвинутого кэширования можно вместо nginx взять varnish

## Инструменты

- Php
- Стандартное логирование запросов (nginx, apache, php-fpm)
- Логирование медленных запросов БД (опция в mysql)
- Инструменты фиксации узких мест при прохождении запроса. Для php это xhprof, pinba.
- Встроенные инструменты внутри веб-приложения, например отдельный модуль трассировки.

## ms sql

Monitoring + alerts
System view dmv sql минус показывают общую статистику а не за период. При перезагрузке СУБД очищается
http://www.sqlskills.com/blogs/paul/wait-statistics-or-please-tell-me-where-it-hurts/
https://www.google.ru/amp/s/blog.sqlauthority.com/2011/02/01/sql-server-wait-stats-wait-types-wait-queues-day-0-of-28-2/
Описание ожиданий в BOL: https://msdn.microsoft.com/ru-ru/library/ms179984.aspx
Wait statistics
https://blog.sqlauthority.com/2021/03/08/sql-server-wait-stats-collection-scripts-updated-march-2021/?amp
PAGEIOLATCH_SH и PAGEIOLATCH_EX : см нагружающие запросы по вводу/выводу  https://msdn.microsoft.com/ru-ru/magazine/cc135978.aspx
https://blog.sqlauthority.com/2011/02/07/sql-server-cxpacket-parallelism-advanced-solution-wait-type-day-7-of-28/?amp
Cxpacket
Maxdop см и cost Threshold
De-fragmentation of Index can help as more data can be obtained per page. (Assuming close to 100 fill-factor)
Data collection сбор авто метрик в период времени в отдел бд с sqlplan. Только в 2016? Нет с 2008. У нас 2012. Dwh 2016
Индексы - избыток может увеличить io wait
http://blogs.msmvps.com/gladchenko/2008/03/30/tips-for-dba-using-sys-dm_db_index_physical stats-in-a-script-to-rebuild-or-reorganize-indexes-no-partitions-sql-server-2005/
Блокировки
Настройки СУБД get
SELECT * from sys.configurations ORDER BY name
https://www.mssqltips.com/sqlservertip/6090/sql-server-configuration-settings-query/

### Секционирование Шардирование

- таблиц в [одной бд](https://technet.microsoft.com/library/Cc966380)
- Секция - [файл группы](http://sqlcom.ru/partition/partition-and-high-availability/)
https://docs.microsoft.com/ru-ru/sql/relational-databases/partitions/partitioned-tables-and-indexes
- [скользящее окно](http://www.sql.ru/articles/mssql/2005/073102partitionedtablesandindexes.shtml)

### Sql query plan

- Плохо
  - Index scan
  - Rid / key lookup - чтение из кучи databaselog. https://dotnettutorials.net/lesson/how-to-use-covering-index-to-reduce-rid-lookup/
  - Статистика плана запросов устаревает- см сколько записей оптимизатор предполагает вернуть, а сколько по факту
  - Physical reads не из Кеша данных
- Хорошо
  - Index seek
  - Logical reads

## Метрики

[Виды метрик и примеры](performance.metric.md)

## Требования пример

- какой объем памяти выделен будет на работу приложения на хостинге?
- какой объем памяти допустимо использовать на ПК клиента для отображения отчета (максимум как мы понимаем 1ГБ- память на работу ОС XP, т.е. около 800Мб)?
- какая макс скорость канала будет от ПК пользователя до веб-сервера?
- какое время ожидания отчета в принципе допустимо для "очень большого отчета"? предлагаю определиться именно с параметрами "очень большого отчета"
- Здесь необходимо сначала дать определения большого и не большого отчета, а то слишком субъективные оценки.
- Обычный Текстовый 150 строк * 12 столбцов 12 сек.
- Большой Текстовый отчет за 3 года не более 2 мин. (ориентировочно 20000 строк*15 столбцов)
- Обычный Числовой/Графический 1 минута 3-4 группировки 200 строк * 100 столбоцов
- Максимальный Числовой/Графический максимальная скорость построения отчета – 2 минуты.

## TODO merge

Характеристика - Единицы измерения

- Сколько операций может выполнить система за определенный период времени? (пропускная способность)
- Сколько операций могут быть выполнены одновременно? (параллелизм)
- Как долго система выполняет операцию? (время отклика/задержка)
- Сколько резервной мощности требуется системе для обеспечения роста нагрузки? (запас ресурсов)
- Сколько исключений система генерит под нагрузкой? (частота ошибок)
- Макс пользователей
- Время загрузки страницы (<=300мс отлично)

- Нагрузка на CPU - Процент
- Использование физической/виртуальной памяти	- Байты, килобайты, мегабайты, гигабайты
- Время выполнения среднее\макс для 90% запросов- Миллисекунды
- Сетевые операции, канал забит -	Количество, частота следования в секунду, объем трафика bandwidth, какие урлы сколько трафика генерируют, трафик на сетевых интерфейсах
- Дисковые операции СХД	- Количество, частота следования в секунду
- Время отклика\задержки Latency - Миллисекунды
- параметры [виртуалки VMWare](https://habrahabr.ru/post/259087/)
- redis память много, операции чтения
- [балансировщик](../pattern/load.balancing.md) прокси, nginx, netscaler - как балансировка на ноды работает, время ответ нод балансировщику
- Исключительные ситуации errors, HTTP Error 503.2 — Service Unavailable - Количество, частота следования в секунду
- Обращения к базе данных -	Количество обращений, частота следования в секунду
- "Сколько операций может выполнить система за определенный период времени? (пропускная способность)
- "Сколько операций могут быть выполнены одновременно? (параллелизм)
- Макс пользователей
- Число вызовов в сутки / в ЧПН
- Объем запроса, Объем ответа
- Попадания в кеш	Количество, частота попаданий в секунду
- Ошибки обращений к страницам диска - Количество, частота следования в секунду
- Конкуренция - Количество, частота следования в секунду
- Выделение блоков памяти - Количество байтов, количество объектов, частота следования в секунду
- Сборка мусора - Количество, частота следования в секунду, продолжительность, % от общего времени выполнения
- Время запуска - Миллисекунды
- Сколько резервной мощности требуется системе для обеспечения роста нагрузки? (запас ресурсов)
- Сколько исключений система генерит под нагрузкой? (частота ошибок)

TODO
- [UMP](https://airtable.com/embed/shrj9QkstRkVlFW0i/tblzJXJYUlj4aCHaJ)
- http://sixrevisions.com/web-performance/improve-website-speed-02/
