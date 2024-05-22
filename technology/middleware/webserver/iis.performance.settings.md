# Метрики Производительность Быстродействие

- [Метрики Производительность Быстродействие](#метрики-производительность-быстродействие)
  - [HTTP.SYS](#httpsys)
  - [Web Admin Service (WAS\_W3WP)](#web-admin-service-was_w3wp)
  - [W3SVC](#w3svc)
  - [Application Pool](#application-pool)
  - [Worker process (w3wp.exe) (W3SVC\_W3WP)](#worker-process-w3wpexe-w3svc_w3wp)
  - [ASP.NET: CLR Thread](#aspnet-clr-thread)
  - [APP](#app)

TODO

## HTTP.SYS

- [ ] [idleconnectiontimeout](https://learn.microsoft.com/ru-ru/troubleshoot/developer/webapps/aspnet/site-behavior-performance/error-logging-http-apis)
- [ ] [HeaderWaittimeout](https://learn.microsoft.com/ru-ru/windows/win32/http/scenario-1--http-timeout-example-using-etw-tracing-and-netsh-commands)
- [ ] [ConnectionTimeout](https://topic.alibabacloud.com/a/the-iis-server-error-log-timer_connectionidle-causes-the-server-to-be-inaccessible_1_16_32502215.html)
- [ ] [MinFileBytesPerSec](https://topic.alibabacloud.com/a/the-iis-server-error-log-timer_connectionidle-causes-the-server-to-be-inaccessible_1_16_32502215.html)

## Web Admin Service (WAS_W3WP)

TODO

## W3SVC

TODO

## Application Pool (W3SVC_W3WP?)

Параллельность обработки запросов [concurrent](https://www.dotnetfunda.com/articles/show/3485/11-tips-to-improve-wcf-restful-services-performance)

- maxConcurrentRequestsPerCPU
- maxConcurrentThreadsPerCPU
- requestQueueLimit
- __Maximum Worker Processes__ in [IIS application pool](https://www.dotnetfunda.com/articles/show/3485/11-tips-to-improve-wcf-restful-services-performance)
  - MaxConcurrentSessions - 100 * Processor Count
  - MaxConcurrentCalls - 16 * Processor Count
  - MaxConcurrentInstances - int.MaxValue if not specified, otherwise 116 * Processor Count
- два основных параметра, влияющих на [доступность приложения и его производительность](https://habr.com/ru/articles/250881/)
  - appConcurrentRequestLimit — __максимальное количество одновременных запросов__ в приложении
    - Увеличение числа одновременных запросов IIS расширит доступные ресурсы веб-сервера для обслуживания запросов.
    - Значение по умолчанию — 5000. UsersCount * 1.5, где usersCount — количество одновременно работающих пользователей
  - QueueLength — максимальное количество запросов, которые драйвер Http.sys размещает в очереди пула приложений
- Threads
  - [processModel settings change in machine.config file](https://www.dotnetfunda.com/articles/show/3485/11-tips-to-improve-wcf-restful-services-performance)
    - C:\Windows\Microsoft.NET\Framework64\<version>\Config\Machine.config
  - maxWorkerThreads - __maximum__ number of worker __threads available__ in the thread pool (default is 20 per CPU, recommended is 100)
  - minWorkerThreads - Минимальное число рабочих потоков в пуле - minimum number of worker threads available in the thread pool (default 1 per CPU, recommended is half of maxWorkerThreads value)
  - maxIOThreads - maximum number of threads that can be allotted to perform input/output (I/O) operations (default is 20 per CPU, recommended 100).
  - minIOThreads - Минимальное число асинхронных I\O потоков в пуле - minimum number of threads that can be allotted to to perform input/output (I/O) operations (default 1 per CPU, recommended is half of maxIOThreads value)
- [Limits](https://learn.microsoft.com/en-us/iis/configuration/system.applicationhost/sites/site/limits)
  - [ ] connectionTimeout
    - равно ли [aspnet httpruntime executionTimeout](https://rajeevdotnet.blogspot.com/2019/09/aspnet-httpruntime.html) ?
    - [httpruntime executionTimeout](https://stackoverflow.com/questions/2414441/how-to-increase-request-timeout-in-iis)    
  - [ ] maxConnections
  - [ ] maxBandwidth

## Worker process (w3wp.exe) (W3SVC_W3WP?)

- [ ] MaxPoolThreads

TODO

## ASP.NET: CLR Thread

- [ ] [RequestQueueLimit](https://krishnansrinivasan.wordpress.com/2014/08/18/throttling-wcf-services-on-iis7/)
TODO

## APP

TODO
