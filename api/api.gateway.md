
# API Gateway

- [API Gateway](#api-gateway)
  - [Зачем](#зачем)
  - [Плюсы-минусы](#плюсы-минусы)
  - [Паттерны](#паттерны)
  - [Технологии](#технологии)

## Зачем

- Снижение связности ИС
- Too many __round trips__. [Паттерн Aggregation запросов](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-aggregation)
  - minimize the [number of requests to the back end](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/architect-microservice-container-applications/direct-client-to-microservice-communication-versus-the-api-gateway-pattern) and reduce chatty
communication to multiple microservices
- [Сквозная функциональность](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-offloading) __cross-cutting concerns__ or gateway offloading  
  - [Authentication](https://konghq.com/learning-center/api-gateway/api-gateway-authentication) and authorization
    - [OAuth](../arch/../technology/protocols.integration/oauth.md) access token
  - Service discovery integration
  - Response caching
  - [Retry policies, circuit breaker, and QoS](../arch/pattern/pattern.failure.md)
  - [Rate limiting](../arch/pattern/rate.limit.md) and throttling
  - [Load balancing](../arch/pattern/load.balancing.md)
  - [Logging, tracing, correlation](../arch/ability/observability.md)
  - Headers, query strings, and claims transformation
  - Dynamic request dispatching, routing. __[Reverse proxy](../arch/pattern/pattern.proxy.reverse.md)__ [or gateway routing](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-routing)
  - IP whitelisting
  - TLS Termination
- Mock
- __Security issues__ Сокрытие внутренних API ИС от внешних ИС потребителей
  - Without a gateway, all the microservices must be exposed to the “external world"
- __“backend for frontend”__ (BFF) разные типы клиентов (интернет веб приложение, мобильное приложение, интранет веб приложение и тп) могут иметь разные требования по интеграции для
  - сокращения трафика
  - снижения числа запросов, т.к. влияет на заряд мобильного приложения
  - __facade__ especially [made for mobile apps](https://microservices.io/patterns/apigateway)

Расширяет функции API Gateway ИС класса [API managment](api-managment.md) (APIM)

- Monetize
- Трансформация запросов REST2RMQ, REST2gRPC и тп.
  - client apps communicate with services that use __non-Internet-friendly protocols(amqp)__

Тодо
- https://link.medium.com/Cu6FA4CrHub

## Плюсы-минусы

Плюсы

- Фасад до внутренних ИС
- Абстракция

Минусы

- Единая точка отказа
- Latency увеличивается
- Сопровождение усложняется 
- стоимость ТСО увеличивается
- Усложнение интеграции

## Паттерны

![gw](/img/pattern/integration/api.gw.jpg)
![gw multi](/img/pattern/integration/api.gw.multi.jpg)

## Технологии

[Compare](https://www.techtarget.com/searchapparchitecture/feature/A-feature-rundown-of-6-popular-API-gateway-tools)

- Open Source
  - [Ocelot](https://medium.com/aspnetrun/building-ocelot-api-gateway-microservices-with-asp-net-core-and-docker-container-13f96026e86c)
  - [Gravitie](../technology/middleware/api.gateway/gw.gravitee.md)
  - [Kong](../technology/middleware/api.gateway/gw.kong.md)
  - Tyk
- Commercial
  - [traefik](https://traefik.io/solutions/api-gateway/)
  - [Citrix ADC (Netscaler)](../technology/middleware/proxy/proxy.netscaler.md)
  - [Nginx](../technology/middleware/proxy/proxy.nginx.md)
