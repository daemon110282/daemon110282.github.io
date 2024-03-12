# IIS

- [IIS](#iis)
	- [Архитектура](#архитектура)
		- [Modules](#modules)
		- [Процесс обработки запроса (Pipeline) и основные компоненты](#процесс-обработки-запроса-pipeline-и-основные-компоненты)
	- [Мониторинг](#мониторинг)
	- [log-parser](#log-parser)
	- [Трассировка](#трассировка)
	- [Version](#version)

## Архитектура

[Request-processing architecture](https://learn.microsoft.com/en-us/iis/get-started/introduction-to-iis/introduction-to-iis-architecture)
 which includes:

- Protocol listener
	- IIS provides Hypertext Transfer Protocol Stack __HTTP.sys__ as the protocol listener that listens for HTTP and HTTPS requests.
	- Windows Communication Foundation (__WCF__) - protocols other than HTTP and HTTPS
- __WWW Service__
- __Windows Process Activation Service (WAS)__, which enables sites to use protocols other than HTTP and HTTPS.
	- конфигурация храниться в ApplicationHost.config
	- manages for both HTTP and non-HTTP requests
		- __application pools__
		- and __worker processes__ (w3wp.exe)
- Web server engine that can be customized by adding or removing __modules__.
- Integrated request-processing __pipelines from IIS and ASP.NET__.

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

- [IIS 7](https://krishnansrinivasan.wordpress.com/2014/08/18/throttling-wcf-services-on-iis7/) - на разных версиях IIS может отличаться. IIS listens for HTTP __requests__ (as well as requests for other protocols) before creating __worker processes__ to [handle the request](https://learn.microsoft.com/en-us/iis/get-started/introduction-to-iis/introduction-to-iis-architecture?#http-request-processing-in-iis)
  - listener Hypertext Transfer Protocol Stack HTTP.SYS ([метрики](iis.performance.metric.md#httpsys))
    - Waits for an HTTP request and then sends the __request__ to an IIS service for processing.
      - HTTP.sys contacts WAS to obtain information from the __configuration__ store
        - WAS requests configuration information from the configuration store, __applicationHost.config__
    		- The WWW Service receives configuration information, such as application pool and site configuration.
            	- The WWW Service uses the configuration information to configure HTTP.sys.
        - WAS starts a __worker process__ for the __application pool__ to which the request was made.
      - IIS __Application pool__ 1 ([метрики](iis.performance.metric.md#application-pool)) - container for __worker processes__, isolate site
        - __IIS Worker Processes__ 1 ([метрики](iis.performance.metric.md#worker-process-w3wpexe))
	      - ASP.NET: __CLR__ Thread ([метрики](iis.performance.metric.md#aspnet-clr-thread))
            - ASP.NET __App__ 1 ([метрики](iis.performance.metric.md#app))
            - ASP.NET App X
        - IIS Worker Processes X
      - IIS App pool X
        - IIS Worker Processes 1
        - IIS Worker Processes X
    - When processing is complete, HTTP.sys sends the __response__ back to the browser.
    - HTTP.sys also has a __cache__ and if it has the requested file in cache it can return it directly to the client browser without having to contact any IIS services for processing.
  - listener [WCF Service](protocols.integration/wcf.md)

[MIRO flow](https://miro.com/app/board/uXjVOMlBLHQ=/?moveToWidget=3458764577785621378&cot=14)

## Мониторинг

- [Zabbix Agent Metric](https://www.zabbix.com/integrations/iis)
- [Grafana](https://grafana.com/docs/grafana-cloud/data-configuration/integrations/integration-reference/integration-microsoft-iis/)
- Метрики
	- Производительность [Быстродействие](iis.performance.metric.md) измеряют показатели атрибута качества ИС [Быстродействие](../arch/ability/performance.md)
	- Надежность

## log-parser

- [log-parser](https://www.symantec.com/connect/articles/forensic-log-parsing-microsofts-logparser)
- [log parser studio](https://techcommunity.microsoft.com/t5/exchange-team-blog/introducing-log-parser-studio/ba-p/601131)
- [example](https://mlichtenberg.wordpress.com/2011/02/03/-log-parser-rocks-more-than-50-examples/)
- Hourly Bandwidth (__chart__) Requests by URI
- __Search__ the Event Log for W3SVC (IIS)
- For example, Bytes Sent and Bytes Received are not selected, but they are very useful when troubleshooting a performance problem.  
	- в IIS логах есть?? sc-bytes, cs-bytes	НЕТУ
- https://docs.microsoft.com/en-us/iis/troubleshoot/performance-issues/troubleshooting-iis-performance-issues-or-application-errors-using-logparser
- !!! https://docs.microsoft.com/en-us/iis/troubleshoot/performance-issues/troubleshooting-high-cpu-in-an-iis-7x-application-pool
- http://software-testing.ru/library/testing/performance-testing/468-weblog

## Трассировка

IIS Failed Request Tracing

- [fiddler on iis app](http://www.markhneedham.com/blog/2009/06/24/using-fiddler-with-iis/)
- [FREB](https://blogs.msdn.microsoft.com/docast/2016/04/28/troubleshooting-iis-request-performance-slowness-issues-using-freb-tracing/)
	- For slow __ASP.NET Webforms applications__ there are a lot of benefits for using FREB.
	- for troubleshooting slow ASP.NET MVC web sites using __PerfView__
- [CPU, ERROR, RAM leak](https://www.iis.net/learn/troubleshoot/performance-issues)
- [WCF](protocols.integration/wcf.md#трассировка)

## Version

- 8.5
- [10](https://www.thebestcsharpprogrammerintheworld.com/2017/12/02/whats-new-in-iis-10-microsoft-internet-information-services-10-new-features/)
	- Failed request tracing – traceAllAfterTimeout
	- HTTP/2
