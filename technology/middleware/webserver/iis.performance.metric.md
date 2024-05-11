# Метрики Производительность Быстродействие

- [Метрики Производительность Быстродействие](#метрики-производительность-быстродействие)
	- [TODO](#todo)
	- [HTTP.SYS](#httpsys)
	- [Web Admin Service (WAS\_W3WP)](#web-admin-service-was_w3wp)
	- [W3SVC](#w3svc)
	- [Application Pool](#application-pool)
	- [Worker process (w3wp.exe) (W3SVC\_W3WP)](#worker-process-w3wpexe-w3svc_w3wp)
	- [ASP.NET](#aspnet)
	- [APP](#app)

## TODO

- <https://habr.com/ru/articles/250881/>
- <https://technet.microsoft.com/en-us/library/cc732518(v=ws.10).aspx>
- <https://habrahabr.ru/post/250881/>	good
- <https://mlichtenberg.wordpress.com/2011/02/03/log-parser-rocks-more-than-50-examples/>
- <https://www.symantec.com/connect/articles/forensic-log-parsing-microsofts-logparser>
- <https://blogs.msdn.microsoft.com/docast/2016/04/28/troubleshooting-iis-request-performance-slowness-issues-using-freb-tracing/>
- <https://www.iis.net/learn/troubleshoot/performance-issues>

## HTTP.SYS

- [Queue](https://blog.leansentry.com/all-about-iis-asp-net-request-queues/)
  - [x] "Http Service Request Queues\CurrentQueueSize" - [The request count in the queue](https://techcommunity.microsoft.com/t5/iis-support-blog/performance-counters-for-monitoring-iis/ba-p/683389)
  - [x] "Http Service Request Queues\MaxQueueItemAge" - This means IIS is falling behind in request processing, so all incoming requests are __waiting at least this long__ to begin getting processed
  - [x] "Http Service Request Queues\ArrivalRate" - This basically implies that __more requests are coming__ into the system __than are being processed__, and this always eventually results in __queueing__

## Web Admin Service (WAS_W3WP)

- [x] "Total WAS Messages Received" - Total number of messages received by the worker process from WAS
- [x] "Total Messages Sent to WAS" - Total number of messages sent to WAS by the worker process
- TODO
  - "Messages Sent to WAS" - Total count of messages sent to WAS
  - "Total Requests Served" - Total number of requests served by the worker process. This counter is only meaningful when request based recycling is enabled for the application pool.

## W3SVC

- [x] ["Web Service\Current Connections"](http://www.microsoft.com/technet/prodtechnol/WindowsServer2003/Library/IIS/af36e903-75c3-4a4c-ae47-8663f8543b0c.mspx?mfr=true) – [общее число активных подключений на сервере IIS](https://winitpro.ru/index.php/2015/02/13/monitoring-kolichestva-polzovatelej-na-sajte-iis/)
	- Можно мерить в разрезе конкретного сайта IIS
	- Любые запросы к сайту, не только к Веб-сервисам
	- [Просмотр списка соединений IIS8](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/jj635856(v=ws.11))
- [x] "\Web Service(*)\Bytes Sent/sec"
- [x] "\Web Service(*)\Bytes Received/sec"

## Application Pool

- [x] \APP_POOL_WAS(*)\Maximum Worker Processes
- [x] \APP_POOL_WAS(*)\Current Worker Processes

## Worker process (w3wp.exe) (W3SVC_W3WP)

[W3SVC_W3WP](https://blogs.iis.net/mailant/new-worker-process-performance-counters-in-iis7) - exposes HTTP request processing related counters for the __worker process__

- Saturation
	- [x] ["Maximum Threads Count"](https://www.dotnetfunda.com/articles/show/3485/11-tips-to-improve-wcf-restful-services-performance) - Maximum number of threads to which the thread pool can grow as needed
	- [x] "Total Threads" - Total number of threads available to process requests in the worker process
      - Threads Per Processor Limit in IIS
- Traffic
	- [x] "Requests / Sec" - HTTP requests/sec being processed by the worker process
	- [x] "Active Requests" - Current number of requests being processed by the worker process   - "Total HTTP Requests Served" - Total number of HTTP requests served by the worker process
- Latency
	- [x] "Active Threads Count" - Number of threads actively processing requests in the worker process
- Errors
	- .NET CLR Exceptions

## ASP.NET

- Traffic
  - [x] "\ASP.NET\Requests Current"
- Latency
  - [x] "ASP.NET v4.0.30319\Requests Queued" - limit Process Model’s [RequestQueueLimit](https://krishnansrinivasan.wordpress.com/2014/08/18/throttling-wcf-services-on-iis7/)
- Errors
  - [x] "\ASP.NET\Requests Disconnected"
  - [x] "\ASP.NET\Requests Rejected"

- TODO к CLR Thread относятся?
	- ASP.NET\Worker Process Running - Количество рабочих процессов, запущенных на серверном компьютере.
	- ASP.NET\Requests Failed - Общее количество неудачных запросов. Любые коды состояния, превышающие или равные 400, увеличат этот счетчик.
	- ASP.NET Applications\Errors Total - Общее количество ошибок, возникающих во время выполнения HTTP-запросов, включая любые ошибки синтаксического анализа, компиляции или времени выполнения.
	- ASP.NET Application\Errors Total/Sec - Количество ошибок в секунду, возникающих во время выполнения HTTP-запросов, включая любые ошибки синтаксического анализа, компиляции или времени выполнения.

## APP

[iis perf counters](https://msdn.microsoft.com/en-us/library!/ms972959.aspx?f=255&MSPPError=-2147217396)

- [Performance Counters for ASP.NET](https://msdn.microsoft.com/en-us/library/fxk122b4.aspx)
- Performance Counters for [WCF service](../../protocols.integration/wcf.md) дополнительно
- Traffic
	- ASP.NET\Requests Current - суммарное количество выполняющихся в настоящее время запросов. Значение этого счетчика включает в себя число обрабатывающися запросов, находящихся в очереди и ожидающих отправки клиенту. Если это значение превышает параметр requestQueueLimit, который расположен в секции processModelsection файла конфигурации веб-сервера, то последующие запросы будут отбрасываться
		- [View Currently Executing Requests in a Worker Process (IIS 7)](https://technet.microsoft.com/en-us/library/cc732518(v=ws.10).aspx)
		- [IIS->Worker process->View Current Request](https://habrahabr.ru/post/250881/)
	- ASP.NET Application\Requests Executing - показывает количество одновременно выполняющихся запросов
	- ASP.NET Application\Requests/sec RPS - текущую пропускную способность приложения
- Latency
	- "ASP.NET Application\Request Execution Time" - время выполнения (в мс) последнего запроса
	- Queue
		- "ASP.NET\Requests Queued" - [число запросов ожидающих в очереди на обработку](https://habrahabr.ru/post/250881/)
		- "ASP.NET\Application\Request Wait Time" - время ожидания в очереди последнего запроса
    		- Проверьте логи на наличие ошибки "HTTP Error 503.2 — Service Unavailable". Постарайтесь определить, не блокируется ли часть запросов в очереди
- Error
	- "Requests Rejected" – Общее количество невыполненных запросов ввиду __нехватки ресурсов сервера__ на их обработку.
- ASP.NET Sessions
	- "ASP.NET\Sessions Timed Out" - Количество сеансов, время ожидания которых истекло
	- "ASP.NET\Sessions Total"
- [ASP.NET Core metrics](https://github.com/dotnet/aspnetcore/issues/47536)
