# Хранилища данных

- [Хранилища данных](#хранилища-данных)
  - [Зачем](#зачем)
  - [Плюсы и минусы](#плюсы-и-минусы)
  - [Паттерны](#паттерны)
  - [Принципы проектирования](#принципы-проектирования)
  - [Технологии](#технологии)

## Зачем

- [MS Хранилища данных](https://docs.microsoft.com/ru-ru/azure/architecture/guide/technology-choices/data-store-overview)
- Интегрирует множество источников данных и помогает снизить нагрузку на производственную систему.
- Оптимизированные данные для доступа к чтению и последовательного сканирования диска.
- Хранилище данных помогает защитить данные от обновлений исходной системы.
- Позволяет пользователям выполнять управление основными данными.
- Улучшение качества данных в исходных системах.

## Плюсы и минусы

[Критерии](arch.criteria.md)

| + | - |
| - | - |
|  |  |

![Выбор хранилища http://architecturethehardparts.com/](../img/arch/choose_store.jpg)
- Relational database. Almost anything could be solved by them. 
- In-memory store. Their speed and limited data size make them ideal for fast operations.
- Time-series database. Store and manage time-stamped data.
- NoSQL
  - Key Value
  - Graph database. It is suitable for complex relationships between unstructured objects.
  - Document store. They are good for large immutable data.
  - Wide column store. They are usually used for big data, analytics, reporting, etc., which needs denormalized data.


## Паттерны

- Денормализация
- Модель данных [звезда — оптимальная структура данных при переходе на российский BI](https://habr.com/ru/company/visiology/blog/678346/)
- Агрегированные витрины
- [Data Mining против хранилища данных](https://coderlessons.com/tutorials/bolshie-dannye-i-analitika/teoriia-khraneniia-dannykh/21-data-mining-protiv-khranilishcha-dannykh)

## Принципы проектирования

## Технологии

[Технологии](../technology/store.md)

