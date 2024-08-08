# Паттерны Шаблоны Patterns

- [Паттерны Шаблоны Patterns](#паттерны-шаблоны-patterns)
  - [Виды](#виды)
  - [Управления данными](#управления-данными)
  - [TODO](#todo)

## Виды

- [Проектирования](pattern/system.design/system.design.md)
  - Сквозная функциональность
    - [Аудита](pattern/observability/pattern.audit.md)
    - Наблюдаемость [Observability Patterns](./ability/observability.md)
      - Агрегация логов
      - Обработка исключения
      - Распределенная трассировка
      - Метрики ИС
      - Аудит
      - Health Check API
  - Оркестрация - есть дирижер [или Хореография](pattern/system.design/orchestration-choreography.md) - нет централизованного управления (медиатора)
- [Реализации](pattern/development/pattern.dev.md)
- [Интеграции](pattern/integration/pattern.integration.md)
- [Производительность](pattern/performance/pattern.perf.md)
  - [DevOps Avto Scale](../devops.md)
- [Документирования](pattern/pattern.docs.md)
- [Deployment Patterns](https://airtable.com/embed/shryjXK2rzf52sv9u/tbl2vjDV9Es36E2cW) (13 Patterns)
  - [DevOps Deployment Rollback](../devops.md)
  - Проверка работоспособности ([Health-check](pattern/observability/pattern.healthcheck.md))
  - [Балансировка нагрузки](pattern/deployment/load.balancing.md)
- [Decomposition Patterns](https://airtable.com/embed/shrPwsn3G9IQ7JCm1/tbl7daDI4ZAAmedfD) (6 Patterns)
  - [CQRS](pattern/performance/pattern.cqrs.md)
  - [Strangler Fig](pattern/refactoring/monolit2msa.md)
  - Decompose by [subdomain](pattern/system.design/ddd.md)
  - Service per Team
- [Transaction Management Patterns](https://airtable.com/embed/shrjiJuF7kIbcnXRl/tblgszzLV27MUFP4p) (5 Patterns)
  - [Transactional Outbox](pattern/fault.tolerance/transact.outbox.md)
  - [Transactional Inbox](pattern/fault.tolerance/transact.inbox.md)
  - Saga
  - Polling publisher
  - Transaction log tailing
- [Testing Patterns](https://airtable.com/embed/shr6p9u80mD9CzVU1/tblyGd1oiAcYuTSbr) (3 Patterns)
- [UI Patterns](https://airtable.com/embed/shrxffclVHmz95ii0/tblXbFfITMXmPjvGl) (3 Patterns)
- [Security Patterns](https://airtable.com/embed/shrHNtgdwr7wP6TJj/tbl2ssqnen3UkXoaF) (2 Patterns)
  - Access Token ([JWT](../../technology/jwt.md))
  - Federated Identity
- Utility Patterns (3 Patterns)
- TODO
  - Маршрутизатор
  - Транслятор трансформер адаптер
  - Обертка
  - Издатель подписчик  

## Управления данными

- [MS](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/category/data-management)
- [UMP](https://airtable.com/embed/shr1fDf0cVFiI3Ftk/tblpfBAj1ypKV4YUq)

## TODO

<https://microservices.io/patterns/microservices.html>
<https://www.enterpriseintegrationpatterns.com/patterns/>
<http://rubyamqp.info/articles/patterns_and_use_cases.html>
<http://citforum.ru/SE/project/pattern/>

- [RedHat Architect Portfolio](https://www.redhat.com/architect/portfolio/?intcmp=7013a0000025wJwAAI)
- TODO [Clean Code](pattern/system.design/cleancode.md)
- <https://en.wikipedia.org/wiki/Architectural_pattern>
<https://vocal.media/01/unified-microservices-patterns-ump>
- https://patterns.arcitura.com/
- https://towardsdatascience.com/10-common-software-architectural-patterns-in-a-nutshell-a0b47a1e9013