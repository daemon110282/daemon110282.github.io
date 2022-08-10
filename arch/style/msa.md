# Microservice architecture

- [Microservice architecture](#microservice-architecture)
  - [Зачем](#зачем)
  - [Плюсы и минусы](#плюсы-и-минусы)
  - [Паттерны](#паттерны)
  - [Технологии](#технологии)
  - [Reference Architecture](#reference-architecture)
  - [Links](#links)

## Зачем

* [TODO](https://photos.app.goo.gl/fx9KTNZDV8vS6GE78)

## Плюсы и минусы

[Критерии](../arch.criteria.md)

| + | - |
| - | - |
| Слабая связность | Сложность |

## Паттерны

- Декомпозиции на сервисы
  - [Decompose by business capability Context](https://microservices.io/patterns/decomposition/decompose-by-business-capability.html)
  - [Decompose by subdomain Context](https://microservices.io/patterns/decomposition/decompose-by-subdomain.html)
- [Обработка сбоев](msa.failure.md)
- Аутентификация
  - Leave the data where it is, and have services ask for it directly. Use a gateway to attach the data to all requests, so it's available everywhere. Centralize authorization data into one place, and move [all decisionmaking to that place](https://www.osohq.com/post/microservices-authorization-patterns).
- [Microservice Design Pattern](https://apolomodov.medium.com/%D0%BE%D0%B1%D0%B7%D0%BE%D1%80-%D0%BA%D0%BD%D0%B8%D0%B3%D0%B8-microservice-patterns-and-best-practices-dce7785b9c45)
  - Aggregator
  - Proxy 
  - Chained
  - Branch (Aggregator + Chained в связке)

## Технологии

- Service Mesh

## Reference Architecture

- [eShopOnContainers](https://github.com/dotnet-architecture/eShopOnContainers)
- [About
Microservices on .Net platforms which used Asp.Net Web API, Docker, RabbitMQ, MassTransit, Grpc, Ocelot API Gateway, MongoDB, Redis, PostgreSQL, SqlServer, Dapper, Entity Framework Core, CQRS and Clean Architecture implementation.](https://github.com/aspnetrun/run-aspnetcore-microservices)
- ДБО (СДО)
  - [BSS](https://plusworld.ru/lr/bss-microservice/)

## Links
