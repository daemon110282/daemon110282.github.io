# Hangfire

## Зачем

Реализация паттерна [Background Job](../../../arch/pattern/development/background.job.md).

Функции:

- [Fire-and-Forget Jobs](https://www.hangfire.io/)
- Delayed Jobs
- Continuations
- [Dashboard](https://www.youtube.com/watch?v=iilRdmNILC8&ab_channel=codaza)

## Плюсы и минусы

Минусы:

- Multiple Redis endpoints are only supported in __Redis Cluster configuration starting from Hangfire.Pro.Redis__ 2.1.0. You can’t use multiple detached masters or Redis Sentinel configurations.