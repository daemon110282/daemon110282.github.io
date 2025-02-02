# API

Checklist:

- НТ rps, sla
  - Кэширование - Ответы сервера должны иметь явное или неявное обозначение как кэшируемые или некэшируемые
  - Нфт, бизнес метрики
- Мониторинг бд, аппов, health monitoring.
  - Json метод со статусом апи
  - Сбор статистики обращений к веб сервису, кол-во запросов, фильтров топ
  - решение, использующее gRPC, оказывается на 27% быстрее решения, использующего HTTP/1.1.
- [Auth](../arch/ability/security.md)
- [Swagger\AsyncApi](../api/api.md) песочница
- Http headers
- [Gateway API](../arch/pattern/integration/pattern.integration.md)
Асинхронная загрузка от сервиса, lazy load. Лк ходит сразу к веб сервису или к себе, затем вебсервис. Я за 2е, гибче переделать на свою бд, слабая связность
- [Версии апи](../api/api.md): url, param, http header
- [обработка сбоев](../arch/pattern/system.design/fault.tolerance/pattern.failure.md) веб сервиса
- [Http status](../api/api-http-status.md)
- [retry policy](../arch/pattern/system.design/fault.tolerance/pattern.failure.md)
