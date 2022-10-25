# API

- [API](#api)
  - [Проектирование](#проектирование)
  - [Patterns](#patterns)
    - [Versioning](#versioning)
    - [Security](#security)
  - [Документирование](#документирование)
  - [API management](#api-management)
  - [Технологии](#Технологии)
  - [Links](#links)

Термины
- https://starkovden.github.io/Glossary-for-API-documentation.html


## Проектирование

* [Дизайн API от потребностей продукта](http://agilemindset.ru/%d0%b0%d1%80%d1%85%d0%b8%d1%82%d0%b5%d0%ba%d1%82%d1%83%d1%80%d0%b0/)
простота и удобство использования API потребителем важнее простоты и удобства реализации поставщиком
* [Критерии качественного API](https://twirl.github.io/The-API-Book/API.ru.html#chapter-3)
  * API должен решать задачи максимально удобно и понятно
  * API должен быть читаемым
  * Закладывание перспектив «на будущее» имеет смысл, только если это будущее у API есть, иначе это попросту оверинжиниринг.
* интерфейс API - один сценарий использования (SRP)  
* [REST API](api.rest.md)
* GRPC
* GraphQL
* [Вебхуки Webhook](https://systems.education/api-realtime)
* SOAP
  * ESB

## Patterns

TODO
- https://microservice-api-patterns.org/
- https://mathieu.fenniak.net/the-api-checklist/
- https://habr.com/ru/post/503284/
- https://habr.com/ru/post/447322/
- https://www.gov.uk/guidance/gds-api-technical-and-data-standards
- https://www.gov.uk/guidance/setting-api-service-levels
- [API gateway](api.gateway.md)
- [Стратегии повторов](../arch/pattern/pattern.failure.md) при сбоях Rerty Policy

### Versioning

Then you can decide between implementing both versions of the service 
simultaneously within the same service instance, or deploying different instances that each handle a 
version of the API. A good approach for this is the **Mediator pattern** (for example, **MediatR** library) to 
decouple the different implementation versions into independent handlers

### Security

* [apisecurity.io](https://apisecurity.io/)
  * [REST Best Practice](https://stackoverflow.blog/2021/10/06/best-practices-for-authentication-and-authorization-for-rest-apis/?utm_campaign=APISecurity%20newsletter&utm_medium=email&_hsmi=204867978&_hsenc=p2ANqtz-94r6UDHzZG48tgtd0Sz6OiZicy6tTBQysQKtk0WzhZXlXrXBucIld80QE3Gll1Le1lxnwNhNqu-pySFps1AsqeR8MQrg&utm_content=204868574&utm_source=hs_email)

## Документирование

* [AsyncApi](asyncapi.md)
* [OpenApi](https://github.com/daemon110282/api#openapi)
  * [Почему машино читаемый формат, а не Word](https://www.apimatic.io/blog/2017/04/why-your-api-needs-machine-readable-description-832e805f6855/): трансформация форматов, Search and Discovery, Sharing, Aggregation, Code Generation (server, client), Mock, Monitoring
  * [Map](http://openapi-map.apihandyman.io/)
  * support [Json Schema](jsonschema.md)
* [Json Schema](jsonschema.md)
* [Курс по документированию REST API](https://starkovden.github.io/)
* [Шаблон описания](https://tyk.io/blog/whats-minimum-documentation-required-api/)
* TODO [API Spec Trends](https://www.apimatic.io/blog/2022/03/top-api-specification-trends-2019-2022/)
* [WSDL](wsdl.md)

## API management

[API management](api-managment.md)

## Технологии

- [Api Gateway](api.gateway.md)
  - Ocelot

## Links

https://mathieu.fenniak.net/the-api-checklist/
https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md
