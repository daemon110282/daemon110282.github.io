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

- RDBMS (Relational Database Management System)
  - Almost anything could be solved by them.
- Time-series database
  - Store and manage time-stamped data.
- NoSQL
  - Key Value
    - In-memory store - Their speed and limited data size make them ideal for fast operations.
  - Graph database - It is suitable for complex __relationships between unstructured objects__.
  - Document store - They are good for __large immutable data__.
  - Wide column store - They are usually used for __big data, analytics, reporting__, etc., which needs __denormalized data__.
- Full text search Полнотекстовый поиск

## Паттерны

- Модель данных [звезда — оптимальная структура данных при переходе на российский BI](https://habr.com/ru/company/visiology/blog/678346/)
- Агрегированные витрины
  - Materialized View
- [Data Mining против хранилища данных](https://coderlessons.com/tutorials/bolshie-dannye-i-analitika/teoriia-khraneniia-dannykh/21-data-mining-protiv-khranilishcha-dannykh)
- On-Line Analitical Processing (__OLAP__) - оперативная аналитическая обработка данных
  - принципы построения систем поддержки принятия решений (Decision Support System - DSS)
  - хранилищ данных (Data Warehouse)
  - систем интеллектуального анализа данных (Data Mining)
- __Мутабельные__ (изменяемые mutable) или иммутабельные (не изменяемые immutable) данные
- Принципы __ACID__
  - atomaric
  - consistently
  - isolation
  - durability
- OLTP (Online Transaction Processing)
  - CRUD обработка транзакций
- Нормальная форма отношений в РСУБД 1, 2, 3 для __OLTP__
  - Денормализация отношений для OLAP
  - В решениях 1С компромисс реализован следующим образом: События при записи в базу пишутся сразу в несколько мест
    - В одном месте записи имеют мало индексов и оптимизированы под OLTP нагрузки
    - в другом месте записи индексируются по всем полям и адаптированы для OLAP нагрузок
    - Такие таблицы называются регистрами накоплений и регистрами сведений.
- [Секционирование шардирование](./pattern/performance/shard.db.md)
  
## Принципы проектирования

![Выбор хранилища http://architecturethehardparts.com/](../img/arch/choose_store.jpg)

- [SQL vs NoSQL](https://towardsdatascience.com/datastore-choices-sql-vs-nosql-database-ebec24d56106)
  - ![choose](https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Ff5b7dcbd-a2b0-4677-8ffa-669acf91242b_1143x1600.jpeg)
- SQL, NoSQL, TimeSeries
  - ![плюсы-минусы](https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fcb5bb38f-5383-495d-aed8-cf1d0a44e03b_1600x1600.png)

## Технологии

[Технологии](../technology/store.md)
