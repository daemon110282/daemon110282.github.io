# GraphQL

Конкурент rest api

- Voyager [схема](https://habr.com/ru/articles/852998/)
- Apollo engine мониторинг, статистика использования API
- Faker mock
- Mobile apollo
- Openapi 3 swagger генерация кода

## Плюсы и минусы

Плюсы:

- is more efficient in data fetching.
- returns more accurate results.
- has a strong type system to manage the structure of entities, reducing errors.
- is suitable for managing complex microservices.

Минусы:

- Increased complexity
- Over fetching by design
- Caching complexity

## Модель

- Query - Запросы (HTTP)
  - Arguments
  - Object
    - Field
- Mutation - Команды (HTTP)
- Subscription - Подписки (WebSocket)
