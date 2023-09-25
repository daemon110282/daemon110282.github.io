# Доступность Availability (high availability)

Для обеспечения [Надежности ИС](../../devops/sre.md).

## Паттерны

- Ограничение ресурсов ИС [throttling](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/throttling)
- [TODO](https://photos.app.goo.gl/VaUseEzeFcvSJj6U9)
- отказоустойчивость и масштабирование MariaDB и RabbitMQ в основе лежит разделение баз и брокеров по сервисам.
- Избегайте состояния (stateless) в вашем приложении
- [Балансировка](../pattern/load.balancing.md)
- Big data
  - [MapReduce, gfs, hadoop, clickhouse, splunk, vertica, netapp](http://habrahabr.ru/post/272041/)
