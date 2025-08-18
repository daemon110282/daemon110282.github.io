# IIS

- [IIS](#iis)
  - [Архитектура](#архитектура)
    - [Modules](#modules)
    - [Процесс обработки запроса (Pipeline) и основные компоненты](#процесс-обработки-запроса-pipeline-и-основные-компоненты)
  - [Мониторинг](#мониторинг)
  - [Логирование](#логирование)
    - [log-parser](#log-parser)
  - [Диагностика Troubleshooting](#диагностика-troubleshooting)
  - [Version](#version)

## Архитектура

[Request-processing architecture](https://learn.microsoft.com/en-us/iis/get-started/introduction-to-iis/introduction-to-iis-architecture)
 which includes:

- __Protocol listener__
  - IIS provides Hypertext Transfer Protocol Stack __HTTP.sys__ as the protocol listener
    - listens for HTTP and HTTPS requests on website binding endpoints
    - If __no worker process is available__ to handle a request, HTTP.sys places the request in a kernel-mode __queue__
    - Затем это позволяет рабочим процессам IIS (IIS worker processes) выводить эти запросы из очереди на обработку.
    - Logs written into: C:\Windows\System32\LogFiles\HTTPERR
  - Windows Communication Foundation (__WCF__) - protocols other than HTTP and HTTPS
- __World Wide Web (WWW) Publishing Service__ (W3SVC)
  - runs as part of an instance of the process __svchost.exe__
  - The IIS web service that __configures Http.sys to listen for requests__ based on your __IIS WebSite__ configuration.
  - __collects performance counters__ for each __IIS site__
  - User-mode [listener adapter for HTTP.sys](https://techcommunity.microsoft.com/t5/iis-support-blog/iis-services-http-sys-w3svc-was-w3wp-oh-my/ba-p/287856)
  - Logs written into: System Event Viewer
- __Windows Process Activation Service (WAS/WPAS)__
  - enables sites to use protocols other than HTTP and HTTPS. manages for both HTTP and non-HTTP requests  
  - The IIS service that __coordinates__
    - the __creation of IIS worker processes (w3wp.exe)__
    - based on your __application pool configuration__
  - конфигурация храниться в ApplicationHost.config
  - Logs
    - written into: System Event Viewer
    - IIS Logs in C:\intepub\logs\LogFiles\W3SVC*
- __Application pool__ - This is a __logical container__, not a physical process
  - The application pool __routes request__ processing for a __set of applications in your website__ to a specific __IIS worker process__  
- IIS __worker processes (w3wp.exe)__ - this is the actual __runtime host__ for the __application__, where request processing takes place
  - Worker processes in one pool __do not share resources with other pools__
  - You can pass configuration settings to a single pool to, for instance, __throttle the CPU utilization of its workers__
  - Each application pool defaults to a single worker process, and you can configure your pools to include more
  - When we talk about __restarting or recycling the application pool__, we are actually talking about __starting a new fresh worker process__
- Application
  - An IIS application maps a url in your website to a __physical ASP.NET application__ domain that’s hosting your application code
  - When you are having performance issues, it’s the application code and its memory state that is usually causing the trouble. It could be a hang, high CPU, or a memory leak ... the application is the piece we really need to restart.
- Web server engine that can be customized by adding or removing __[modules](#modules)__

### Modules

[Modules](https://learn.microsoft.com/en-us/iis/get-started/introduction-to-iis/introduction-to-iis-architecture?#modules-in-iis):

- [Native Modules](https://learn.microsoft.com/en-us/iis/get-started/introduction-to-iis/iis-modules-overview)
  - HTTP Modules
  - Security Modules
  - Content Modules
  - Compression Modules
  - Caching Modules
  - Logging and Diagnostics Modules
- Managed Modules

### Процесс обработки запроса (Pipeline) и основные компоненты

- [IIS 7](https://krishnansrinivasan.wordpress.com/2014/08/18/throttling-wcf-services-on-iis7/) - на разных версиях IIS может отличаться.
- IIS listens for HTTP __requests__ (as well as requests for other protocols) before creating __worker processes__ to [handle the request](https://learn.microsoft.com/en-us/iis/get-started/introduction-to-iis/introduction-to-iis-architecture?#http-request-processing-in-iis)
  - listener __HTTP__ Stack HTTP.SYS ([метрики](iis.performance.metric.md#httpsys))
    - Waits for an HTTP request and then sends the __request__ to an IIS service for processing
      - __HTTP.sys__ contacts WAS to obtain information from the __configuration__ store
        - WAS requests configuration information from the configuration store, __applicationHost.config__
        - __HTTP.sys__ receives from __WWW Service (W3SVC)__ configuration information, such as __IIS Application pool__ and __IIS WebSite__ configuration.
      - WAS starts\creater a __worker process__ for the __application pool__ to which the request was made.
      - IIS __Application pool__ 1 ([метрики](iis.performance.metric.md#application-pool)), isolate site
        - __IIS Worker Process (w3wp.exe)__ 1 ([метрики](iis.performance.metric.md#worker-process-w3wpexe-w3svc_w3wp))
	      - ASP.NET: __CLR__ Thread ([метрики](iis.performance.metric.md#aspnet))
            - Application 1 ([метрики](iis.performance.metric.md#app))
            - Application X
        - IIS Worker Process X
      - IIS Application pool X
        - IIS Worker Process 1
        - IIS Worker Process X
    - When processing is complete, HTTP.sys sends the __response__ back to the browser.
    - HTTP.sys also has a __cache__ and if it has the requested file in cache it can return it directly to the client browser without having to contact any IIS services for processing.
  - listener __[WCF Service](../../protocols.integration/wcf.md)__

[MIRO flow](https://miro.com/app/board/uXjVOMlBLHQ=/?moveToWidget=3458764577785621378&cot=14)

## Мониторинг

- [Метрики](iis.performance.metric.md)
	- Производительность измеряют показатели атрибута качества ИС [Быстродействие](../../../arch/ability/performance/performance.md)
	- Надежность
- Сбор метрик
  - [Performance Monitor Windows Server](../../troubleshooting/perfmon.md)
  - [Zabbix Agent Metric](https://www.zabbix.com/integrations/iis)
  - [Grafana](https://grafana.com/docs/grafana-cloud/data-configuration/integrations/integration-reference/integration-microsoft-iis/)

## Логирование

### log-parser

- [log-parser](https://www.symantec.com/connect/articles/forensic-log-parsing-microsofts-logparser)
- [log parser studio](https://techcommunity.microsoft.com/t5/exchange-team-blog/introducing-log-parser-studio/ba-p/601131)
- [example](https://mlichtenberg.wordpress.com/2011/02/03/-log-parser-rocks-more-than-50-examples/)
- Hourly Bandwidth (__chart__) Requests by URI
- __Search__ the Event Log for W3SVC (IIS)
- Bytes Sent and Bytes Received are not selected, but they are very useful when troubleshooting a performance problem.  
	- в IIS логах есть?? sc-bytes, cs-bytes	НЕТУ
- [sample](https://docs.microsoft.com/en-us/iis/troubleshoot/performance-issues/troubleshooting-iis-performance-issues-or-application-errors-using-logparser)
- [!!!](https://docs.microsoft.com/en-us/iis/troubleshoot/performance-issues/troubleshooting-high-cpu-in-an-iis-7x-application-pool)
- [weblog](http://software-testing.ru/library/testing/performance-testing/468-weblog)

## Диагностика Troubleshooting

- [Настройки](iis.performance.settings.md)
- [Use Case](iis.troubleshooting.md#use-case)
- [Dump](iis.troubleshooting.md#dump)
- [Трассировка](iis.troubleshooting.md#трассировка)

## Version

- 8.5
- [10](https://www.thebestcsharpprogrammerintheworld.com/2017/12/02/whats-new-in-iis-10-microsoft-internet-information-services-10-new-features/)
	- Failed request tracing – traceAllAfterTimeout
	- HTTP/2
