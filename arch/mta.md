# Multi Tenant Architecture

- [Multi Tenant Architecture](#multi-tenant-architecture)
	- [Зачем](#зачем)
	- [Плюсы минусы](#плюсы-минусы)
		- [Multi Tenant Architecture (MTA) - Single Instance](#multi-tenant-architecture-mta---single-instance)
		- [Single Tenant Architecture (STA) - Multi Instance](#single-tenant-architecture-sta---multi-instance)
		- [Гибридный вариант](#гибридный-вариант)
	- [Паттерны](#паттерны)
		- [RMQ multi-tenancy](#rmq-multi-tenancy)
			- [By Virtual host (VH)](#by-virtual-host-vh)
			- [By topic](#by-topic)
		- [database multi-tenancy](#database-multi-tenancy)
			- [multi-database tenancy](#multi-database-tenancy)
			- [Single-database tenancy](#single-database-tenancy)
		- [Kubernetes multi-tenancy](#kubernetes-multi-tenancy)
	- [Links](#links)

## Зачем

[Схемы](https://docs.google.com/document/d/1adNn0l5iUZFGiqMzqjup6f-DtkBPP4pnbDjRsP8M70E/edit?usp=sharing)
[Схемы](../img/)

## Плюсы минусы

[Критерии](arch.criteria.md)

- Безопасность
- Стоимость эксплуатации (TCO)
- Производительность
- Надежность
- Функциональность - Скорость реагирования на потребности отдельных клиентов
- Управляемость - сопровождение
- Разработка

Риски:

- [Шумные соседи](https://docs.microsoft.com/ru-RU/azure/architecture/antipatterns/noisy-neighbor/noisy-neighbor)
  - Производительность
  - Надежность
  - Безопасность
- Сложность разработки

Варианты:

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

## Паттерны

- [Модели MTA](https://docs.microsoft.com/ru-ru/azure/architecture/guide/multitenant/considerations/tenancy-models)
  - Если вы ожидаете, что ваш **бизнес будет масштабироваться до большого количества клиентов**, очень важно развернуть *общую инфраструктуру*.
  - Если требования к **изоляции клиентов являются высокими**, может потребоваться **инфраструктура с одним клиентом и отдельными инстансами (экземплярами решения)**.
  - ![Уровни изоляции](https://docs.microsoft.com/ru-RU/azure/architecture/guide/multitenant/considerations/media/tenancy-models/isolated-shared.png)

### RMQ multi-tenancy

#### By Virtual host (VH)

- auth, разграничение доступа к данным
- масштабирование по юл,
- Export import config VH
- Http api создание, управление VH
- Минусы:
  - изменения очередей и тп как накатывать на все ЮЛ?
  - Config alter есть? Policy, генерация из кода

#### By topic

- topic pattern and Routing/binding key per customer is better than vhost due to resource consumption overhead (for us rabbitmq console is internal/not exposed to customers).
- direct, topic, headers and fanout

TODO

- Exchange to exchange binding

### database multi-tenancy

- На уровне субд экземпляр бд
- Экземпляр instance субд, на одном ПК несколько может быть

#### multi-database tenancy

- one database per tenant - database based isolation
- one schema per tenant - table based isolation
- shared table with PK tenant (рекомендуется, большая гибкость в секционировании горизонтальном при необходимости) - row based isolation
  - CITUS 
  
#### Single-database tenancy

- Single-database tenancy comes with lower devops complexity, but larger code complexity than multi-database tenancy, since you have to scope things manually, and won't be able to integrate some third-party packages.
- It is preferable when you have too many shared resources between tenants, and don't want to make too many cross-database queries.

### Kubernetes multi-tenancy

- Два подхода:
	- Soft Multi-tenancy
	- Hard multi-tenancy assumes tenants to be malicious and therefore advocates zero trust between them. Tenant resources are isolated and access to other tenant’s resources is not allowed.
- Namespace isolation
- Block traffic between namespaces - Network Policy
- Resource Quotas
- Cluster->x nodes->x pods in node->x контейнер docker
- making sure that your master and worker nodes are secure at the level of the host operating system.

## Links

- https://docs.microsoft.com/ru-ru/azure/architecture/guide/multitenant/overview
