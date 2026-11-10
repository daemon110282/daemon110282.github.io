# Checklist API

- НТ
  - RPS
  - SLA
  - Кэширование - Ответы сервера должны иметь явное или неявное обозначение как кэшируемые или некэшируемые
  - НФТ, бизнес метрики
- Health Check
  - Мониторинг бд, аппов, health monitoring
  - Json метод со статусом апи
  - Сбор статистики обращений к веб сервису, кол-во запросов, фильтров топ
  - решение, использующее gRPC, оказывается на 27% быстрее решения, использующего HTTP/1.1.
- [Auth](../arch/ability/security/security.md)
- [Swagger\AsyncApi](../api/api.md) песочница
- Http headers
- [Gateway API](../arch/pattern/integration/pattern.integration.md)
- Асинхронная загрузка от сервиса  lazy load
- [Версии апи](../api/api.md): url, param, http header
- [Обработка сбоев](../arch/pattern/system.design/fault.tolerance/pattern.failure.md) веб сервиса
  - [Http status](../api/api-http-status.md)
  - [retry policy](../arch/pattern/system.design/fault.tolerance/pattern.failure.md)

## TODO

- [43 Things To Think About When Designing, Testing, and Releasing your API](https://mathieu.fenniak.net/the-api-checklist/)
- Пример [ТБанк](https://developer.tbank.ru/docs/api/post-api-v-1-credit-products-broker-id-applications-full)