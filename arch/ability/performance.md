# Производительность Performance

- [Производительность Performance](#производительность-performance)
- [web app](#web-app)
    - [Кэш](#кэш)
    - [Инструменты](#инструменты)
    - [ms sql](#ms-sql)
    - [Секционирование Шардирование](#секционирование-шардирование)
    - [Sql query plan](#sql-query-plan)
  - [Метрики](#метрики)
    - [Business Metrics](#business-metrics)
    - [Application Metrics](#application-metrics)
    - [System Metrics](#system-metrics)
    - [Client Metrics: Приложение front-end](#client-metrics-приложение-front-end)
    - [Service Metrics: API](#service-metrics-api)
  - [Требования пример](#требования-пример)
  - [TODO merge](#todo-merge)

[Паттерны](../pattern/pattern.perf.md)

  - [Балансировка](../pattern/load.balancing.md)
  - concurrency

To-do

# web app 

Счетчики как внедрить: Client Metrics, Business Metrics https://docs.google.com/spreadsheets/d/1g-WsAqeJqpKDbFLsVx0EOAuaRMUMWPaaG2a7XHWGgWU/edit#gid=1431606873
WIN32_ERROR_DESCRIPTION(sc-win32-status) as Description, TO_LOCALTIME
НТ метрика с длп и с Яндексом в ФК с от. Netexport записать, эталон. Без finesse. Конфигурация ПК клиента. С кешем из firebug. Или скрипт от ТС скорости ?!? Yslow, pagespeed
[tsp_ImportAllData]\tsp_FromFrontIntoGate_Cessionary тайминг логировать
Yslow, page speed chrome
HTTP Error 503.2 — Service Unavailable в логах IIS есть? очередь запросов
The Time-Taken field shows the length of time that it takes for a request to be processed and its response to be sent.  This value gets calculated by a timer that gets initialized when the IIS server receives the first byte of an HTTP request, and stopped when the last IIS response send operation completes.  It is important to note that the Time-Taken field usually includes the time that the request and response packets are travelling over the network.  время когда был рост времени ответа совпадает с current connection пиками?
https://mlichtenberg.wordpress.com/2011/02/03/log-parser-rocks-more-than-50-examples/   Hourly Bandwidth (chart)     Requests by URI    Search the Event Log for W3SVC (IIS) 
https://www.symantec.com/connect/articles/forensic-log-parsing-microsofts-logparser
For example, Bytes Sent and Bytes Received are not selected, but they are very useful when troubleshooting a performance problem.  в IIS логах есть?? sc-bytes, cs-bytes	НЕТУ
https://docs.microsoft.com/en-us/iis/troubleshoot/performance-issues/troubleshooting-iis-performance-issues-or-application-errors-using-logparser
!!! https://docs.microsoft.com/en-us/iis/troubleshoot/performance-issues/troubleshooting-high-cpu-in-an-iis-7x-application-pool
http://software-testing.ru/library/testing/performance-testing/468-weblog 
https://support.microsoft.com/ru-ru/help/943891/the-http-status-code-in-iis-7.0,-iis-7.5,-and-iis-8.0
https://serverfault.com/questions/412419/iis-how-to-tell-if-a-slow-time-taken-is-due-to-a-slow-network-connection network speed??
https://serverfault.com/questions/288262/dos-attack-slow-post-how-to-prevent-in-iis?rq=1  DOS attack “slow post”
результатах анализа следует посмотреть TOP 20 запросов методом POST, TOP 20 запросов методом GET/HEAD, TOP 20 IP адресов по числу хитов, TOP 20 ссылающихся страниц по числу хитов. Все это позволит выявить источник и тип трафика, а также точки входа на сайт или скрипты, которые вызываются чаще всего. Скорее всего они и будут причиной высокой нагрузки.
iis perf counters https://msdn.microsoft.com/en-us/library!/ms972959.aspx?f=255&MSPPError=-2147217396 
https://msdn.microsoft.com/en-us/library/fxk122b4.aspx  
http://www.markhneedham.com/blog/2009/06/24/using-fiddler-with-iis/ fiddler on iis app
https://blogs.msdn.microsoft.com/docast/2016/04/28/troubleshooting-iis-request-performance-slowness-issues-using-freb-tracing/ настройка трейса FREB по длительным запросам time-taken. ЗАМЕДЛЯЕТ САЙТ!
https://forums.iis.net/t/1169411.aspx long time-taken and win32 status code = 64. is connection is already lost? common by proxies, to not have too many socket connections?

### Кэш

- Сервис может отвечать заголовками, сколько можно кэшировать один или другой запрос. И если поставить между сервисом и вызывающей стороной nginx, то он может держать у себя кэш на основе этих заголовков.
- Для более продвинутого кэширования можно вместо nginx взять varnish

### Инструменты

Php
Стандартное логирование запросов (nginx, apache, php-fpm)
Логирование медленных запросов БД (опция в mysql)
Инструменты фиксации узких мест при прохождении запроса. Для php это xhprof, pinba.
Встроенные инструменты внутри веб-приложения, например отдельный модуль трассировки.

### ms sql

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

таблиц в одной бд
https://technet.microsoft.com/library/Cc966380
Секция - файл группы http://sqlcom.ru/partition/partition-and-high-availability/
https://docs.microsoft.com/ru-ru/sql/relational-databases/partitions/partitioned-tables-and-indexes
http://www.sql.ru/articles/mssql/2005/073102partitionedtablesandindexes.shtml скользящее окно. 

### Sql query plan

Плохо
Index scan
Rid / key lookup - чтение из кучи databaselog. https://dotnettutorials.net/lesson/how-to-use-covering-index-to-reduce-rid-lookup/
Статистика плана запросов устаревает- см сколько записей оптимизатор предполагает вернуть, а сколько по факту
Physical reads не из Кеша данных

Хорошо
Index seek
Logical reads

## Метрики

- __Client Metrics__ - Данные метрики сконцентрированы на измерении производительности клиентских приложений. 
  - Например, как долго клиентское приложение выполняет действия локально и обрабатывает ответ от серверной части. 
  - Эти метрики покрывают такие данные, как объем используемой памяти и загрузку CPU. На мобильном устройстве высокая загрузка CPU и частое использование сети может привести к уменьшению срока службы батареи, а использование слишком большого объема памяти вообще может помешать приложению запуститься.
- __Business Metrics__ - Сюда включаются данные, определяющие бизнес-процессы. Они касаются деятельности конечных пользователей. Эти показатели должны включать ключевые бизнес-операции, которые выполняет система
- __Application Metrics__ - Данные метрики сосредоточены на измерении активности и производительности прикладного уровня (исходный код приложения, фреймворк, среда исполнения, например .NET Framework, ASP.NET, CLR, и т.п.). 
  - Цель этих метрик – помочь вам исследователь поток выполнения вашего приложения при большом количестве параллельных запросов, проанализировать потребляемые ресурсы и оценить вероятность проблем с производительностью
- __System Metrics__ - Это данные о производительности низкого уровня (уровень базовой инфраструктуры). Они обычно нацелены на ключевые показатели эффективности, связанные с __памятью, сетевой утилизацией, активностью диска, использованием процессора__
- __Service Metrics__ - Сюда относятся данные, связанные с производительностью внешних сервисов, таких как Azure Storage, инфраструктурой обмена сообщений, внешним кэшем, БД и другими внешними сервисами, которые ваше приложение может использовать. Эти данные не отражают чистую производительность внешних сервисов, а всего лишь содержат информацию об исполнении запросов, которые ваша система им отправляет.

### Business Metrics

- Макс пользователей
- Как долго система выполняет операцию? (время отклика/задержка)
- Максимальное время загрузки страницы (300мс отлично)

### Application Metrics

- Сколько операций может выполнить система за определенный период времени? (пропускная способность)
- Сколько операций могут быть выполнены одновременно? (параллелизм)
- Сколько резервной мощности требуется системе для обеспечения роста нагрузки? (запас ресурсов)
- Сколько исключений система генерит под нагрузкой? (частота ошибок)

### System Metrics

- CPU User time
- CPU System time (Может  показывать на неэффективный ввод-вывод, т.е. слишком большое количество мелких операций)
- HDD Number of reads
- HDD Number of writes
- HDD bytes readed
- HDD bytes written
- Network Number of reads
- Network number of writes
- Network bytes readed
- Network bytes written
- RAM Private space used by application
- RAM Shared space used by application
- RAM Number of page faults (насколько локализованы данные приложения в памяти?)

### Client Metrics: Приложение front-end

- Google [Web Vitals](https://web.dev/i18n/en/vitals/)
  - [Core](https://timeweb.com/ru/community/articles/core-web-vitals) __75-й процентиль__
    - LCP - насколько быстро происходит скорость загрузки страницы - <2.5-4c
    - FID - как быстро происходит взаимодействие с сайтом - <1-3c
    - CLS - корректно ли работают в совокупности все элементы - <0.1-0.25
  - [Дополнительно](https://web.dev/vitals/?utm_source=pocket_saves#drugie-pokazateli-web-vitals)
    - Time to First Byte (TTFB) - Время до первого байта
    - First Contentful Paint (FCP) - Первая отрисовка контента
    - Total Blocking Time (TBT) - Общее время блокировки
    - Time to Interactive (TTI) - Время до интерактивност
  - Иснтрументы
    - [pagespeed](https://pagespeed.web.dev/)
    - [lighthouse](https://developer.chrome.com/docs/lighthouse/overview/)
- Yandex [ИКС](https://kokoc.com/terminy/chto-takoe-iks-sajta-v-yandekse/)
  - Учитывает Web Vitals

### Service Metrics: API

- Latency Задержка - __0,1-1 сек__.
![scheme](https://blog.hubspot.com/hs-fs/hubfs/Google%20Drive%20Integration/API%20Response%20Time%2c%20Explained%20in%201000%20Words%20or%20Less-1.jpeg?width=650&name=API%20Response%20Time%2c%20Explained%20in%201000%20Words%20or%20Less-1.jpeg)
  - API [Benchmark](https://github.com/tsenart/vegeta) Latency
- [Response Time Время отлика](https://blog.hubspot.com/website/api-response-time) - __[1-2 сек](https://sematext.com/glossary/response-time/)__:
  - DNS Lookup Time  
  - Authentication and connection time
  - Redirect Time 
  - Time to First Byte
  - Time to Last byte
  - Benchmark 
    - [JMeter](https://www.guru99.com/response-time-testing.html)

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
