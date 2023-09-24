# Отказоустойчивость Fault tolerance

- [Отказоустойчивость Fault tolerance](#отказоустойчивость-fault-tolerance)
  - [Зачем](#зачем)
  - [Факторы риска](#факторы-риска)
  - [Паттерны](#паттерны)
    - [Методы инфраструктуры, физической архитектуры](#методы-инфраструктуры-физической-архитектуры)
    - [Методы разработки](#методы-разработки)

## Зачем

Отказоустойчивость — это способность системы продолжать полноценно работать при выходе из строя отдельных компонентов — серверов или каналов связи, сбоев на уровне отдельных модулей системы и т.д.

- CAP теорема - концепции распределённости — расщепление распределённой системы на несколько изолированных секций не приводит к некорректности отклика от каждой из секций:
  - согласованность (consistency)
  - доступность (availability)
  - устойчивость к разделению (англ. partition tolerance)
  - Вы хотите консистентность или доступность в случае инцидента?

## Факторы риска

- Сбой электропитания
- Сбои Сервера, ос
- Ошибки софта
- Выход из строя канала интернет
- умышленное или случайное изменение данных в базе данных
- Ddos атаки
- [Некорректная обработка ошибок](https://blog.bytebytego.com/p/common-failure-causes)

## Паттерны

### Методы инфраструктуры, физической архитектуры

- исключение единой точки отказа — это либо решения с «горячей заменой»
- резервирование, [дублирование, кластеры, либо горизонтальное масштабирование](https://habr.com/ru/company/otus/blog/561630/).
- Прокси, файервол, капча
- [Балансировка](../pattern/load.balancing.md)
- [api management](../../api/api-managment.md)
- Установка лимитов запросов [rate limits](../pattern/rate.limit.md), тайм-аут
- Dev ops ci/cd:
  - [docker](../../technology/ci-cd/docker.md)
  - [kubernetes](../../technology/ci-cd/k8s.md)
  - [jenkins](../../technology/ci-cd/jenkins.md)
  - авто распределенный конфиг etcd
  - кеш [redis](../../technology/store/redis.md)
- системы мониторинга - аптайм доступность сервиса, выраженная в процентах
- ИБП, генератор электричества, охлаждение серверов
- DB: 
  - [репликации](../pattern/sync.data.md)
  - кластер
  - Горизонтальное [шардирование данных](../pattern/shard.db.md)
- [Распределенные файловые системы](../../technology/filesystem/dfs.md)
- Бэкапы, логи

### Методы разработки

[Design for failure](../pattern/pattern.failure.md)

- распределенная архитектура
  - Микросервисы: слабая связность, изоляция сбоев
  - stateless
- [модульный монолит](../style/monolit.modul.md)
- [Health check](../pattern/pattern.healthcheck.md)
- [CQRS](../pattern/pattern.cqrs.md) - command query request segregation
- Асинхронная обработка - [Брокер очереди](../pattern/pattern.messagebroker.md), воркеры, буферы входного потока данных
- Git, rollback
- [миграции бд](../pattern/migration.db.md)
- [graceful shutdown](../pattern/graceful.shutdown.md)
- Message Bus
  - [Паттерн Transactional outbox\Application events](https://microservices.io/patterns/data/transactional-outbox.html)
    - [example](https://itnext.io/the-outbox-pattern-in-event-driven-asp-net-core-microservice-architectures-10b8d9923885)
  - Паттерн [Transactional Inbox](https://softwaremill.com/microservices-101/)
    - [abp.io](https://docs.abp.io/en/abp/latest/Distributed-Event-Bus)
