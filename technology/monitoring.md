# Monitoring

## Pattern

- RED method for MSA https://thenewstack.io/monitoring-microservices-red-method/?utm_source=pocket_mylist

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
		- [Zabbix](zabbix.md)
		- Prometeus
		- Grafana
	- BSL
		- Sentry
		- [docker](https://develop.sentry.dev/self-hosted/)
			- https://gist.github.com/denji/b801f19d95b7d7910982c22bb1478f96
			- https://adw0rd.com/2019/02/21/sentry-on-premise-docker/
		- [альтернативы DataDog Crashlytics Rollbar](https://stackshare.io/sentry#alternatives)
			- [gartner AppDynamics Splunk](https://www.gartner.com/reviews/market/application-performance-monitoring-and-observability/vendor/sentry/product/sentry/alternatives)
		- если мы не конкурируем с ними, то бесплатно
			- https://open.sentry.io/licensing/
			- https://forum.sentry.io/t/re-licensing-sentry-faq-discussion/8044
	- Commercial
		- PRTG
		- AppDynamics	
	- Splunk

Compare
	- [datadog-vs-sentry](https://stackshare.io/stackups/datadog-vs-sentry)