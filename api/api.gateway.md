# API Gateway

## Зачем?

- Снижение связности
- Too many __round trips__. [Паттерн Aggregation](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-aggregation)
  - How can client apps minimize the [number of requests to the back end](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/architect-microservice-container-applications/direct-client-to-microservice-communication-versus-the-api-gateway-pattern) and reduce chatty
communication to multiple microservices?
- [Сквозная функциональность](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-offloading) or gateway offloading
  - How can you handle __cross-cutting concerns__
    - Authentication and authorization
    - Service discovery integration
    - Response caching
    - Retry policies, circuit breaker, and QoS
    - Rate limiting and throttling
    - Load balancing
    - Logging, tracing, correlation
    - Headers, query strings, and claims transformation
    - Dynamic request dispatching, routing. __[Reverse proxy](../arch/pattern/pattern.proxy.reverse.md)__ [or gateway routing](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-routing)
    - IP whitelisting
    - TLS Termination
- How can client apps communicate with services that use __non-Internet-friendly protocols(amqp)?__
- Security issues: Without a gateway, all the microservices must be exposed to the “external world"
- The API Gateway pattern is also sometimes known as the __“backend for frontend”__ (BFF) because you build it while thinking about the needs of the client app.
  - How can you shape a __facade__ especially [made for mobile apps](https://microservices.io/patterns/apigateway)?
  
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

- Open Source
  - Ocelot
  - Gravitie
  - Kong
- Commercial
  - https://traefik.io/solutions/api-gateway/