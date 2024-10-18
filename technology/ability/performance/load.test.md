# Нагрузочное тестирование (Load testing)

## Зачем

Снизить риски (репутационные, спад продаж) по производительности, стабильности, доступности, масштабируемости при росте нагрузки на сервис.

Виды:

- Производительности
- Стрессовое
- Объемное тестирование
- Стабильность и надежность
- На масштабируемость

## План

[Plan](https://serverfault.com/a/350463):

- Put your scenario in place
  - Конфигурация ПК клиента, серверов
- Add [monitoring (APM)](../../observability/monitoring.md)
- Add traffic
- Evaluate results
- Remediate based on results
	- Локализация узких мест [Troubleshooting](../../troubleshooting.md)
- Rinse, repeat until reasonably happy

## Trafic

- JMeter, Locust [Trend](https://trends.google.ru/trends/explore?date=today%205-y&q=jmeter,locust,gatling,loadrunner&hl=ru)
- JMeter (Web, LDAP)
	- [postman2jmeter](https://hatchjs.com/jmeter-import-postman-collection/)
	- [api postman jmeter test plan](https://www.postman.com/postman/workspace/postman-public-workspace/documentation/12959542-805366ba-5684-44d1-b75c-f47885c3c87a)
- Grinder (Web)
- httperf (Web)
- WCAT (Web)
- Visual Studio Load Test (Web)
- SQLIO (SQL Server)
- Locust
	[vs JMeter](https://www.blazemeter.com/blog/jmeter-vs-locust)
- Postman (Web)
- k6.io (websocket просто)

TODO

- yandex tank
- gatling

## Becnhmark Tools

- Apache Benchmark (Web)
