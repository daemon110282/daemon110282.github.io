# Microservice architecture

- [Microservice architecture](#microservice-architecture)
  - [Зачем](#зачем)
  - [Плюсы и минусы](#плюсы-и-минусы)
  - [Паттерны](#паттерны)
  - [Технологии](#технологии)
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
Leave the data where it is, and have services ask for it directly.
Use a gateway to attach the data to all requests, so it's available everywhere.
Centralize authorization data into one place, and move all decisionmaking to that place.
. https://www.osohq.com/post/microservices-authorization-patterns?utm_source=pocket_mylist
. Zanzibar

## Технологии

- Service Mesh

## Links
