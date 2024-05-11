# WCF

- [WCF](#wcf)
  - [Зачем](#зачем)
  - [Производительность](#производительность)
  - [Мониторинг](#мониторинг)
  - [Диагностика Troubleshooting](#диагностика-troubleshooting)

TODO

- [web garden?](https://iis-blogs.azurewebsites.net/chrisad/1342059) defaultapppool/maxprocesses 4

## Зачем

Windows Communication Foundation (WCF) — это платформа для создания приложений, ориентированных на службы.

Возможности:

- [Transaction](https://www.c-sharpcorner.com/uploadfile/shivprasadk/wcf-faq-part-5-transactions/)
- [Config edit tool](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/configuration-editor-tool-svcconfigeditor-exe)
- Several __types of hosting__ are available
  - [Self Hosting in console application](https://www.c-sharpcorner.com/article/create-simple-wcf-service-and-host-it-on-console-application/)
  - Windows Form application hosting
  - Windows Service hosting
  - WAS hosting
  - [IIS hosting](https://www.c-sharpcorner.com/article/hosting-wcf-service-on-iis/)

## Производительность

[ability](../../arch/ability/performance.md)

- [WCF on IIS7 process flow](https://krishnansrinivasan.wordpress.com/2014/08/18/throttling-wcf-services-on-iis7/)
- [параллелизм](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/feature-details/sessions-instancing-and-concurrency)
  - Под __сеансом__ понимается скоррелированный набор всех сообщений, переданных между двумя конечными точками.
  - Создание __экземпляров сервиса__ означает управление временем жизни определенных пользователем
    - __объектов сервиса
    - и связанных с ними __объектов InstanceContext__.
      - __параллелизм__ означает управление __количеством потоков__, одновременно выполняющихся в некотором контексте InstanceContext.
      - ограничивается
        - [MaxConcurrentSessions](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/wcf-troubleshooting-quickstart#my-service-starts-to-reject-new-clients-after-about-10-clients-are-interacting-with-it-what-is-happening) - максимальное __количество сеансов__, которые может принимать объект сервиса ServiceHost одновременно
          - default=10 100*Processor Count
          - Сервис отклоняет подключения новых клиентов, пока не будет закрыт один из текущих сеансов.
        - MaxConcurrentCalls - максимальное __количество обрабатываемых запросов__ в одном экземляре сервиса ServiceHost
          - default=16*число процессоров
        - [MaxConcurrentInstances](https://learn.microsoft.com/ru-ru/dotnet/api/system.servicemodel.description.servicethrottlingbehavior.maxconcurrentinstances?view=netframework-4.8.1) - максимальное количество __одновременно выполняющихся объектов InstanceContext__ в службе
          - default=int.MaxValue if not specified, otherwise 116*Processor Count
          - [Sum of maxConcurrentCalls and maxConcurrentSession](https://codewala.net/2014/10/14/simple-steps-scale-up-wcf-drastically/)
- [ConcurrencyMode](https://learn.microsoft.com/ru-ru/dotnet/api/system.servicemodel.servicebehaviorattribute.concurrencymode?view=netframework-4.8.1&source=recommendations)
  - Single приводит к тому, что система не дает __экземплярам службы одновременно выполнять более одного потока__, что позволяет избежать решения вопросов многопоточности.
  - Multiple означает, что __объекты службы__ могут выполняться __несколькими потоками одновременно__. В этом случае необходимо обеспечить безопасность потоков.
- [InstanceContextMode](https://learn.microsoft.com/ru-ru/dotnet/api/system.servicemodel.servicebehaviorattribute.instancecontextmode?view=netframework-4.8.1) - когда создаются новые объекты службы
  - PerCall - на запрос - параллелизм не имеет значения, так как каждое сообщение обрабатывается новым InstanceContext и, следовательно, никогда не активируется более одного потока в InstanceContext.
  - PerSession - на сеанс - default
  - [Single](https://www.tutorialspoint.com/wcf/wcf_quick_guide.htm) - все запросы клиентов за время существования приложения обрабатываются одним контекстом InstanceContext
- Сеансы [Session Mode](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/using-sessions?source=recommendations)
  - Required
  - Allowed
  - NotAllowed - [откажитесь от сессий для масштабирования - Stateless](https://wcfnet.wordpress.com/2012/01/20/wcf-design-best-practice/)
- [метрики производительности](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/diagnostics/performance-counters/)
  - [пример настройки](https://www.codeproject.com/Articles/431917/WCF-Service-Performance-Monitoring-using-Perfmon)
    - __нужно включить__ в конфигурации сервиса  
  - [варианты метрик](https://codecoma.wordpress.com/2013/08/08/wcf-performance-counters-for-servicemodelservice-4-0-0-0/) подробнее раздел Performance Metric
  - категории  
    - объект производительности ServiceModelService 4.0.0.0
    - объект производительности ServiceModelEndpoint 4.0.0.0
    - объект производительности ServiceModelOperation 4.0.0.0

## Мониторинг

- [Метрики](wcf.performance.metric.md)

## Диагностика Troubleshooting

- [Dump](wcf.troubleshooting.md#dump)
- [Трассировка](wcf.troubleshooting.md#трассировка)
