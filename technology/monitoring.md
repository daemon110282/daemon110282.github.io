# Monitoring

- [Monitoring](#monitoring)
	- [Мониторинг сайтов](#мониторинг-сайтов)
		- [Compare](#compare)
	- [Application Perfomance Monitoring (APM)](#application-perfomance-monitoring-apm)
		- [Compare](#compare-1)

## Мониторинг сайтов

- Cloud
  - Commercial
  - Free
	- Uptimerobot

### Compare

- https://vc.ru/u/1338008-smbot-monitoring-saytov/549289-obzor-i-sravnenie-servisov-monitoringa-saytov?
- https://blog.cybermarketing.ru/25-servisov-dlya-monitoringa-sajtov/
- https://unisender-com.turbopages.org/unisender.com/s/ru/blog/idei/servisy-dlya-monitoringa-sajtov/

## Application Perfomance Monitoring (APM)

Класс систем [Application Perfomance Monitoring (APM)](../arch/system.class/apm.md) обеспечивают контроль [производительности](../arch/pattern/pattern.perf.md).

- Cloud SaaS [Commercial](https://geekflare.com/frontend-web-monitoring/)
	- New Relic
	- Loggly
	- Logentries
	- Sentry 	
	- [Rollbar](https://rollbar.com/blog/error-tracking-with-vue-js/)
	- DataDog
	- LogRocket
	- Airbrake
	- [Sematext](https://sematext.com/blog/tracking-and-monitoring-spa-apps/)
	- [Raygun](https://raygun.com/blog/spa-performance/)
- On premise
	- Open Source
    	- [ELK](monitoring/elk.md)
    	- Loglevel + [loglevel-plugin-remote](https://www.loggly.com/blog/best-practices-for-client-side-logging-and-error-handling-in-react/)
        - [Zabbix](monitoring/zabbix.md)
		- Prometeus + Grafana
		![arch](https://prometheus.io/assets/architecture.png)
			- [Prometeus Client JS](https://github.com/weaveworks/promjs)
		- [ELK stack](monitoring/elk.md)		
	- BSL __license__
		- [Sentry](observability/sentry.md)
		- [Альтернативы DataDog Crashlytics Rollbar](https://stackshare.io/sentry#alternatives)
			- [Gartner AppDynamics Splunk](https://www.gartner.com/reviews/market/application-performance-monitoring-and-observability/vendor/sentry/product/sentry/alternatives)		
	- Commercial
		- PRTG
		- AppDynamics		
	- Splunk

Используют разные хранилища метрик (Time Series Database):
- [Prometheus](store/prometheus.md)
- InfluxDB
- [Victoria metrics](monitoring/victoriametrics.md)

### Compare

- [datadog-vs-sentry](https://stackshare.io/stackups/datadog-vs-sentry)

