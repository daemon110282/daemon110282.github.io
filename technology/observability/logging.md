# Логирование

Фреймворки для логирования:

- [Google Trend NLog log4net serilog (в топе)](https://trends.google.ru/trends/explore?date=2013-01-01%202021-01-04&q=%2Fg%2F12226rbp,log4net,serilog)
- [serilog](./logging/serilog.md)

Системы просмотра логов:

- On premise
	- [GrayLog](logging/graylog.md)
	- [ELK stack](monitoring/elk.md)
- Cloud SaaS
	- [Logrocket](../observability/logrocket.md)
	- Rollbar
	- [Errbit SaaS (Loggly, New Relic)](https://www.sitepoint.com/logging-errors-client-side-apps/)

Php

- Стандартное логирование запросов (nginx, apache, php-fpm)
- Логирование медленных запросов БД (опция в mysql)
- Инструменты фиксации узких мест при прохождении запроса. Для php это xhprof, pinba.
- Встроенные инструменты внутри веб-приложения, например отдельный модуль трассировки.
