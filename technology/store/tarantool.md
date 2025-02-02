# Tarantool

## Зачем

Технология для

- [хранилищ данных](../../arch/system.class/store.md) в __высоконагруженных__ проектах
  - [SQL OLTP ACID](https://www.tarantool.io/ru/)
  - NoSQL __Graph__ [store](../store.nosql.md#graph-database) решение
- [Консистентный персистентный](https://www.tarantool.io/ru/patterns/) [кэш](../../arch/pattern/performance/pattern.cache.md) БД
- [Брокера очередей](../../arch/pattern/integration/pattern.messagebroker.md)
- Репликация данных из Oracle или MySQL

[Критерии выбора](../../arch/system.class/store.md#критерии-выбора).

[UC](https://www.tarantool.io/ru/cases/):

- in-memory базы данных для кеширования
  - [Citilink](https://www.tarantool.io/ru/cases/citilink/) замена кэша (проблемы инвалидации с ростом кеша) на in-memory БД
- [Сервис аутентификации](https://habr.com/ru/companies/vk/articles/321998/)
- Профиль клиента
- Очередь
- [Real Time Marketing](https://www.tarantool.io/blog/ru/realtimemarketing/)

## Функции

- Хранилище
  - Репликация (асинхронной, синхронной), master-master
- Очереди
  - персистентны
  - шардирование
  - гарантии «At-least-once»
- Сервер приложений
  - http.server
  - [REST API](https://habr.com/ru/companies/vk/articles/321998/)
- отдельное решение Tarantool [Graph DB NoSQL store](https://www.tarantool.io/ru/graph-db/) на базе коммерческой Enterprise Version

## Плюсы и минусы

Плюсы:

- есть WAL (write-ahead log) и данные на диске и в памяти всегда синхронизированы
  - Задержка асинхронной репликации составляет __не более 1 миллисекунды__
- [Cloud](https://cloud.vk.com/databases/tarantool/) \ On premise
- OpenSource \ License
- Высокая доступность
- Произодительность

Минусы:

## Deployment

- Install
  - [Docker compose](https://habr.com/ru/companies/vk/articles/321998/)
- Test data
  - [.net](https://habr.com/ru/companies/vk/articles/321998/)
  - [get started](https://habr.com/ru/companies/first/articles/596301/)
- Benchmark
  - Apache Bench [50k запросов 500 concurent 3400 RPS](https://habr.com/ru/companies/first/articles/596301/) 2CPU 4Gb
