# Monitoring

- [Monitoring](#monitoring)
  - [Зачем](#зачем)
  - [Плюсы и минусы](#плюсы-и-минусы)
  - [Методики выбора метрик](#методики-выбора-метрик)
    - [Агрегации значений метрик](#агрегации-значений-метрик)
  - [Мониторинг БД](#мониторинг-бд)
  - [Мониторинг сайтов](#мониторинг-сайтов)
  - [Application Perfomance Monitoring (APM)](#application-perfomance-monitoring-apm)

## Зачем

Мониторинг - Сбор, обработка, агрегирование и отображение метрик ИС в реальном времени.

- При проектировании в архитектуру закладываются измерители, генерирующие информацию для системы мониторинга
  - [Производительности](../../arch/ability/performance.metric.md)
  - [Стабильности Надежности](../../arch/ability/resilience.metric.md)
- Key Quality Indicators продукта
  - Необходимы для возможности мониторинга качества предоставления продукта дежурной сменой Service Desk
  - Описывает непосредственно счетчики, используемые в качестве KPI
    - источники получения соответствующих счетчиков
    - периодичность съёма данных
    - формат
    - интерфейсы предоставления информации
    - пороговые значения для алармов и их получателей
    - время и место хранения статистики
- Real-user monitoring (RUM)
- [Application Perfomance Monitoring (APM)](../../arch/system.class/apm.md)
- Сравнение разный версий приложений
- Ретроспективный анализ
- Прогнозирование ресурсов под метрики

Подходы:

- Whitebox - метрики внутри ИС
- Blackbox - метрики "снаружи" (пользовательские) ИС

## Плюсы и минусы

Минусы:

- Стоит денег
- Требует поддержки
- Ложные срабатывания

## Методики выбора метрик

- USE - [Utilization - утилизация ресурсов важных для ИС, Saturation - размер очереди, Errors](https://habr.com/ru/companies/okmeter/articles/420429/)
  - Мониторинг ресурсов (System Metrics)
- RED - Request (Rate), Error, Duration (Latency)
  - Мониторинг нагрузки на сервисы (Service Metrics)
- Google [SRE](../../devops/sre.md) [4 Golden signals](https://sre.google/sre-book/monitoring-distributed-systems/)
  - [TODO](https://habr.com/ru/companies/southbridge/articles/525176/)
  - [Latency](https://habr.com/ru/companies/flant/articles/462503/)
    - is the amount of time between when a user sends a request and when the service responds. Lower latencies are better, since this indicates that users are being served faster.
  - __Traffic__
    - is the amount of demand the service is handling. This is often measured in HTTP requests per second, connections per second, or bandwidth usage. We can also use metrics specific to our service, such as transactions processed per minute.
  - __Errors__
    - is the rate of requests that failed. The criteria for a failure depends on the service, but the most common is when a service responds to a request with an HTTP 5XX error code.
  - __Saturation__
    - is the amount of resources your service is consuming out of all the resources available to it. Remember that your containers may only have a limited amount of resources allocated to them. High saturation indicates that you might need to scale up your service by increasing your container resource limits, adding additional container replicas, or increasing the capacity of your servers.
- [Web Vitals](https://web.dev/i18n/en/vitals/)
  - Мониторинг производительности клиентских веб приложений (Client Metrics)

### Агрегации значений метрик

- Среднее арифмитическое значение
  - нельзя просто так брать среднее чего-то на неопределённом интервале и при этом не потерять ничего
- __Медиана__ – это «средний элемент», то есть [буквально в середине массива (если его упорядочить)](https://habr.com/ru/companies/tochka/articles/690814/). У медианы есть такая особенность: половина элементов массива больше либо равна ей, а другая половина элементов — меньше либо равна.
- __Перcентиль__ (Перцентиль Процентиль) - [способ сжать историю наблюдений до одного числа](https://habr.com/ru/companies/tochka/articles/685636/), при этом по пути потерять неудобные для нас данные, чтобы не мешали смотреть на общую картину.
  - 95-й перcентиль — это такое число, что 95% элементов массива меньше или равны этому числу.
    - удобно использовать эту штуку, чтобы описать __большинство элементов массива, при чем степень точности регулируется__: 80%, 95%, 99%, 99.9%, Для чего бывает полезно описывать «большинство из массива»? Чтобы выбросить пики!
  - 95 перcентиль от времени обработки запросов = 5 секунд
    - То есть, большинство (95%) запросов мы обработали за 5 секунд или меньше. А остальные 5% обрабатывались дольше.
    - Можно еще посчитать 99-й Персентиль и сравнить с 95-м, тогда станет понятно, что большинство запросов укладываются в 5 секунд, а подавляющее большинство, скажем, в 6 секунд.
  - [Синонимы](https://habr.com/ru/companies/tochka/articles/690814/)
    - __Квартиль__ это четверти: 25%, 50%, 75%, 100%. То есть бывает первый, второй третий и четвертый квартиль. И еще иногда используют нулевой.
    - __Квантиль__ - это, условно, Персентиль без процентов. Используется в статистике, где бывает удобно указывать абсолютную вероятность, а не в процентах
    - __Дециль__ — это 10%, 20% и т.д.
- __Кардинальность__
- min, max
- __Сэмплирование__ [данных метрик](https://habr.com/ru/companies/dins/articles/490430/) определяет кол-во значений для агрегирования с учетом интервала времени (глубина запроса)

## Мониторинг БД

- [MSSQL](../db/mssql/mssql.md#способы-анализа-производительности)
- PGSQL, MySQL, MongoDB
  - [Percona Monitoring and Management](https://github.com/percona/pmm) PMM

## Мониторинг сайтов

- Cloud
  - Commercial
  - Free
	- Uptimerobot

Compare:

- https://vc.ru/u/1338008-smbot-monitoring-saytov/549289-obzor-i-sravnenie-servisov-monitoringa-saytov?
- https://blog.cybermarketing.ru/25-servisov-dlya-monitoringa-sajtov/
- https://unisender-com.turbopages.org/unisender.com/s/ru/blog/idei/servisy-dlya-monitoringa-sajtov/

## Application Perfomance Monitoring (APM)

Класс систем [Application Perfomance Monitoring (APM)](../../arch/system.class/apm.md) обеспечивают контроль [производительности](../../arch/pattern/performance/pattern.perf.md).

- Cloud SaaS [Commercial](https://geekflare.com/frontend-web-monitoring/)
	- New Relic
	- Loggly
	- Logentries
	- [Sentry](sentry.md)
	- [Rollbar](https://rollbar.com/blog/error-tracking-with-vue-js/)
	- DataDog
	- [LogRocket](logrocket.md)
	- Airbrake
	- [Sematext](https://sematext.com/blog/tracking-and-monitoring-spa-apps/)
	- [Raygun](https://raygun.com/blog/spa-performance/)
- On premise
	- Open Source
    	- [ELK](monitoring/elk.md)
    	- Loglevel + [loglevel-plugin-remote](https://www.loggly.com/blog/best-practices-for-client-side-logging-and-error-handling-in-react/)
        - [Zabbix](monitoring/zabbix.md)
		- [Prometeus](../store/prometheus.md) + Grafana
		- [ELK stack](monitoring/elk.md)		
	- BSL __license__
		- [Sentry](sentry.md)
		- [Альтернативы DataDog Crashlytics Rollbar](https://stackshare.io/sentry#alternatives)
			- [Gartner AppDynamics Splunk](https://www.gartner.com/reviews/market/application-performance-monitoring-and-observability/vendor/sentry/product/sentry/alternatives)		
	- Commercial
		- PRTG
		- AppDynamics		
	- Splunk

Используют разные хранилища метрик (Time Series Database):

- [Prometheus](../store/prometheus.md)
- InfluxDB
- [Victoria metrics](../store/victoriametrics.md)

Compare:

- [datadog-vs-sentry](https://stackshare.io/stackups/datadog-vs-sentry)
