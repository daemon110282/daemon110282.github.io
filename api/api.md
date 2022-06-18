# API

## Проектирование

* [Дизайн API от потребностей продукта](http://agilemindset.ru/%d0%b0%d1%80%d1%85%d0%b8%d1%82%d0%b5%d0%ba%d1%82%d1%83%d1%80%d0%b0/)
* [REST API](api.rest.md)
* GRPC
* GraphQL
* SOAP
  * ESB

Шаблон описания 
https://tyk.io/blog/whats-minimum-documentation-required-api/

## Patterns

* API gateway
  * [MSA API Gateway](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/architect-microservice-container-applications/direct-client-to-microservice-communication-versus-the-api-gateway-pattern)
  * [API Gateway](https://microservices.io/patterns/apigateway.HTML)
  * when
    * How can client apps minimize the number of requests to the back end and reduce chatty 
communication to multiple microservices?
    * How can you handle cross-cutting concerns such as authorization, data transformations, and dynamic request dispatching?
    *  How can client apps communicate with services that use non-Internet-friendly protocols(amqp)? 
    * How can you shape a facade especially made for mobile apps?
  * what
    * Reverse proxy or gateway routing. https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-routing
    * aggregation https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-aggregation
    * Cross-cutting concerns or gateway offloading.
      * Authentication and authorization 
      • Service discovery integration 
• Response caching 
• Retry policies, circuit breaker, and QoS 
• Rate limiting and throttling 
• Load balancing 
• Logging, tracing, correlation 
• Headers, query strings, and claims transformation 
• IP whitelisting
      * https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-offloading

## versioning

Then you can decide between implementing both versions of the service 
simultaneously within the same service instance, or deploying different instances that each handle a 
version of the API. A good approach for this is the **Mediator pattern** (for example, **MediatR** library) to 
decouple the different implementation versions into independent handlers

## Security

* [apisecurity.io](https://apisecurity.io/)
  * [REST Best Practice](https://stackoverflow.blog/2021/10/06/best-practices-for-authentication-and-authorization-for-rest-apis/?utm_campaign=APISecurity%20newsletter&utm_medium=email&_hsmi=204867978&_hsenc=p2ANqtz-94r6UDHzZG48tgtd0Sz6OiZicy6tTBQysQKtk0WzhZXlXrXBucIld80QE3Gll1Le1lxnwNhNqu-pySFps1AsqeR8MQrg&utm_content=204868574&utm_source=hs_email)

## Стратегия повторов при сбоях Rerty Policy

* от типа\кода ошибки: временная, постоянная
* число повторных попыток и интервал между ними ограничен общим максимальным временем для операции\процесса
  * типы интервалов:
    * Экспоненциальная задержка
    * Интервалы с приращениями
    * Постоянные интервалы
    * Немедленный повтор
    * Случайный выбор
* Регистрируйте и отслеживайте временные и не временные ошибки для мониторинга: 
  * увеличения числа и частоты возникновения сбоев
  * среднего числа повторных попыток 
  * общего времени, затрачиваемого на успешное выполнение операций
* Шаблон автоматического выключения (прерывателя) circuit breaker для иск-я постоянных повторов

## Документирование

* [AsyncApi](asyncapi.md)
* OpenApi


## technology

- api gateway
  - ocelot

## Links

* Rerty Policy
  * https://docs.microsoft.com/ru-ru/azure/architecture/best-practices/transient-faults
  * https://docs.microsoft.com/ru-ru/azure/architecture/patterns/circuit-breaker
