# Паттерны Шаблоны Patterns

- [Паттерны Шаблоны Patterns](#паттерны-шаблоны-patterns)
  - [Виды](#виды)
  - [Проектирования и реализации](#проектирования-и-реализации)
  - [ООП](#ооп)
  - [Управления данными](#управления-данными)
  - [TODO](#todo)

## Виды

- [Интеграции](pattern/pattern.integration.md)
- [Производительность](pattern/pattern.perf.md)
  - [DevOps Avto Scale](../devops.md)
- Сквозная функциональность
  - [Аудита](pattern/observability/pattern.audit.md)
  - Наблюдаемость [Observability Patterns](ability/observability.md)
    - Агрегация логов
    - Обработка исключения
    - Распределенная трассировка
    - Метрики ИС
    - Аудит
    - Health Check API
- [Документирования](pattern/pattern.docs.md)
- [Deployment Patterns](https://airtable.com/embed/shryjXK2rzf52sv9u/tbl2vjDV9Es36E2cW) (13 Patterns)
  - [DevOps Deployment Rollback](../devops.md)
  - Проверка работоспособности ([Health-check](pattern/observability/pattern.healthcheck.md))
  - [Балансировка нагрузки](pattern/deployment/load.balancing.md)
- [Decomposition Patterns](https://airtable.com/embed/shrPwsn3G9IQ7JCm1/tbl7daDI4ZAAmedfD) (6 Patterns)
- [Transaction Management Patterns](https://airtable.com/embed/shrjiJuF7kIbcnXRl/tblgszzLV27MUFP4p) (5 Patterns)
- [Testing Patterns](https://airtable.com/embed/shr6p9u80mD9CzVU1/tblyGd1oiAcYuTSbr) (3 Patterns)
- [UI Patterns](https://airtable.com/embed/shrxffclVHmz95ii0/tblXbFfITMXmPjvGl) (3 Patterns)
- [Security Patterns](https://airtable.com/embed/shrHNtgdwr7wP6TJj/tbl2ssqnen3UkXoaF) (2 Patterns)
- Utility Patterns (3 Patterns)
- TODO
  - Маршрутизатор
  - Транслятор трансформер адаптер
  - Обертка
  - Издатель подписчик
  - Оркестрация - есть дирижер
  - Хореография - нет централизованного управления (медиатора)

## Проектирования и реализации

- [System Design шаги](https://www.youtube.com/watch?v=i7twT3x5yv8&ab_channel=ByteByteGo)
- [DDD](pattern/system.design/ddd.md)
- SOLID
  - Single concern principle, __single response principle (SRP)__ - решать одну проблему хорошо
  - __Open-Closed__ - сущности открыты для расширения, но закрыты для изменения
  - Liskov
  - Interface Segregation
  - Dependeny Injection
- [DbC - Design by contract](https://habr.com/ru/company/southbridge/blog/679906/)
- LC/HC - [Принципы GRASP](https://rmcreative.ru/blog/post/printsipy-grasp)
  - [Low coupling](ability/low.coupling.md)
  - High cohesion
- TODO
  - [Принципы проектирования MS](https://docs.microsoft.com/ru-ru/azure/architecture/guide/design-principles/)
  - [MS](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/category/design-implementation)
- Придумайте [второй вариант дизайна архитектуры](alternative.md), который тоже может сработать в вашей ситуации. Противопоставьте оба дизайна и объясните, почему один лучше другого.
- Групповые ревью, коллективный архитектор
- закладывайте в архитектуру возможности для __автоматического устранения неполадок__. В распределенных системах происходят сбои.
  - Приложение необходимо проектировать так, чтобы оно могло автоматически восстанавливать свою работу при возникновении сбоев.
- Обеспечивайте __резервирование__ всех компонентов. Резервирование позволяет избежать появления в приложении единственной точки отказа.
- Сводите к минимуму потребности в __координации__. Сведение к минимуму координации между службами приложения помогает обеспечить масштабируемость
- Учитывайте возможность расширения. Проектируйте приложение так, чтобы оно могло горизонтально масштабироваться, т.е. при необходимости можно было добавлять новые экземпляры
- Используйте __секционирование__ для обхода ограничений. Секционирование позволяет обходить ограничения, связанные с базами данных, сетевыми и вычислительными ресурсами.
- Проектируйте с учетом последующей __эксплуатации__. Приложение должно проектироваться так, чтобы его было удобно эксплуатировать и у группы эксплуатации были необходимые инструменты
- Используйте управляемые службы. По возможности используйте подход __РAAS__ (платформа как услуга), а не laas (инфраструктура как услуга)
- Используйте наиболее подходящие __технологии хранения данных__. Выбирайте технологии хранения в соответствии с типом данных и особенностями их использования
- Проектируйте с учетом __дальнейшего развития__. Все успешные приложения со временем развиваются. Чтобы приложение могло развиваться, необходимо закладывать возможности развития на этапе проектирования
- Разрабатывайте приложения с учетом потребностей бизнеса. Каждое принятое на этапе проектирования решение должно быть обусловлено __конкретным бизнес-требованием__.

## ООП

- Поведения
  - [FSM Конечный автомат](pattern/pattern.state.machine.md)
- Порождающие
- Структурные
- TODO
  - [Паттерн спецификация - бизнес условия для фильтрации данных](https://habr.com/ru/post/171559/)

## Управления данными

- [MS](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/category/data-management)
- [UMP](https://airtable.com/embed/shr1fDf0cVFiI3Ftk/tblpfBAj1ypKV4YUq)

## TODO

- [SAFe](safe.md) agile+lean

- <https://docs.google.com/document/d/1_IIesGIMDJLrtvEY4cpLrYh3XPaM3IUYyaJD9AljkYM/edit?usp=sharing>
- <https://docs.google.com/document/d/1PVbYEBd2wEmJyxQ0KUD1AnOt507pk-RReGRqnPpgtJE/edit?usp=sharing>

<https://microservices.io/patterns/microservices.html>
<https://www.enterpriseintegrationpatterns.com/patterns/>
<http://rubyamqp.info/articles/patterns_and_use_cases.html>
<http://citforum.ru/SE/project/pattern/>

- [RedHat Architect Portfolio](https://www.redhat.com/architect/portfolio/?intcmp=7013a0000025wJwAAI)
- TODO [Clean Code](pattern/cleancode.md)
- <https://en.wikipedia.org/wiki/Architectural_pattern>
- [Martin F patterns](https://martinfowler.com/dslCatalog/index.html)
<https://vocal.media/01/unified-microservices-patterns-ump>
- https://patterns.arcitura.com/
- https://towardsdatascience.com/10-common-software-architectural-patterns-in-a-nutshell-a0b47a1e9013