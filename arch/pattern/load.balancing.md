# Балансировка

- stateless ИС
- [Идемпотентность](../arch/pattern/idempotent.md)
- отказоустойчивость и масштабирование MariaDB и RabbitMQ в основе лежит разделение баз и брокеров по сервисам.
- [отказоустойчивость самого балансировщика](https://habr.com/ru/company/mailru/blog/474180/). Просто установка балансировщика тоже создаёт точку отказа: балансировщик ломается — сервис падает. Чтобы так не получалось, мы использовали HAProxy совместно с ExaBGP.
  - Балансировка HAProxy на базе DNS + BGP
  - Доступность haproxy: heartbeat между ExaBGP и HAProxy
  - синхронизировать сессии. При работе через распределенные балансировщики сложно организовать сохранение информации о сессиях клиентов. Но HAProxy — один из немногих балансировщиков, который умеет это за счёт функционала Peers — возможности передачи между различными процессами HAProxy таблицы сессий.
- Избегайте состояния (state) в вашем приложении
- [rate-limiting](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/rate-limiting-pattern)
- [Алгоритмы](https://blog.bytebytego.com/i/103707419/what-are-the-common-load-balancing-algorithms)

## Технологии

[Netscaler, HAProxy, Nginx..](../../technology/loadbalancer.md)