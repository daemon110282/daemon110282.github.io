# Domain Driven Design DDD

- [Domain Driven Design DDD](#domain-driven-design-ddd)
  - [Зачем](#зачем)
  - [Плюсы и минусы](#плюсы-и-минусы)
  - [Принципы проектирования](#принципы-проектирования)
  - [Технологии](#технологии)
  - [Links](#links)

## Зачем

- Снизить сложность
- Уменьшить зависимости
- Бизнес ценность достичь
- Модель предметной области (сущности-функции) - доменная модель
- Единый язык ИТ и бизнеса

## Плюсы и минусы

| + | - |
| - | - |

## Принципы проектирования

![Схема](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/daemon110282/daemon110282.github.io/daemon110282-patch-1/ddd.puml)

[Схемы](https://docs.google.com/document/d/1qgHu49LneU_iNi3YmPLc1NHSVfH-BvONdOyjg5DE8Xs/edit?usp=sharing)

- 1 Стратегическое проектирование
  - Смысловое ядро - успех бизнеса
  - Контекст
  - Предметная область(проблема) Domain
  - Подобласть (core, generic)
  - Пространство задач - бизнес целей. Подобласть Subdomain=Задачи бизнеса
  - Пространство решений - ограниченных контекстов (Bounded context)=решение по Подобласти subdomain.
    - это явная граница, внутри которой существует модель предметной области, которая отображает ЕДИНЫЙ ЯЗЫК в модель программного обеспечения.
    - Не всегда равно сервису, может применяться и в модульном монолите (напр отдельные таблицы сущностей разных контекстов).
    - Теоретически каждая подобласть может иметь несколько ограниченных контекстов, хотя мы стремимся, чтобы для одной подобласти он был один.
  - [Карта ограниченных контекстов](https://nuancesprog.ru/p/9085/) - интеграции между контекстами
- [2 Тактическое проектирование](https://habr.com/ru/company/oleg-bunin/blog/551428/)
  - Доменная модель
    - Консистентность данных обеспечить
    - Переход от анемичной к богатой модели
    - Изоляция от внешних зависимостей
    - [Агрегат](https://habr.com/ru/company/nix/blog/321686/) - кластер из сущностей и объектов значений
    - Сущность - есть ИД
    - Объект значений value object -
  - Служба
  - Модули
- DDD трилема
- [Clean Architecture](clean.architecture.md)

## Технологии

- Framework, Platform
  - [ABP.IO](../../technology/framework/abp.md)
- Plantuml + vs code
- Context Mapping DSL (CML) - [A Modeling Framework](https://contextmapper.org/) for Strategic Domain-driven Design
- [Microservice DSL (MDSL)](https://github.com/Microservice-API-Patterns/MDSL-Specification) support Generators. In the MDSL Editor, you can invoke the following generators from the “MDSL” entry in the context menu:
  - Generate OpenAPI Specification
  - Generate Protocol Buffers Specification
  - Generate GraphQL Schema
  - Generate Jolie Lang(uage) Specification
  - Generate Java “Modulith” Code
  - Generate ALPS specification (status: technology preview)
  - Generate AsyncMDSL specification (this actually is an in-model transformation, it does not generate a new output file)
  - Generate Text File with Freemarker Template
  - Generate AsyncAPI (from AsyncMDSL). See page AsyncAPI Specification Generator and readme in this examples folder for further information.
  - Generate MSML
  - From MSML OpenAPI

## Links

- TODO
  - [Паттерны](https://github.com/Sairyss/domain-driven-hexagon)
  - [IBM sample event-storming](https://www.ibm.com/cloud/architecture/architecture/practices/event-storming-methodology-architecture/)
    - [IBM sample DDD](https://ibm-cloud-architecture.github.io/refarch-kc/implementation/domain-driven-design/)
    - [IBM sample event-storming analysis](https://ibm-cloud-architecture.github.io/refarch-kc/implementation/event-storming-analysis/)
