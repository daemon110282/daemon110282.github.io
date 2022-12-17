# Monitoring 

Класс систем Application Perfomance Monitoring (APM).

Функции:

- Агенты сбора метрик
- Distributed Tracing
- Дашборды
- Алерты
- Real User Monitoring (RUM)

SPA:
- JavaScript errors
- Framework-specific issues
- Network request failure
- Performance issues
- User experience problems
- Варианты
	- Open Source
		- [Sentry](https://geekflare.com/frontend-web-monitoring/) __license?__
		- ELK + [Vue.JS APM client](https://www.elastic.co/guide/en/apm/agent/rum-js/master/vue-integration.html)
		- Loglevel +  loglevel-plugin-remote (https://www.loggly.com/blog/best-practices-for-client-side-logging-and-error-handling-in-react/)
	- [Commercial](https://geekflare.com/frontend-web-monitoring/)
		- LogRocket 
		- Airbrake
		- Raygun

## Pattern

- [RED method for MSA](https://thenewstack.io/monitoring-microservices-red-method/)
Rate (R): The number of requests per second.
Errors (E): The number of failed requests.
Duration (D): The amount of time to process a request.
- [Автотесты UI в ПРОДе](https://nedmcclain.medium.com/frontend-monitoring-with-prometheus-38f798406125) и экспорт в Prometheus результатов

## Technology

- Cloud SaaS
	- New Relic
	- Loggly 
	- Logentries
	- Sentry 	
	- Rollbar 
	- DataDog
- On premise
	- Open Source
		- [Zabbix](monitoring/zabbix.md)
		- Prometeus + Grafana
		![arch](https://prometheus.io/assets/architecture.png)
			- [Prometeus Client JS](https://github.com/weaveworks/promjs)
		- [ELK stack](monitoring/elk.md)
	- BSL
		- Sentry
			- [docker](https://develop.sentry.dev/self-hosted/)
				- https://gist.github.com/denji/b801f19d95b7d7910982c22bb1478f96
				- https://adw0rd.com/2019/02/21/sentry-on-premise-docker/
		- [Альтернативы DataDog Crashlytics Rollbar](https://stackshare.io/sentry#alternatives)
			- [gartner AppDynamics Splunk](https://www.gartner.com/reviews/market/application-performance-monitoring-and-observability/vendor/sentry/product/sentry/alternatives)
		- Если мы не конкурируем с ними, то бесплатно
			- https://open.sentry.io/licensing/
			- https://forum.sentry.io/t/re-licensing-sentry-faq-discussion/8044
	- Commercial
		- PRTG
		- AppDynamics	
	- Splunk

## Compare

- [datadog-vs-sentry](https://stackshare.io/stackups/datadog-vs-sentry)
