# Паттерны Шаблоны Patterns

* Проектирования
  * [DDD](ddd.md)
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
  * [TODO Принципы проектирования MS](https://docs.microsoft.com/ru-ru/azure/architecture/guide/design-principles/)
  * Придумайте [второй вариант дизайна архитектуры](alternative.md), который тоже может сработать в вашей ситуации. Противопоставьте оба дизайна и объясните, почему один лучше другого.
  * Групповые ревью, коллективный архитектор
  * [SAFe](safe.md) agile+lean
  * Порядок пирамиды архитектуры решения:
    * Функциональная(use case, пз, бт)
    * информационная(модель данных, предметная область, сущность, связи)
    * прикладная(взаимодействия компонентов)
    * интеграционная(рипв)
    * технологическая(инфраструктура, оиб)
* ООП
  * Поведения
  * Порождающие
  * Структурные
  * TODO
    * [Паттерн спецификация - бизнес условия для фильтрации данных](https://habr.com/ru/post/171559/)
* [DevOps Deployment Rollback](../devops.md)
* [Интеграции](pattern/pattern.integration.md)
* [Производительность](pattern/pattern.perf.md)
  * [DevOps Scale](../devops.md)
* Сквозная функциональность
  * [Аудита](pattern/pattern.audit.md)
  * Логирования
* [Документирования](pattern/pattern.docs.md)

TODO 
https://docs.google.com/document/d/1_IIesGIMDJLrtvEY4cpLrYh3XPaM3IUYyaJD9AljkYM/edit?usp=sharing
https://docs.google.com/document/d/1PVbYEBd2wEmJyxQ0KUD1AnOt507pk-RReGRqnPpgtJE/edit?usp=sharing
Маршрутизатор
Транслятор трансформер адаптер
Обертка
Издатель подписчик

Оркестрация - есть дирижер
Хореография - нет централизованного управления (медиатора)


## Links

- [MS Azure](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/)
- [RedHat Architect Portfolio](https://www.redhat.com/architect/portfolio/?intcmp=7013a0000025wJwAAI)
- TODO [Clean Code](pattern/cleancode.md)
- https://en.wikipedia.org/wiki/Architectural_pattern