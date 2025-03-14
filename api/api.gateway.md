
# API Gateway

- [API Gateway](#api-gateway)
  - [Зачем](#зачем)
  - [Плюсы-минусы](#плюсы-минусы)
  - [Паттерны](#паттерны)
  - [Технологии](#технологии)

## Зачем

Реализует и расширяет функции [Reverse Proxy](../arch/pattern/deployment/pattern.proxy.reverse.md) и [Load Balancer](../arch/pattern/deployment/load.balancing.md)

- Снижение связности ИС
- Too many __round trips__. [Паттерн Aggregation запросов](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-aggregation)
  - minimize the [number of requests to the back end](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/architect-microservice-container-applications/direct-client-to-microservice-communication-versus-the-api-gateway-pattern) and reduce chatty
communication to multiple microservices
- [Сквозная функциональность](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-offloading) __cross-cutting concerns__ or gateway offloading  
  - [Authentication](https://konghq.com/learning-center/api-gateway/api-gateway-authentication) and authorization
    - [OAuth](../technology/protocols.integration/oauth.md) access token
  - [Service discovery](../arch/pattern/deployment/service.discovery.md) integration
  - Response caching
  - [Retry policies, circuit breaker, and QoS](../arch/pattern/system.design/fault.tolerance/pattern.failure.md)
  - [Rate limiting](../arch/pattern/performance/rate.limit.md) and throttling
  - [Logging, tracing, correlation](../arch/ability/observability.md)
  - Headers, query strings, and claims transformation
- [Mock](../arch/pattern/mock.md)
- __Security issues__ Сокрытие внутренних API ИС от внешних ИС потребителей
  - Without a gateway, all the microservices must be exposed to the “external world"
- [Паттерн BFF](../arch/pattern/integration/pattern.bff.md)

Функции [Load Balancer](../arch/pattern/deployment/load.balancing.md)

  - [Load balancing](../arch/pattern/deployment/load.balancing.md)

Функции [Reverse proxy](../arch/pattern/deployment/pattern.proxy.reverse.md)

  - Dynamic request dispatching, __routing__ [or gateway routing](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/gateway-routing)
  - IP whitelisting
  - [TLS Termination](../arch/pattern/deployment/tls.termination.md)

Расширяют функции API Gateway ИС класса [__API managment__](api-managment.md) (APIM)

- Monetize
- Трансформация запросов REST2RMQ, REST2gRPC и тп.
  - client apps communicate with services that use __non-Internet-friendly protocols(amqp)__

Поддержка WebSocket:

- [Kong](../technology/middleware/api.gateway/gw.kong.md)
- [Gravitie](../technology/middleware/api.gateway/gw.gravitee.md)

Тодо

- <https://link.medium.com/Cu6FA4CrHub>

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
  - Envoy
- Commercial
  - Tyk
  - [traefik](../technology/middleware/api.gateway/gw.traefik.md)  
    - [vs NGINX](https://www.kubecost.com/kubernetes-devops-tools/traefik-vs-nginx/)
  - [Citrix ADC (Netscaler)](../technology/middleware/proxy/proxy.netscaler.md)
  - [Nginx](../technology/middleware/proxy/proxy.nginx.md)
