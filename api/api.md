# API

- [API](#api)
  - [Проектирование](#проектирование)
  - [Patterns](#patterns)
    - [Versioning](#versioning)
    - [Security](#security)
    - [Документирование](#документирование)
  - [API management](#api-management)
  - [Технологии](#технологии)

[Термины](https://starkovden.github.io/Glossary-for-API-documentation.html)

## Проектирование

- [Дизайн API от потребностей продукта](http://agilemindset.ru/%d0%b0%d1%80%d1%85%d0%b8%d1%82%d0%b5%d0%ba%d1%82%d1%83%d1%80%d0%b0/)
простота и удобство использования API потребителем важнее простоты и удобства реализации поставщиком
- [Критерии качественного API](https://twirl.github.io/The-API-Book/API.ru.html#chapter-3)
  - API должен решать задачи максимально удобно и понятно
  - API должен быть читаемым
  - Закладывание перспектив «на будущее» имеет смысл, только если это будущее у API есть, иначе это попросту __оверинжиниринг__.
- интерфейс API - __один сценарий использования (SRP)__

Виды API:

- [REST API](api.rest.md)
- GRPC
- GraphQL
- [Вебхуки Webhook](https://systems.education/api-realtime)
- SOAP
  - ESB

## Patterns

- [API gateway](api.gateway.md)
- [Стратегии повторов](../arch/pattern/pattern.failure.md) при сбоях Rerty Policy

SLI, SLA
- request latency
- system throughput
- availability and downtime
- When designing a [low-availability API, consider the use of HTTP 202 responses](https://www.gov.uk/guidance/setting-api-service-levels). For example, to indicate that the API has accepted a request but needs to wait to take further action. 

### Versioning

Then you can decide between implementing both versions of the service simultaneously within the same service instance, or deploying different instances that each handle a
version of the API. A good approach for this is the **Mediator pattern** (for example, **MediatR** library) to decouple the different implementation versions into independent handlers.

### Security

- [apisecurity.io](https://apisecurity.io/)
- [Угрозы OWASP подробно](https://habr.com/ru/post/503284/)
- [Control levels of user authorisation](https://www.gov.uk/guidance/gds-api-technical-and-data-standards)
- [API Security tools and resources](https://github.com/arainho/awesome-api-security)

### Документирование

- [AsyncApi](asyncapi.md)
- [OpenApi](openapi.md)
- [Почему машино читаемый формат, а не Word](https://www.apimatic.io/blog/2017/04/why-your-api-needs-machine-readable-description-832e805f6855/): трансформация форматов, Search and Discovery, Sharing, Aggregation, Code Generation (server, client), Mock, Monitoring  
- [Json Schema](jsonschema.md)
- TODO [Курс по документированию REST API](https://starkovden.github.io/)
- [Шаблон описания](https://tyk.io/blog/whats-minimum-documentation-required-api/)
- TODO [API Spec Trends](https://www.apimatic.io/blog/2022/03/top-api-specification-trends-2019-2022/)
- [WSDL](wsdl.md)
- [Top api design tools](https://www.g2.com/categories/api-design)
  - [Postman](../technology/api/postman.md)
  -

### API management

[API management](api-managment.md)

## Технологии

- [API Platform](https://blog.postman.com/new-postman-api-platform-redefining-api-management-for-api-first-world/)
  - [API management](api-managment.md)
  - [API Gateway](api.gateway.md)
    - Ocelot
    - Kong
    - Nginx
    - Gravitee
    - Tyk
