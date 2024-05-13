# WCF

- [WCF](#wcf)
  - [Зачем](#зачем)
  - [Производительность](#производительность)
  - [Мониторинг](#мониторинг)
  - [Диагностика Troubleshooting](#диагностика-troubleshooting)
  - [Настройки](#настройки)

TODO

- [web garden?](https://iis-blogs.azurewebsites.net/chrisad/1342059) defaultapppool/maxprocesses 4

## Зачем

Windows Communication Foundation (WCF) — это платформа для создания приложений, ориентированных на службы.

Возможности:

- [Transaction](https://www.c-sharpcorner.com/uploadfile/shivprasadk/wcf-faq-part-5-transactions/)
- [Config edit tool](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/configuration-editor-tool-svcconfigeditor-exe)
  - [Пример настройки](https://www.c-sharpcorner.com/UploadFile/db2972/wcf-service-configuration-using-configuration-editor-day-12/)
- Several __types of hosting__ are available
  - [Self Hosting in console application](https://www.c-sharpcorner.com/article/create-simple-wcf-service-and-host-it-on-console-application/)
  - Windows Form application hosting
  - Windows Service hosting
  - WAS hosting
  - [IIS hosting](https://www.c-sharpcorner.com/article/hosting-wcf-service-on-iis/)
- [WCF on IIS7 process flow](https://krishnansrinivasan.wordpress.com/2014/08/18/throttling-wcf-services-on-iis7/)

## Производительность

[ability](../../arch/ability/performance.md)

- [параллелизм](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/feature-details/sessions-instancing-and-concurrency)
  - Под __сеансом__ понимается скоррелированный набор всех сообщений, переданных между двумя конечными точками.
  - Создание __экземпляров сервиса__ означает управление временем жизни определенных пользователем
    - __объектов сервиса
    - и связанных с ними __объектов InstanceContext__
      - __параллелизм__ означает управление __количеством потоков__, одновременно выполняющихся в некотором контексте InstanceContext.
      - ограничивается (Throttling) __MaxConcurrentSessions, MaxConcurrentCalls, MaxConcurrentInstances__

## Мониторинг

- [Метрики](wcf.performance.metric.md)

## Диагностика Troubleshooting

- [Dump](wcf.troubleshooting.md#dump)
- [Трассировка](wcf.troubleshooting.md#трассировка)

## Настройки

- [WCF configuration default limits, concurrency and scalability](https://weblogs.asp.net/paolopia/wcf-configuration-default-limits-concurrency-and-scalability)

Производительность:

- [InstanceContextMode](https://learn.microsoft.com/ru-ru/dotnet/api/system.servicemodel.servicebehaviorattribute.instancecontextmode?view=netframework-4.8.1) - когда создаются новые объекты службы
  - Определяет, общается ли во время сеанса клиентский прокси-сервер:
    - с одним и тем же экземпляром объекта сервера (режим PerSession) - default
    - или каждый раз, когда использует-ся объект сервера, создается его новый экземпляр, а затем удаляется, как только вызов метода заканчивается (режим PerCall)
      - параллелизм не имеет значения, так как каждое сообщение обрабатывается новым InstanceContext и, следовательно, никогда не активируется более одного потока в InstanceContext
    - или создается только один экземпляр сервера, независимо от количества клиентов ([режим Single](https://www.tutorialspoint.com/wcf/wcf_quick_guide.htm) )
      - все запросы клиентов за время существования приложения обрабатываются одним контекстом InstanceContext  
- [ConcurrencyMode](https://learn.microsoft.com/ru-ru/dotnet/api/system.servicemodel.servicebehaviorattribute.concurrencymode?view=netframework-4.8.1&source=recommendations)
  - Имеет значение для InstanceContextMode.Single
  - Single приводит к тому, что система не дает __экземплярам службы одновременно выполнять более одного потока__, что позволяет избежать решения вопросов многопоточности.
  - Multiple означает, что __объекты службы__ могут выполняться __несколькими потоками одновременно__. В этом случае необходимо обеспечить безопасность потоков.
- Сеансы [Session Mode](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/using-sessions?source=recommendations)
  - Required
  - Allowed
  - NotAllowed - [откажитесь от сессий для масштабирования - Stateless](https://wcfnet.wordpress.com/2012/01/20/wcf-design-best-practice/)

Throttling:

- __[MaxConcurrentSessions](https://learn.microsoft.com/ru-ru/dotnet/framework/wcf/wcf-troubleshooting-quickstart#my-service-starts-to-reject-new-clients-after-about-10-clients-are-interacting-with-it-what-is-happening)__ - максимальное __количество сеансов__, которые может принимать объект сервиса ServiceHost одновременно
  - default=10 100*Processor Count
  - Сервис отклоняет подключения новых клиентов, пока не будет закрыт один из текущих сеансов.
- __MaxConcurrentCalls__ - максимальное __количество обрабатываемых запросов__ в одном экземляре сервиса ServiceHost
  - default=16*число процессоров
- __[MaxConcurrentInstances](https://learn.microsoft.com/ru-ru/dotnet/api/system.servicemodel.description.servicethrottlingbehavior.maxconcurrentinstances?view=netframework-4.8.1)__ - максимальное количество __одновременно выполняющихся объектов InstanceContext__ в службе
  - default=int.MaxValue if not specified, otherwise 116*Processor Count
  - [Sum of maxConcurrentCalls and maxConcurrentSession](https://codewala.net/2014/10/14/simple-steps-scale-up-wcf-drastically/)