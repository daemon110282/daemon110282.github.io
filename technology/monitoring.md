# Monitoring

Класс систем [Application Perfomance Monitoring (APM)](../arch/apm.md).

- Cloud SaaS [Commercial](https://geekflare.com/frontend-web-monitoring/)
	- New Relic
	- Loggly
	- Logentries
	- Sentry 	
	- Rollbar
	- DataDog
	- LogRocket
	- Airbrake
	- Raygun
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
		- [Sentry](https://geekflare.com/frontend-web-monitoring/)
			- [docker](https://develop.sentry.dev/self-hosted/)
				- [demo](https://gist.github.com/denji/b801f19d95b7d7910982c22bb1478f96)
				- [demo](https://adw0rd.com/2019/02/21/sentry-on-premise-docker/)
    		- Если мы [не конкурируем с ними](https://open.sentry.io/licensing/), то [бесплатно](https://forum.sentry.io/t/re-licensing-sentry-faq-discussion/8044)
		- [Альтернативы DataDog Crashlytics Rollbar](https://stackshare.io/sentry#alternatives)
			- [Gartner AppDynamics Splunk](https://www.gartner.com/reviews/market/application-performance-monitoring-and-observability/vendor/sentry/product/sentry/alternatives)
		
	- Commercial
		- PRTG
		- AppDynamics
	- Splunk

## Compare

- [datadog-vs-sentry](https://stackshare.io/stackups/datadog-vs-sentry)
