# API

- [API](#api)
  - [Виды API](#виды-api)
  - [Patterns](#patterns)
    - [Versioning](#versioning)
    - [Security](#security)
    - [Документирование](#документирование)
    - [API management](#api-management)
  - [Технологии](#технологии)

[Термины](https://starkovden.github.io/Glossary-for-API-documentation.html)

API - Application Programming Interface, что значит программный интерфейс приложения

  - «приложение» относится к любому ПО с определенной функцией
  - Интерфейс можно рассматривать как сервисный контракт между двумя приложениями. Этот контракт определяет, как они взаимодействуют друг с другом, используя запросы и ответы
  - Документация API содержит информацию о том, как разработчики должны структурировать эти запросы и ответы.

## Виды API

[API protocols](https://blog.postman.com/api-protocols-in-2023/)

- [REST API](api.rest.md)
- [gRPC](grpc.md)
- GraphQL
- [Вебхуки Webhook](webhook.md)
- [SOAP](wsdl.md)
  - ESB
- EDI
- SSE
- AMQP
- MQTT
- WebSocket

![Alt text](../img/api/api.protocols.jpg)

## Patterns

- [Подходы к проектированию](api.design.md)
- [API gateway](api.gateway.md)
- [Стратегии повторов](../arch/pattern/fault.tolerance/pattern.failure.md) при сбоях Rerty Policy

SLI, SLA

- request latency
- system throughput
- availability and downtime
- When designing a [low-availability API, consider the use of HTTP 202 responses](https://www.gov.uk/guidance/setting-api-service-levels). For example, to indicate that the API has accepted a request but needs to wait to take further action

### Versioning

- Then you can decide between implementing both versions of the service simultaneously within the same service instance, or deploying different instances that each handle a version of the API.
- A good approach for this is the __Mediator pattern__ (for example, __MediatR__ library) to decouple the different implementation versions into independent handlers.

### Security

- [apisecurity.io](https://apisecurity.io/)
- [Угрозы OWASP подробно](https://habr.com/ru/post/503284/)
- [Control levels of user authorisation](https://www.gov.uk/guidance/gds-api-technical-and-data-standards)
- [API Security tools and resources](https://github.com/arainho/awesome-api-security)
- [openapi security](https://openapi.security/)

### Документирование

- EDA
  - [AsyncApi](asyncapi.md)
  - [EventCatalog](https://www.eventcatalog.dev/docs/events/introduction)
- REST
  - [OpenApi](openapi.md)
- [Почему машино читаемый формат, а не Word](https://www.apimatic.io/blog/2017/04/why-your-api-needs-machine-readable-description-832e805f6855/): трансформация форматов, Search and Discovery, Sharing, Aggregation, Code Generation (server, client), Mock, Monitoring  
- [Json Schema](jsonschema.md)
- TODO [Курс по документированию REST API](https://starkovden.github.io/)
- [Шаблон описания](https://tyk.io/blog/whats-minimum-documentation-required-api/)
- TODO [API Spec Trends](https://www.apimatic.io/blog/2022/03/top-api-specification-trends-2019-2022/)
- SOAP
  - [WSDL](wsdl.md)
- [Top API design tools](https://www.g2.com/categories/api-design)
  - [Postman](../technology/api/postman.md)

### API management

[API management](api-managment.md)

## Технологии

[G2 Top tools](https://www.g2.com/reports/8128c8c9-0bc9-4c9e-8daa-b1b1294d3c77/preview?tab=grid)

- [API Platform](https://blog.postman.com/new-postman-api-platform-redefining-api-management-for-api-first-world/)
  - [API management](api-managment.md)
  - [API Gateway](api.gateway.md)
