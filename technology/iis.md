# IIS

- [IIS](#iis)
	- [Метрики производительности](#метрики-производительности)
		- [HTTP.SYS](#httpsys)
		- [ASP.NET: CLR Thread](#aspnet-clr-thread)
		- [worker process](#worker-process)
		- [Application Pool](#application-pool)
		- [APP](#app)
	- [log-parser](#log-parser)
	- [Трассировка](#трассировка)
	- [Мониторинг](#мониторинг)

Процесс обработки запроса и основные компоненты:

- [IIS7](https://krishnansrinivasan.wordpress.com/2014/08/18/throttling-wcf-services-on-iis7/), на разных версиях IIS может отличаться
  - [HTTP.SYS](#httpsys)
  - ASP.NET: [CLR Thread](#aspnet-clr-thread)
  - [IIS Worker Processes](#worker-process)
  	- IIS [App pool1](#application-pool)
    	- [WCF Service](protocols.integration/wcf.md)
    		- ASP.NET [App1](#app)
    		- ASP.NET App2
  	- IIS App pool2

## Метрики производительности

[ability](../arch/ability/performance.md)

### HTTP.SYS

- Queue
  - Http Service Request Queues\CurrentQueueSize

### IIS

- Web Service\ [Current Connections](http://www.microsoft.com/technet/prodtechnol/WindowsServer2003/Library/IIS/af36e903-75c3-4a4c-ae47-8663f8543b0c.mspx?mfr=true) – [общее число активных подключений на сервере IIS](https://winitpro.ru/index.php/2015/02/13/monitoring-kolichestva-polzovatelej-na-sajte-iis/). 
	- Можно мерить в разрезе конкретного сайта IIS. 
	- Любые запросы к сайту, не только к Веб-сервисам.
	- [Просмотр списка соединений IIS8](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/jj635856(v=ws.11))

### ASP.NET: CLR Thread

- Queue
  - ASP.NET v4.0.30319\Requests Queued - limit Process Model’s [RequestQueueLimit](https://krishnansrinivasan.wordpress.com/2014/08/18/throttling-wcf-services-on-iis7/)

### worker process

- [W3SVC_W3WP](https://blogs.iis.net/mailant/new-worker-process-performance-counters-in-iis7) - exposes HTTP request processing related counters for the __worker process__
	- [Maximum Threads Count](https://www.dotnetfunda.com/articles/show/3485/11-tips-to-improve-wcf-restful-services-performance)
	- Active Threads Count - Number of threads actively processing requests in the worker process
	- Requests / Sec - HTTP requests/sec being processed by the worker process
	- Active Requests - Current number of requests being processed by the worker process
	- Threads Per Processor Limit in IIS
	- HTTP Service Request Queues (CurrentQueueSize): [The request count in the IIS queue](https://techcommunity.microsoft.com/t5/iis-support-blog/performance-counters-for-monitoring-iis/ba-p/683389)
	- .NET CLR Exceptions

### Application Pool

[concurrent](https://www.dotnetfunda.com/articles/show/3485/11-tips-to-improve-wcf-restful-services-performance)

  - maxConcurrentRequestsPerCPU
  - maxConcurrentThreadsPerCPU
  - requestQueueLimit
  - Maximum Worker [Processes in IIS application pool](https://www.dotnetfunda.com/articles/show/3485/11-tips-to-improve-wcf-restful-services-performance)
  - два основных параметра, влияющих на [доступность приложения и его производительность](https://habr.com/ru/articles/250881/).
	- appConcurrentRequestLimit — __максимальное количество одновременных запросов__ в приложении. Увеличение числа одновременных запросов IIS расширит доступные ресурсы веб-сервера для обслуживания запросов.
    	- Значение по умолчанию — 5000. UsersCount * 1.5, где usersCount — количество одновременно работающих пользователей
	- QueueLength — максимальное количество запросов, которые драйвер Http.sys размещает в очереди пула приложений

### APP

- [iis perf counters](https://msdn.microsoft.com/en-us/library!/ms972959.aspx?f=255&MSPPError=-2147217396)
  - [Performance Counters for ASP.NET](https://msdn.microsoft.com/en-us/library/fxk122b4.aspx)
  - Performance Counters for [WCF service](protocols.integration/wcf.md) дополнительно
- RPS
	- ASP.NET\Requests Current - суммарное количество выполняющихся в настоящее время запросов. Значение этого счетчика включает в себя число обрабатывающися запросов, находящихся в очереди и ожидающих отправки клиенту. Если это значение превышает параметр requestQueueLimit, который расположен в секции processModelsection файла конфигурации веб-сервера, то последующие запросы будут отбрасываться
		- [View Currently Executing Requests in a Worker Process (IIS 7)](https://technet.microsoft.com/en-us/library/cc732518(v=ws.10).aspx)
		- [IIS->Worker process->View Current Request](https://habrahabr.ru/post/250881/)
	- ASP.NET Application\Requests Executing - показывает количество одновременно выполняющихся запросов
	- ASP.NET Application\Requests/sec - текущую пропускную способность приложения
- Duration Latency
	- ASP.NET Application\Request Execution Time - время выполнения (в мс) последнего запроса
	- Queue
		- ASP.NET\Requests Queued -[число запросов ожидающих в очереди на обработку](https://habrahabr.ru/post/250881/) - "ASP.NET v4.0.30319Requests Queued" performance counter, WMI.WorkerProcess.GetExecutingRequests
		- ASP.NET\Application\Request Wait Time - время ожидания в очереди последнего запроса
		- Проверьте логи на наличие ошибки "HTTP Error 503.2 — Service Unavailable". Постарайтесь определить, не блокируется ли часть запросов в очереди
- Error
	- Requests Rejected Отклонено запросов – Общее количество невыполненных запросов ввиду __нехватки ресурсов сервера__ на их обработку.
- ASP.NET Sessions
	- ASP.NET\Sessions Timed Out - Количество сеансов, время ожидания которых истекло.
	- ASP.NET\Sessions Total
- [ASP.NET Core metrics](https://github.com/dotnet/aspnetcore/issues/47536)

## log-parser

[log-parser](https://www.symantec.com/connect/articles/forensic-log-parsing-microsofts-logparser)

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
- [CPU, ERROR, RAM leak](https://www.iis.net/learn/troubleshoot/performance-issues)

## Мониторинг

- [Zabbix Agent Metric](https://www.zabbix.com/integrations/iis)
- [Grafana](https://grafana.com/docs/grafana-cloud/data-configuration/integrations/integration-reference/integration-microsoft-iis/)

## Version

- 8.5
- [10](https://www.thebestcsharpprogrammerintheworld.com/2017/12/02/whats-new-in-iis-10-microsoft-internet-information-services-10-new-features/)
	- Failed request tracing – traceAllAfterTimeout
	- HTTP/2