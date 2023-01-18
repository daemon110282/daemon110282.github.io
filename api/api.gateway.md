# API Gateway

- [API Gateway](#api-gateway)
  - [Зачем?](#зачем)
  - [Плюсы-минусы](#плюсы-минусы)
  - [Паттерны](#паттерны)
  - [Технологии](#технологии)

## Зачем?

- Снижение связности
- Too many __round trips__. [Паттерн Aggregation](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-aggregation)
  - How can client apps minimize the [number of requests to the back end](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/architect-microservice-container-applications/direct-client-to-microservice-communication-versus-the-api-gateway-pattern) and reduce chatty
communication to multiple microservices?
- [Сквозная функциональность](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-offloading) or gateway offloading
  - How can you handle __cross-cutting concerns__
    - Authentication and authorization 
      - [OIDC](../arch/../technology/protocols.integration/oidc.md) access token, refresh token
    - Service discovery integration
    - Response caching
    - [Retry policies, circuit breaker, and QoS](../arch/pattern/pattern.failure.md)
    - [Rate limiting](../arch/pattern/pattern.failure.md) and throttling
    - [Load balancing](../arch/ability/load.balancing.md)
    - [Logging, tracing, correlation](../arch/ability/observability.md)
    - Headers, query strings, and claims transformation
    - Dynamic request dispatching, routing. __[Reverse proxy](../arch/pattern/pattern.proxy.reverse.md)__ [or gateway routing](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-routing)
    - IP whitelisting
    - TLS Termination
- Mock
- Monetize
- [API managment](api-managment.md)
https://habr.com/ru/company/X5Tech/blog/543324/
- How can client apps communicate with services that use __non-Internet-friendly protocols(amqp)?__
- __Security issues__: Without a gateway, all the microservices must be exposed to the “external world"
- The API Gateway pattern is also sometimes known as the __“backend for frontend”__ (BFF) because you build it while thinking about the needs of the client app.
  - How can you shape a __facade__ especially [made for mobile apps](https://microservices.io/patterns/apigateway)?
  
Тодо
https://link.medium.com/Cu6FA4CrHub

## Плюсы-минусы

Минусы

- Единая точка отказа
- Latency
- Сопровождение
- Усложнение интеграции

## Паттерны

![gw](/img/pattern/integration/api.gw.jpg)
![gw multi](/img/pattern/integration/api.gw.multi.jpg)

## Технологии

Compare https://www.techtarget.com/searchapparchitecture/feature/A-feature-rundown-of-6-popular-API-gateway-tools

- Open Source
  - [Ocelot](https://medium.com/aspnetrun/building-ocelot-api-gateway-microservices-with-asp-net-core-and-docker-container-13f96026e86c)
  - [Gravitie](../technology/api/gw.gravitee.md)
  - Kong
- Commercial
  - [traefik](https://traefik.io/solutions/api-gateway/)
  - [Citrix ADC (Netscaler)](../technology/middleware/proxy.netscaler.md)
