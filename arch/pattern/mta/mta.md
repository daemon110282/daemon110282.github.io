# Multi Tenant Architecture

- [Multi Tenant Architecture](#multi-tenant-architecture)
  - [Зачем](#зачем)
  - [Плюсы минусы](#плюсы-минусы)
  - [Паттерны](#паттерны)
    - [Multi Tenant Architecture (MTA) - Single Instance](#multi-tenant-architecture-mta---single-instance)
    - [Single Tenant Architecture (STA) - Multi Instance](#single-tenant-architecture-sta---multi-instance)
    - [Гибридный вариант](#гибридный-вариант)
  - [To-do](#to-do)

## Зачем

[Схемы](https://docs.google.com/document/d/1adNn0l5iUZFGiqMzqjup6f-DtkBPP4pnbDjRsP8M70E/edit?usp=sharing)
[Схемы](../../../img)

## Плюсы минусы

[Критерии](../../arch.criteria.md)

Плюсы:

- Безопасность
- Стоимость эксплуатации (TCO)
- Производительность
- Надежность
- Функциональность
  - Скорость реагирования на потребности отдельных клиентов - уникальный функционал.
  - Переиспользование общего (Единая кодовая база) функционала.
- Управляемость - сопровождение
- Разработка
- TimeToMarket сократить по ЮЛ

Минусы, Риски:

- [Шумные соседи](https://docs.microsoft.com/ru-RU/azure/architecture/antipatterns/noisy-neighbor/noisy-neighbor)
  - Производительность
  - Надежность
  - Безопасность
- Сложность разработки

## Паттерны

- [Модели MTA](https://docs.microsoft.com/ru-ru/azure/architecture/guide/multitenant/considerations/tenancy-models)
  - Если вы ожидаете, что ваш **бизнес будет масштабироваться до большого количества клиентов**, очень важно развернуть *общую инфраструктуру*.
  - Если требования к **изоляции клиентов являются высокими**, может потребоваться **инфраструктура с одним клиентом и отдельными инстансами (экземплярами решения)**.
  - ![Уровни изоляции](https://docs.microsoft.com/ru-RU/azure/architecture/guide/multitenant/considerations/media/tenancy-models/isolated-shared.png)
- [RMQ multi-tenancy](mta.mq.md)
- [Database multi-tenancy](mta.db.md)
- [k8s multi-tenancy](mta.k8s.md)

[Варианты](https://docs.microsoft.com/ru-ru/azure/architecture/guide/multitenant/overview):

- Multi Tenant Architecture (MTA) - Single Instance
- Single Tenant Architecture (STA) - Multi Instance
- Гибридный (компромисный) вариант

### Multi Tenant Architecture (MTA) - Single Instance

![MTA](https://docs.microsoft.com/ru-RU/azure/architecture/guide/multitenant/considerations/media/tenancy-models/fully-multitenant-deployments.png)

| + | - |
| - | - |
| Управляемость | Надежность |
| Стоимость | Производительность  |
| Функциональность | Безопасность |
| | Разработка |

### Single Tenant Architecture (STA) - Multi Instance

![STA](https://docs.microsoft.com/ru-RU/azure/architecture/guide/multitenant/considerations/media/tenancy-models/automated-single-tenant-deployments.png)

| + | - |
| - | - |
| Производительность | Стоимость |
| Надежность | Управляемость |
| Безопасность: изоляция данных для каждого клиента, что снижает риск случайной утечки. | |
| Функциональность |  |
| Разработка | |

### Гибридный вариант

Возможно стоит применять различные уровни изоляции на каждом уровне (слое) решения (GUI, Пользовательские сценарии, Бизнес логика, Хранилища, Инфраструктура)

- Вертикальное секционирование развертывания
![Вертикальное секционирование развертывания](https://docs.microsoft.com/ru-RU/azure/architecture/guide/multitenant/considerations/media/tenancy-models/vertically-partitioned-deployments.png)

| + | - |
| - | - |
| Производительность | Разработка |
| Функциональность | Стоимость |
||  |

- Горизонтально секционированные развертывания
![Горизонтально секционированные развертывания](https://docs.microsoft.com/ru-RU/azure/architecture/guide/multitenant/considerations/media/tenancy-models/horizontally-partitioned-deployments.png)

| + | - |
| - | - |
| Производительность | Разработка |
| Функциональность | Стоимость |
||  |

## To-do

- https://docs.microsoft.com/ru-ru/azure/architecture/guide/multitenant/related-resources
