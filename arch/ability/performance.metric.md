# performance metric

- [performance metric](#performance-metric)
  - [Зачем](#зачем)
  - [Виды метрик](#виды-метрик)
    - [Business Metrics](#business-metrics)
    - [Application Metrics](#application-metrics)
    - [System Metrics](#system-metrics)
    - [Client Metrics: Приложение front-end](#client-metrics-приложение-front-end)
    - [Service Metrics: API](#service-metrics-api)

## Зачем

To-do
- https://www.datadoghq.com/blog/monitoring-101-collecting-data/
- Методики выбора метрик:
  - USE
  - RED
  - Google [SRE](https://habr.com/ru/companies/southbridge/articles/525176/) 4 Golden signals

Счетчики как внедрить:

- Client Metrics
- [Business Metrics](https://docs.google.com/spreadsheets/d/1g-WsAqeJqpKDbFLsVx0EOAuaRMUMWPaaG2a7XHWGgWU/edit#gid=1431606873)

## Виды метрик

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
- Network Number of writes
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
    - gtmetrix.com
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