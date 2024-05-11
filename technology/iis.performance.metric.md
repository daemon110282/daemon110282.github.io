# Метрики Производительность Быстродействие

- [Метрики Производительность Быстродействие](#метрики-производительность-быстродействие)
	- [TODO](#todo)
	- [HTTP.SYS](#httpsys)
	- [WAS\_W3WP](#was_w3wp)
	- [W3SVC](#w3svc)
	- [Application Pool](#application-pool)
	- [Worker process (w3wp.exe) W3SVC\_W3WP](#worker-process-w3wpexe-w3svc_w3wp)
	- [ASP.NET: CLR Thread](#aspnet-clr-thread)
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
  - "Http Service Request Queues\CurrentQueueSize"

## WAS_W3WP

- "Total WAS Messages Received"
  - Total number of messages received by the worker process from Web Admin Service.
- "Messages Sent to WAS"
  - Total count of messages sent to WAS
- "Total Requests Served"
  - Total number of requests served by the worker process. This counter is only meaningful when request based recycling is enabled for the application pool.
- "Total Messages Sent to WAS"
  - Total number of messages sent to WAS by the worker process

## W3SVC

- "Web Service\ [Current Connections](http://www.microsoft.com/technet/prodtechnol/WindowsServer2003/Library/IIS/af36e903-75c3-4a4c-ae47-8663f8543b0c.mspx?mfr=true)" – [общее число активных подключений на сервере IIS](https://winitpro.ru/index.php/2015/02/13/monitoring-kolichestva-polzovatelej-na-sajte-iis/).
	- Можно мерить в разрезе конкретного сайта IIS
	- Любые запросы к сайту, не только к Веб-сервисам.
	- [Просмотр списка соединений IIS8](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/jj635856(v=ws.11))

## Application Pool

Параллельность обработки запросов [concurrent](https://www.dotnetfunda.com/articles/show/3485/11-tips-to-improve-wcf-restful-services-performance)

- maxConcurrentRequestsPerCPU
- maxConcurrentThreadsPerCPU
- requestQueueLimit
- Maximum Worker [Processes in IIS application pool](https://www.dotnetfunda.com/articles/show/3485/11-tips-to-improve-wcf-restful-services-performance)
- два основных параметра, влияющих на [доступность приложения и его производительность](https://habr.com/ru/articles/250881/).
- appConcurrentRequestLimit — __максимальное количество одновременных запросов__ в приложении. Увеличение числа одновременных запросов IIS расширит доступные ресурсы веб-сервера для обслуживания запросов.
  	- Значение по умолчанию — 5000. UsersCount * 1.5, где usersCount — количество одновременно работающих пользователей
- QueueLength — максимальное количество запросов, которые драйвер Http.sys размещает в очереди пула приложений

## Worker process (w3wp.exe) W3SVC_W3WP

[W3SVC_W3WP](https://blogs.iis.net/mailant/new-worker-process-performance-counters-in-iis7) - exposes HTTP request processing related counters for the __worker process__
- "Total HTTP Requests Served"
  - Total number of HTTP requests served by the worker process.
Requests / Sec: HTTP requests/sec being processed by the worker process.
- "Active Requests"
  - Current number of requests being processed by the worker process.
- "Total Threads"
  - Total number of threads available to process requests in the worker process.
- "Active Threads Count"
  - Number of threads actively processing requests in the worker process.
- "Maximum Threads Count"
  - Maximum number of threads to which the thread pool can grow as needed.
- Saturation
	- [Maximum Threads Count](https://www.dotnetfunda.com/articles/show/3485/11-tips-to-improve-wcf-restful-services-performance)
	- Active Threads Count - Number of threads actively processing requests in the worker process
	- Threads Per Processor Limit in IIS
- Traffic
	- Requests / Sec - HTTP requests/sec being processed by the worker process
	- Active Requests - Current number of requests being processed by the worker process
- Latency
	- HTTP Service Request Queues (CurrentQueueSize): [The request count in the IIS queue](https://techcommunity.microsoft.com/t5/iis-support-blog/performance-counters-for-monitoring-iis/ba-p/683389)
- Errors
	- .NET CLR Exceptions

## ASP.NET: CLR Thread

- Latency
	- Queue
		- ASP.NET v4.0.30319\Requests Queued - limit Process Model’s [RequestQueueLimit](https://krishnansrinivasan.wordpress.com/2014/08/18/throttling-wcf-services-on-iis7/)
- TODO к CLR Thread относятся?
	- ASP.NET\Worker Process Running - Количество рабочих процессов, запущенных на серверном компьютере.
	- ASP.NET\Requests Failed - Общее количество неудачных запросов. Любые коды состояния, превышающие или равные 400, увеличат этот счетчик.
	- ASP.NET Applications\Errors Total - Общее количество ошибок, возникающих во время выполнения HTTP-запросов, включая любые ошибки синтаксического анализа, компиляции или времени выполнения.
	- ASP.NET Application\Errors Total/Sec - Количество ошибок в секунду, возникающих во время выполнения HTTP-запросов, включая любые ошибки синтаксического анализа, компиляции или времени выполнения.

## APP

[iis perf counters](https://msdn.microsoft.com/en-us/library!/ms972959.aspx?f=255&MSPPError=-2147217396)

- [Performance Counters for ASP.NET](https://msdn.microsoft.com/en-us/library/fxk122b4.aspx)
- Performance Counters for [WCF service](protocols.integration/wcf.md) дополнительно
- Traffic
	- ASP.NET\Requests Current - суммарное количество выполняющихся в настоящее время запросов. Значение этого счетчика включает в себя число обрабатывающися запросов, находящихся в очереди и ожидающих отправки клиенту. Если это значение превышает параметр requestQueueLimit, который расположен в секции processModelsection файла конфигурации веб-сервера, то последующие запросы будут отбрасываться
		- [View Currently Executing Requests in a Worker Process (IIS 7)](https://technet.microsoft.com/en-us/library/cc732518(v=ws.10).aspx)
		- [IIS->Worker process->View Current Request](https://habrahabr.ru/post/250881/)
	- ASP.NET Application\Requests Executing - показывает количество одновременно выполняющихся запросов
	- ASP.NET Application\Requests/sec RPS - текущую пропускную способность приложения
- Latency
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
