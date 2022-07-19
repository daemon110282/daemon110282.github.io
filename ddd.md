# Domain Driven Design DDD

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

- ОГРАНИЧЕННЫЙ КОНТЕКСТ
  - это явная граница, внутри которой существует модель предметной области, которая отображает ЕДИНЫЙ ЯЗЫК в модель программного обеспечения.
  - Не всегда равно сервису, может применяться и в монолите (напр отд таблицы сущностей разных контекстов).
- Доменная модель
  - Консистентность данных обеспечить
  - Переход от анемичной к богатой модели
  - Изоляция от внешних зависимостей
- DDD трилема
- 1 Стратегическое проектирование
  - Смысловое ядро - успех бизнеса
  - Контекст
  - Предметная область(проблема) Domain
  - Подобласть (core, generic)
  - Пространство задач - бизнес целей. Subdomain=Задачи бизнеса
  - Пространство решений - орг-х контекстов. Bounded context=решение по subdomain.
  - Карта ограниченных контекстов - интеграции между ними.
- 2 Тактическое проектирование
  - Агрегат - кластер из сущностей и объектов значений
  - Сущность - есть ИД
  - Объект значений value object -
  - Служба
  - Модули

## Технологии

- Framework, Platform
  - [ABP.IO](technology/abp.md)

A Modeling Framework for Strategic Domain-driven Design
Plantuml, vs code
https://contextmapper.org/

Context Mapping DSL (CML)


Microservice DSL (MDSL)
https://github.com/Microservice-API-Patterns/MDSL-Specification
Generators
In the MDSL Editor, you can invoke the following generators from the “MDSL” entry in the context menu:

Generate OpenAPI Specification
Generate Protocol Buffers Specification
Generate GraphQL Schema
Generate Jolie Lang(uage) Specification
Generate Java “Modulith” Code
Generate ALPS specification (status: technology preview)
Generate AsyncMDSL specification (this actually is an in-model transformation, it does not generate a new output file)
Generate Text File with Freemarker Template
Generate AsyncAPI (from AsyncMDSL). See page AsyncAPI Specification Generator and readme in this examples folder for further information.



Generate msml 

From msml openapi

## Links

- TODO
  - https://github.com/Sairyss/domain-driven-hexagon
  - IBM sample
    - https://www.ibm.com/cloud/architecture/architecture/practices/event-storming-methodology-architecture/
    - https://ibm-cloud-architecture.github.io/refarch-kc/implementation/domain-driven-design/
    - https://ibm-cloud-architecture.github.io/refarch-kc/implementation/event-storming-analysis/
