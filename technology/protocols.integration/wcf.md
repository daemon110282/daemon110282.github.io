# WCF

- [WCF](#wcf)
  - [Зачем](#зачем)
  - [Производительность](#производительность)
  - [Трассировка](#трассировка)

TODO

- [web garden?](https://iis-blogs.azurewebsites.net/chrisad/1342059) defaultapppool/maxprocesses 4

## Зачем

Windows Communication Foundation (WCF) — это платформа для создания приложений, ориентированных на службы.
Возможности:

- [Transaction](https://www.c-sharpcorner.com/uploadfile/shivprasadk/wcf-faq-part-5-transactions/)
- [config edit tool](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/configuration-editor-tool-svcconfigeditor-exe)

## Производительность

[ability](../../arch/ability/performance.md)

- [WCF on IIS7 process flow](https://krishnansrinivasan.wordpress.com/2014/08/18/throttling-wcf-services-on-iis7/)
- [параллелизм](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/feature-details/sessions-instancing-and-concurrency)
  - Под __сеансом__ понимается скоррелированный набор всех сообщений, переданных между двумя конечными точками.
  - Создание экземпляров означает управление временем жизни определенных пользователем
    - __объектов службы__
    - и связанных с ними __объектов InstanceContext__.
      - __параллелизм__ означает управление __количеством потоков__, одновременно выполняющихся в некотором контексте InstanceContext.
      - ограничивается
        - [MaxConcurrentSessions](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/wcf-troubleshooting-quickstart#my-service-starts-to-reject-new-clients-after-about-10-clients-are-interacting-with-it-what-is-happening) - максимальное __количество сеансов__, которые может принимать объект ServiceHost одновременно          
          - default=10 100 * Processor Count
          - Служба отклоняет подключения новых клиентов, пока не будет закрыт один из текущих сеансов.
        - MaxConcurrentCalls - максимальное __количество обрабатываемых сообщений__ в ServiceHost
          - default=16 х число процессоров               
        - [MaxConcurrentInstances](https://learn.microsoft.com/ru-ru/dotnet/api/system.servicemodel.description.servicethrottlingbehavior.maxconcurrentinstances?view=netframework-4.8.1) - максимальное количество __одновременно выполняющихся объектов InstanceContext__ в службе
          - default=int.MaxValue if not specified, otherwise 116 * Processor Count
          - [Sum of maxConcurrentCalls and maxConcurrentSession](https://codewala.net/2014/10/14/simple-steps-scale-up-wcf-drastically/)
- [ConcurrencyMode](https://learn.microsoft.com/ru-ru/dotnet/api/system.servicemodel.servicebehaviorattribute.concurrencymode?view=netframework-4.8.1&source=recommendations)
  - Single приводит к тому, что система не дает __экземплярам службы одновременно выполнять более одного потока__, что позволяет избежать решения вопросов многопоточности.
  - Multiple означает, что __объекты службы__ могут выполняться __несколькими потоками одновременно__. В этом случае необходимо обеспечить безопасность потоков.
- [InstanceContextMode](https://learn.microsoft.com/ru-ru/dotnet/api/system.servicemodel.servicebehaviorattribute.instancecontextmode?view=netframework-4.8.1) - когда создаются новые объекты службы
  - PerCall - не поддерживает __параллелизм__??
  - PerSession - default
  - [Single](https://www.tutorialspoint.com/wcf/wcf_quick_guide.htm)
- Сеансы [Session Mode](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/using-sessions?source=recommendations)
  - Required
  - Allowed
  - NotAllowed - [откажитесь от сессий?](https://wcfnet.wordpress.com/2012/01/20/wcf-design-best-practice/)
- [метрики производительности](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/diagnostics/performance-counters/)
  - [пример настройки](https://www.codeproject.com/Articles/431917/WCF-Service-Performance-Monitoring-using-Perfmon)
    - __нужно включить__ в конфигурации сервиса  
  - [варианты метрик](https://codecoma.wordpress.com/2013/08/08/wcf-performance-counters-for-servicemodelservice-4-0-0-0/) подробнее раздел Performance Metric
  - категории  
    - объект производительности ServiceModelService 4.0.0.0
    - объект производительности ServiceModelEndpoint 4.0.0.0
    - объект производительности ServiceModelOperation 4.0.0.0

## Performance Metric

- [варианты](https://codecoma.wordpress.com/2013/08/08/wcf-performance-counters-for-servicemodelservice-4-0-0-0/)
- Calls by Operation\Service\Endpoint
  Calls
  [Calls Duration](https://learn.microsoft.com/en-us/dotnet/framework/wcf/diagnostics/performance-counters/calls-duration) - единица измерения?
  Calls Failed
  Calls Failed Per Second
  Calls Faulted
  Calls Faulted Per Second
  Calls Outstanding
  Calls Per Second
- Instances by Service
  Instances Created Per Second
- Parallelism by Service
  [Percent Of Max Concurrent Calls](https://learn.microsoft.com/en-us/dotnet/framework/wcf/diagnostics/performance-counters/percent-of-max-concurrent-calls)
  Percent Of Max Concurrent Instances
  Percent Of Max Concurrent Sessions
- Queue by Service
  Queued Messages Dropped
  Queued Messages Dropped Per Second
  Queued Messages Rejected
  Queued Messages Rejected Per Second
  Queued Poison Messages
  Queued Poison Messages Per Second
- Reliable Messaging by Service\Endpoint
  Reliable Messaging Messages Dropped
  Reliable Messaging Messages Dropped Per Second
  Reliable Messaging Sessions Faulted
  Reliable Messaging Sessions Faulted Per Second
- Security
  Security Calls Not Authorized
  Security Calls Not Authorized Per Second
  Security Validation and Authentication Failures
  Security Validation and Authentication Failures Per Second
- Transaction
  Transacted Operations Aborted
  Transacted Operations Aborted Per Second
  Transacted Operations Committed
  Transacted Operations Committed Per Second
  Transacted Operations In Doubt
  Transacted Operations In Doubt Per Second
  Transactions Flowed
  Transactions Flowed Per Second

## Трассировка

- [Настройка сбора данных](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/diagnostics/tracing/configuring-tracing)
- Просмотр [трассировки](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/service-trace-viewer-tool-svctraceviewer-exe)
- [Виды](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/diagnostics/tracing/significant-traces)
  - Трассировка журнала сообщений
    - Существует четыре настраиваемые точки ведения журнала для сообщения: ServiceLevelSendRequest, TransportSend, TransportReceive, ServiceLevelReceiveRequest.
      - Service Level : At this level the message is logged when it is about to leave or enter the code. Secure messages are logged decrypted at this level.
      - Transport Level : At this level messages are logged just before getting encoded or after getting decoded for transmission over wire. Even reliable messaging messages are logged.
      - Malformed Level : All the messages which WCF fails to process due to improper format gets logged.