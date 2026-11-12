# Паттерны Проектирования

- [Паттерны Проектирования](#паттерны-проектирования)
  - [Иные](#иные)
  - [Decomposition Patterns](#decomposition-patterns)
  - [Разделения ответственности слоев](#разделения-ответственности-слоев)
  - [Сквозная функциональность](#сквозная-функциональность)
  - [Хранилищ данных](#хранилищ-данных)
  - [TODO](#todo)
  - [Анализ вариантов](#анализ-вариантов)

## Иные

- [MTA](mta/mta.md)
- [Fault Tolerance](fault.tolerance/pattern.failure.md)
- Оркестрация - есть дирижер
- [Хореография](../integration/orchestration-choreography.md) - нет централизованного управления (оркестратора - медиатора - дирижера)

## Decomposition Patterns

- [Decomposition Patterns](https://airtable.com/embed/shrPwsn3G9IQ7JCm1/tbl7daDI4ZAAmedfD) (6 Patterns)
  - [CQRS](../performance/pattern.cqrs.md)
  - [Strangler Fig](../refactoring/monolit2msa.md)
  - Decompose by DDD [subdomain](ddd.md)
  - Service per Team
- [__SOLID__](solid.md): SRP, OCP, LSP, ISP, DPI
- LC/HC - [Принципы GRASP](https://rmcreative.ru/blog/post/printsipy-grasp)
  - [Low coupling (LC)](./low.coupling.md)
  - High cohesion (HC)
- __DRY - Dont Repeat Yourself__: не должны повторяться именно в __поведении__, а не в __данных__ (например [микросервисы](../../style/msa.md))

## Разделения ответственности слоев

- MVC
- MVP
- MVVM
- MVI

## Сквозная функциональность

- [Аудита](../observability/pattern.audit.md)
- Наблюдаемость [Observability Patterns](../../ability/observability.md)
  - Агрегация логов
  - Обработка исключения
  - Распределенная трассировка
  - Метрики ИС
  - Аудит
  - Health Check API

## Хранилищ данных

- [Data store](data/data.md)
  - Materialized View
  - Database per service
  - [Shared Database\Table Шлюзовая БД (ШБД)](../performance/shard.db.md)
  - [Sharding](../performance/shard.db.md)
- DWH
- [Data Vault](data/data.vault.md)
- Big Data
  - [Data Lake](data/data.lake.md)
  - [Data Mart](data/data.mart.md)
  - [Map Reduce](data/map.reduce.md)

## TODO

- [Принципы проектирования MS](https://docs.microsoft.com/ru-ru/azure/architecture/guide/design-principles/)
- [MS](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/category/design-implementation)
- [System Design шаги](https://www.youtube.com/watch?v=i7twT3x5yv8&ab_channel=ByteByteGo)

## Анализ вариантов

- Придумайте [второй вариант дизайна архитектуры](../../alternative.md), который тоже может сработать в вашей ситуации. Противопоставьте оба дизайна и объясните, почему один лучше другого.
