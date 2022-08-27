# Паттерны Шаблоны Patterns

* [Интеграции](pattern/pattern.integration.md)
* [Производительность](pattern/pattern.perf.md)
  * [DevOps Scale](../devops.md)
* Сквозная функциональность
  * [Аудита](pattern/pattern.audit.md)
  * Логирования
* [Документирования](pattern/pattern.docs.md)
* [Deployment Patterns](https://airtable.com/embed/shryjXK2rzf52sv9u/tbl2vjDV9Es36E2cW) (13 Patterns)
  * [DevOps Deployment Rollback](../devops.md)
* [Decomposition Patterns](https://airtable.com/embed/shrPwsn3G9IQ7JCm1/tbl7daDI4ZAAmedfD) (6 Patterns)
* [Transaction Management Patterns](https://airtable.com/embed/shrjiJuF7kIbcnXRl/tblgszzLV27MUFP4p) (5 Patterns)
* [Testing Patterns](https://airtable.com/embed/shr6p9u80mD9CzVU1/tblyGd1oiAcYuTSbr) (3 Patterns)
* [Observability Patterns](https://airtable.com/embed/shrGgtSh9eNnxTu8m/tblMoXyKKAbxyuPrg) (6 Patterns)
* [UI Patterns](https://airtable.com/embed/shrxffclVHmz95ii0/tblXbFfITMXmPjvGl) (3 Patterns)
* [Service Discovery Patterns](https://airtable.com/embed/shrRiLR67Cu53Q83s/tbljDWNtHuaCFg2Ez) (4 Patterns)
* [Security Patterns](https://airtable.com/embed/shrHNtgdwr7wP6TJj/tbl2ssqnen3UkXoaF) (2 Patterns)

## Utility Patterns (3 Patterns)

## Проектирования и реализации

* [DDD](pattern/ddd.md)
* SOLID
  * Single concern principle, single response principle (SRP) - решать одну проблему хорошо
  * Open-Closed - сущности открыты для расширения, но закрыты для изменения
  * Liskov
  * Interface Segregation
  * Dependeny Injection
* [DbC - Design by contract](https://habr.com/ru/company/southbridge/blog/679906/)
* LC/HC - [Принципы GRASP](https://rmcreative.ru/blog/post/printsipy-grasp)
  * Low coupling
  * High cohesion
* TODO
  * [Принципы проектирования MS](https://docs.microsoft.com/ru-ru/azure/architecture/guide/design-principles/)
  * [MS](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/category/design-implementation)
* Придумайте [второй вариант дизайна архитектуры](alternative.md), который тоже может сработать в вашей ситуации. Противопоставьте оба дизайна и объясните, почему один лучше другого.
* Групповые ревью, коллективный архитектор
* [SAFe](safe.md) agile+lean
* Порядок пирамиды архитектуры решения:
  * Функциональная(use case, пз, бт)
  * информационная(модель данных, предметная область, сущность, связи)
  * прикладная(взаимодействия компонентов)
  * интеграционная(рипв)
  * технологическая(инфраструктура, оиб)

## ООП

* Поведения
  * [FSM Конечный автомат](pattern/pattern.state.machine.md)
* Порождающие
* Структурные
* TODO
  * [Паттерн спецификация - бизнес условия для фильтрации данных](https://habr.com/ru/post/171559/)

## Управления данными

[MS](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/category/data-management)
[UMP](https://airtable.com/embed/shr1fDf0cVFiI3Ftk/tblpfBAj1ypKV4YUq)

## TODO

- https://docs.google.com/document/d/1_IIesGIMDJLrtvEY4cpLrYh3XPaM3IUYyaJD9AljkYM/edit?usp=sharing
- https://docs.google.com/document/d/1PVbYEBd2wEmJyxQ0KUD1AnOt507pk-RReGRqnPpgtJE/edit?usp=sharing
- Маршрутизатор
- Транслятор трансформер адаптер
- Обертка
- Издатель подписчик
- Оркестрация - есть дирижер
- Хореография - нет централизованного управления (медиатора)

https://microservices.io/patterns/microservices.html
https://www.enterpriseintegrationpatterns.com/patterns/
http://rubyamqp.info/articles/patterns_and_use_cases.html
http://citforum.ru/SE/project/pattern/
- [RedHat Architect Portfolio](https://www.redhat.com/architect/portfolio/?intcmp=7013a0000025wJwAAI)
- TODO [Clean Code](pattern/cleancode.md)
- https://en.wikipedia.org/wiki/Architectural_pattern
- [Martin F patterns](https://martinfowler.com/dslCatalog/index.html)
https://vocal.media/01/unified-microservices-patterns-ump