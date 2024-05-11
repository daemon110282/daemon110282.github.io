# Диагностика Troubleshooting

- [Диагностика Troubleshooting](#диагностика-troubleshooting)
  - [Tools](#tools)
    - [Process Monitor](#process-monitor)
    - [Dump](#dump)
    - [Трассировка](#трассировка)
  - [Use case](#use-case)
    - [Application deadlocks](#application-deadlocks)
    - [High CPU](#high-cpu)
    - [High Latency Timeout](#high-latency-timeout)
    - [Thread pool starvation](#thread-pool-starvation)
    - [High GС .NET LOH](#high-gс-net-loh)
    - [Session lock Concurrent Requests](#session-lock-concurrent-requests)

## Tools

### Process Monitor

- [procmon](https://learn.microsoft.com/en-us/sysinternals/downloads/procmon)
- [process-explorer](https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer)

### Dump

- [Windows Debugging Tools](../../todo) installed on the server (takes longer)
- [ProcDump](../../todo) (faster)

### Трассировка

- [Fiddler on iis app](http://www.markhneedham.com/blog/2009/06/24/using-fiddler-with-iis/)
- IIS Failed Request Tracing [FREB](https://blogs.msdn.microsoft.com/docast/2016/04/28/troubleshooting-iis-request-performance-slowness-issues-using-freb-tracing/)
	- For slow __ASP.NET Webforms applications__
	- for troubleshooting slow ASP.NET MVC web sites using __[PerfView](../../troubleshooting/perfview.md)__
- [CPU, ERROR, RAM leak](https://www.iis.net/learn/troubleshoot/performance-issues)
- [WCF](../../protocols.integration/wcf.troubleshooting.md#трассировка)

## Use case

### Application deadlocks

- Признаки
  - All requests in the application are blocked in the code, due to taking a lock
- Проверки
  - This can only be identified by attaching a debugger at the moment of the hang

### High CPU

- Признаки
  - [x] CPU remain at a high level __80% or greater__ for __prolonged periods__
  - CPU overload is usually caused by __CPU-intensive application code__
    - LINQ query compilation
    - JSON serialization
    - regular expressions
    - logging, dependency injection, reflection, etc
  - high __concurrency overwhelming the processor’s ability__ to process tasks concurrently. This is becoming even more and more common with parallel tasks and async code.

- Проверки
  - If you need to __identify which application pool__ is associated with a particular __w3wp.exe process__
    - run "%windir%\System32\inetsrv\appcmd list wp"
    - This will show the process identifier (PID) of the w3wp.exe process in quotes. You can match that PID with the PID available in Task Manager.
  - To determine what is causing the problem:
    - A [Performance Monitor](../../troubleshooting/perfmon.md) data collector set
    - A user-mode memory dump of the w3wp.exe process
      - collect user-mode [process dumps](https://learn.microsoft.com/en-us/troubleshoot/developer/webapps/iis/health-diagnostic-performance/troubleshoot-high-cpu-in-iis-app-pool) when a high CPU condition occurs is to use Debug Diagnostics.

### High Latency Timeout

- Признаки
  - [x] __"Http Service Request Queues\MaxQueueItemAge"__ performance counter increasing
  - [x] [__"Http Service Request Queues\ArrivalRate"__](iis.performance.metric.md#httpsys) counter exceeds the __"W3WP_W3SVC\Requests / sec"__ counter for the application pool's worker process over a period of time
  - __Slow application code__
    - The requests may be blocked by __slow data retrieval__, e.g. slow SQL queries, or slow responses from Redis/cloud-based databases/remote web services
- Проверки
  - [x] [__"Http Service Request Queues\CurrentQueueSize"__](iis.performance.metric.md#httpsys) counter
    - [ ] If its __0__, IIS is having no problems dequeueing requests.
  - [x] [__"W3WP_W3SVC\Active Threads"__](iis.performance.metric.md#worker-process-w3wpexe-w3svc_w3wp) counter
    - [ ] This will almost __always be 0, or 1__ because IIS threads almost never block.
      - If its significantly higher, you likely have IIS thread blockage due to a custom module or because you explicitly configured ASP .NET to run on IIS threads
    - Consider increasing your [__MaxPoolThreads__](iis.performance.settings.md#worker-process-w3wpexe-w3svc_w3wp) registry key.

### Thread pool starvation

- Признаки
  - All threads in the application are blocked, and the thread pool is __not able__ to provide sufficient __threads to process new requests__, causing them to become __queued__
  - the threadpool cannot provide enough threads to enable completions of async tasks, resulting in all requests becoming blocked waiting for threads
  - is blocking __calls that could be asynchronous__
    - Many synchronous blocking calls lead to Thread Pool starvation and __degraded response times__
- Проверки
  - profiler, such as [PerfView](../../troubleshooting/perfview.md), can be used to find threads frequently added to the Thread Pool. The "Microsoft-Windows-DotNETRuntime/ThreadPoolWorkerThread/Start" event indicates a thread added to the thread pool.
- Решение
  - IIS by default will only allow 1 thread per processor core to actively dequeue requests (that MaxConcurrency setting)
    - In a CPU-bound workload, having more threads does not result in a higher RPS, but lower RPS instead because more of the processor bandwidth is spent context switching.
    - More threads only benefit if threads are becoming blocked by waits or blocking IO, which does not typically happen for IIS threads.

### High GС .NET LOH

- Minimize __large object allocations__
  - The .NET Core garbage collector manages allocation and release of memory automatically in ASP.NET Core apps. Automatic garbage collection generally means that developers don't need to worry about how or when memory is freed.
  - However, cleaning up unreferenced objects __takes CPU time__, so developers should __minimize allocating objects in hot code paths__
  - Garbage collection is especially expensive on large objects (__>= 85,000 bytes__)
    - Large objects are stored on the __large object heap (LOH)__ and require a __full (generation 2) garbage collection__ to clean up
    - Unlike generation 0 and generation 1 collections, a generation 2 collection requires a temporary suspension of app execution. __Frequent allocation and de-allocation__ of large objects can cause __inconsistent performance__.
    - The allocation cost is high because the memory for a newly allocated large object has to be cleared. The CLR guarantees that memory for all newly allocated objects is cleared.
- Признаки
  - application spends a large percentage of it’s processing time trying to clean up .NET objects  
- Проверки
  - If your GC time is __over 50% and higher__, it’s going to cause poor performance.
  - Memory issues, such as the preceding, can be diagnosed by reviewing garbage collection (GC) stats in PerfView and examining:
    - Garbage collection __pause time__
    - What percentage of the __processor time__ is spent in garbage collection
    - How many garbage collections are __generation 0, 1, and 2__

### Session lock Concurrent Requests

- Признаки
  - Access to ASP.NET session state is __exclusive per session__, which means that if two different users make __concurrent requests__, access to each separate session is granted concurrently.
  - However, if two concurrent requests are made for the same session (by using the same SessionID value), the first request gets exclusive access to the session information.
  - The second request __executes only after the first request is finished__
- Проверки
- Решение
  - If the EnableSessionState value in the @ Page directive is set to __ReadOnly__, a request for the read-only session information does not result in an exclusive lock on the session data. However, read-only requests for session data might still have to wait for a lock set by a read-write request for session data to clear.
