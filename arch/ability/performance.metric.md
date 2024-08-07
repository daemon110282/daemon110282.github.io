# performance metric

- [performance metric](#performance-metric)
  - [Зачем](#зачем)
  - [Методики выбора метрик](#методики-выбора-метрик)
  - [Виды метрик](#виды-метрик)
    - [Business Metrics](#business-metrics)
    - [Application Metrics](#application-metrics)
    - [System Metrics](#system-metrics)
      - [Virtual Machine](#virtual-machine)
      - [Кеш](#кеш)
      - [Балансирощик](#балансирощик)
      - [СУБД](#субд)
      - [Backend](#backend)
      - [Контейнеризация](#контейнеризация)
      - [File Storage](#file-storage)
      - [MessageBus](#messagebus)
    - [Client Metrics: Приложение front-end](#client-metrics-приложение-front-end)
    - [Service Metrics](#service-metrics)
      - [API](#api)

## Зачем

Измеряем атрибут качества ИС [производительность](performance.md).

To-do

- [datadog](https://www.datadoghq.com/blog/monitoring-101-collecting-data/)

## Виды метрик

- __[Client Metrics](#client-metrics-приложение-front-end)__ - Данные метрики сконцентрированы на измерении производительности клиентских приложений
  - Например, как долго клиентское приложение выполняет действия локально и обрабатывает ответ от серверной части.
  - Эти метрики покрывают такие данные, как объем используемой памяти и загрузку CPU. На мобильном устройстве высокая загрузка CPU и частое использование сети может привести к уменьшению срока службы батареи, а использование слишком большого объема памяти вообще может помешать приложению запуститься.
- __[Business Metrics](#business-metrics)__ - Сюда включаются данные, определяющие бизнес-процессы. Они касаются деятельности конечных пользователей. Эти показатели должны включать ключевые бизнес-операции, которые выполняет система
- __[Application Metrics](#application-metrics)__ - Данные метрики сосредоточены на измерении активности и производительности __прикладного уровня__ (исходный код приложения, фреймворк, среда исполнения, например .NET Framework, ASP.NET, CLR, и т.п.).
  - Цель этих метрик – помочь вам исследователь поток выполнения вашего приложения при большом количестве параллельных запросов, проанализировать потребляемые ресурсы и оценить вероятность проблем с производительностью
- __[Service Metrics](#service-metrics)__ - Сюда относятся данные, связанные с производительностью внешних сервисов. Эти данные не отражают чистую производительность внешних сервисов, а всего лишь __содержат информацию об исполнении запросов__, которые ваша система им отправляет.
  - таких как Azure Storage
  - инфраструктурой обмена сообщений
  - внешним кэшем
  - БД
  - и другими внешними сервисами, которые ваше приложение может использовать.
- __[System Metrics](#system-metrics)__ - Это данные о производительности низкого уровня (уровень базовой инфраструктуры). Они обычно нацелены на ключевые показатели эффективности, связанные с __памятью, сетевой утилизацией, активностью диска, использованием процессора__

### Business Metrics

Сюда включаются данные, определяющие бизнес-процессы. Они касаются деятельности конечных пользователей. Эти показатели должны включать ключевые бизнес-операции, которые выполняет система:

- Макс пользователей
- Как долго система выполняет операцию? (время отклика/задержка)
- Максимальное время загрузки страницы (300мс отлично)
- TODO [Business Metrics](https://docs.google.com/spreadsheets/d/1g-WsAqeJqpKDbFLsVx0EOAuaRMUMWPaaG2a7XHWGgWU/edit#gid=1431606873)

### Application Metrics

Данные метрики сосредоточены на измерении активности и производительности прикладного уровня (исходный код приложения, фреймворк, среда исполнения, например .NET Framework, ASP.NET, CLR, и т.п.):

- Сколько операций может выполнить система за определенный период времени? (пропускная способность)
- Сколько операций могут быть выполнены одновременно? (параллелизм)
- Сколько резервной мощности требуется системе для обеспечения роста нагрузки? (запас ресурсов)
- Сколько исключений система генерит под нагрузкой? (частота ошибок)

Характеристика - Единицы измерения, по методике RED:

- Traffic Request
  - Сколько операций может выполнить система за определенный период времени? (пропускная способность)
  - Сколько операций могут быть выполнены одновременно? (параллелизм)
  - Макс пользователей
  - Число вызовов в сутки / в ЧПН
  - Объем запроса, Объем ответа  
- Errors
  - Сколько исключений система генерит под нагрузкой? (частота ошибок)
  - Ошибки обращений к страницам диска - Количество, частота следования в секунду
  - Исключительные ситуации errors, HTTP Error 503.2 — Service Unavailable - Количество, частота следования в секунду
  - Сколько исключений система генерит под нагрузкой? (частота ошибок)
- Duration Latency
  - Как долго система выполняет операцию? (время отклика/задержка)
  - Время загрузки страницы (<=300мс отлично)
  - Время отклика\задержки Latency, выполнения среднее\макс для 90% (персентиль) запросов - Миллисекунды

### System Metrics

Это данные о производительности низкого уровня (уровень базовой инфраструктуры). Они обычно нацелены на ключевые показатели эффективности, связанные с памятью, сетевой утилизацией, активностью диска, использованием процессора в разрезе компонентов ИС:

- CPU
  - Нагрузка на CPU - Процент
  - CPU User time
  - CPU System time (Может  показывать на неэффективный ввод-вывод, т.е. слишком большое количество мелких операций)
- HDD
  - Дисковые операции СХД	- Количество, частота следования в секунду
  - HDD Number of reads IOPS
  - HDD Number of writes IOPS
  - HDD bytes readed
  - HDD bytes written
- Network
  - Сетевые операции, канал забит -	Количество, частота следования в секунду
  - объем трафика bandwidth, какие урлы сколько трафика генерируют
  - трафик на сетевых интерфейсах
  - Network Number of reads
  - Network Number of writes
  - Network bytes readed
  - Network bytes written
- RAM
  - RAM Private space used by application
  - RAM Shared space used by application
  - RAM Number of page faults (насколько локализованы данные приложения в памяти?)
  - Использование физической/виртуальной памяти	- Байты, килобайты, мегабайты, гигабайты
  - Выделение блоков памяти - Количество байтов, количество объектов, частота следования в секунду

#### Virtual Machine

- параметры [виртуалки VMWare](https://habrahabr.ru/post/259087/)

#### Кеш
  
- redis
  - Утилизация памяти
  - операции чтения\записи с диска
- Hit Rate Количество, частота попаданий в кеш	в секунду

#### Балансирощик

- [балансировщик](../pattern/deployment/load.balancing.md) прокси, nginx, netscaler - как балансировка на ноды работает, время ответ нод балансировщику

#### СУБД

- [mssql](../../technology/db/mssql/mssql.performance.metric.md)
- [postgresql](../../technology/db//postgresql/postgresql.performance.metric.md)

#### Backend

- [IIS](../../technology/middleware/webserver/iis.performance.metric.md)

#### Контейнеризация

- [k8s](../../technology/ci-cd/k8s.md)

#### File Storage

- [minio](../../technology/filesystem/minio.md)

#### MessageBus

- [rmq](../../technology/middleware/messagebus/rmq.md)

### Client Metrics: Приложение front-end

- Google [Web Vitals](https://web.dev/i18n/en/vitals/)
  - [Core](https://timeweb.com/ru/community/articles/core-web-vitals) __75-й процентиль__
    - [LCP](https://habr.com/ru/companies/vk/articles/577792/) - насколько быстро происходит скорость загрузки страницы - <2.5-4c
    - FID - как быстро происходит взаимодействие с сайтом - <1-3c
    - CLS - корректно ли работают в совокупности все элементы - <0.1-0.25
  - [Дополнительно](https://web.dev/vitals/?utm_source=pocket_saves#drugie-pokazateli-web-vitals)
    - Time to First Byte (TTFB) - Время до первого байта
    - First Contentful Paint (FCP) - Первая отрисовка контента
    - Total Blocking Time (TBT) - Общее время блокировки
    - Time to Interactive (TTI) - Время до интерактивности
  - Иснтрументы
    - [pagespeed](https://pagespeed.web.dev/)
    - gtmetrix.com
    - [lighthouse](https://developer.chrome.com/docs/lighthouse/overview/)
- Yandex [ИКС](https://kokoc.com/terminy/chto-takoe-iks-sajta-v-yandekse/)
  - Учитывает Web Vitals
- Navigation timing API
  - Метрики: DNS, transfer time, response time, TCP

### Service Metrics

Сюда относятся данные, связанные с производительностью внешних сервисов. Эти данные не отражают чистую производительность внешних сервисов, а всего лишь содержат информацию об исполнении запросов, которые ваша система им отправляет.

#### API

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
