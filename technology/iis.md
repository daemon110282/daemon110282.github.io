# IIS

Метрики:

- ASP.NET\Requests Queued, число запросов ожидающих в очереди на обработку - "ASP.NET v4.0.30319Requests Queued" performance counter, WMI.WorkerProcess.GetExecutingRequests
- ASP.NET\Requests Current, суммарное количество выполняющихся в настоящее время запросов. Значение этого счетчика включает в себя число обрабатывающися запросов, находящихся в очереди и ожидающих отправки клиенту. Если это значение превышает параметр requestQueueLimit, который расположен в секции processModelsection файла конфигурации веб-сервера, то последующие запросы будут отбрасываться
- ASP.NET Application\Requests Executing, показывает количество одновременно выполняющихся запросов
- ASP.NET Application\Requests/sec, текущую пропускную способность приложения
- ASP.NET Application\Request Execution Time, время выполнения (в мс) посденего запроса
- ASP.NET Application\Wait Time, время ожидания в очереди последнего запроса
- IIS Failed Request Tracing
- Проверьте логи на наличие ошибки “HTTP Error 503.2 — Service Unavailable”. Постарайтесь определить, не блокируется ли часть запросов в очереди
- [IIS->Worker process->View Current Request](https://habrahabr.ru/post/250881/)

## Links

- https://technet.microsoft.com/en-us/library/cc732518(v=ws.10).aspx
- https://habrahabr.ru/post/250881/	good
- https://mlichtenberg.wordpress.com/2011/02/03/log-parser-rocks-more-than-50-examples/
- https://www.symantec.com/connect/articles/forensic-log-parsing-microsofts-logparser	
- https://blogs.msdn.microsoft.com/docast/2016/04/28/troubleshooting-iis-request-performance-slowness-issues-using-freb-tracing/
- https://www.iis.net/learn/troubleshoot/performance-issues
