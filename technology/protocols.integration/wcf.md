# WCF

Windows Communication Foundation (WCF) — это платформа для создания приложений, ориентированных на службы.

- [Transaction](https://www.c-sharpcorner.com/uploadfile/shivprasadk/wcf-faq-part-5-transactions/)

## Производительность

- [параллелизм](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/feature-details/sessions-instancing-and-concurrency)
  - Под __сеансом__ понимается скоррелированный набор всех сообщений, переданных между двумя конечными точками.
  - Создание экземпляров означает управление временем жизни определенных пользователем
    - __объектов службы__
    - и связанных с ними __объектов InstanceContext__.
      - __параллелизм__ означает управление __количеством потоков__, одновременно выполняющихся в некотором контексте InstanceContext .
      - ограничивается
        - [MaxConcurrentSessions](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/wcf-troubleshooting-quickstart#my-service-starts-to-reject-new-clients-after-about-10-clients-are-interacting-with-it-what-is-happening) - максимальное __количество сеансов__, которые может принимать объект ServiceHost одновременно, default=10. Служба отклоняет подключения новых клиентов, пока не будет закрыт один из текущих сеансов.
        - MaxConcurrentCalls - максимальное __количество обрабатываемых сообщений__ в ServiceHost, default=16 х число процессоров.
        - [MaxConcurrentInstances](https://learn.microsoft.com/ru-ru/dotnet/api/system.servicemodel.description.servicethrottlingbehavior.maxconcurrentinstances?view=netframework-4.8.1) - максимальное количество __одновременно выполняющихся объектов InstanceContext__ в службе
- [ConcurrencyMode](https://learn.microsoft.com/ru-ru/dotnet/api/system.servicemodel.servicebehaviorattribute.concurrencymode?view=netframework-4.8.1&source=recommendations)
  - Single приводит к тому, что система не дает __экземплярам службы одновременно выполнять более одного потока__, что позволяет избежать решения вопросов многопоточности.
  - Multiple означает, что __объекты службы__ могут выполняться __несколькими потоками одновременно__. В этом случае необходимо обеспечить безопасность потоков.
- [InstanceContextMode](https://learn.microsoft.com/ru-ru/dotnet/api/system.servicemodel.servicebehaviorattribute.instancecontextmode?view=netframework-4.8.1) - когда создаются новые объекты службы
  - PerCall - не поддерживает __параллелизм__
  - PerSession - default
  - [Single](https://www.tutorialspoint.com/wcf/wcf_quick_guide.htm)
- [Session Mode](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/using-sessions?source=recommendations)
  - Required
  - Allowed
  - NotAllowed
- [метрики производительности](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/diagnostics/performance-counters/)
  - [пример настройки](https://www.codeproject.com/Articles/431917/WCF-Service-Performance-Monitoring-using-Perfmon)
    - __нужно включить__ в конфигурации сервиса
  - [варианты](https://codecoma.wordpress.com/2013/08/08/wcf-performance-counters-for-servicemodelservice-4-0-0-0/)
  - категории  
    - объект производительности ServiceModelService 4.0.0.0
    - объект производительности ServiceModelEndpoint 4.0.0.0
    - объект производительности ServiceModelOperation 4.0.0.0

## Трассировка

[Виды](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/diagnostics/tracing/significant-traces)

- Трассировка журнала сообщений
  - Существует четыре настраиваемые точки ведения журнала для сообщения: ServiceLevelSendRequest, TransportSend, TransportReceive, ServiceLevelReceiveRequest.
