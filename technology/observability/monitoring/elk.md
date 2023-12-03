# ELK

- [ELK](#elk)
	- [Зачем](#зачем)
		- [Плюсы-Минусы](#плюсы-минусы)
	- [Aplication Performance Monitoring (APM)](#aplication-performance-monitoring-apm)
	- [Kibana](#kibana)
	- [Deployment](#deployment)

![arch](https://dytvr9ot2sszz.cloudfront.net/wp-content/uploads/2021/04/Group-1207.jpg)

[ELK](https://gitinsky.com/elkstack) стек:

- Beats — a family of log shippers for different use cases containing
  - Filebeat
  - Metricbeat
  - Packetbeat
  - Auditbeat
  - Heartbeat
  - Winlogbeat
- Logstash
	- конвейер по парсингу данных (логов событий) 
	- Input-[Filter](https://logz.io/blog/5-logstash-filter-plugins/)-Output трансформация данных
- [Elasticsearch](../store/elasticsearch.md)
- Kibana
	- GUI, dashboards, charts
	- Logs
	- Visualization

## Зачем

- [Observability](../../arch/ability/observability.md)
  - Service Map
- [APM](../../arch/system.class/apm.md)
	- RUM - Unlike Elastic APM backend agents which monitor requests and responses, the RUM JavaScript agent __monitors the real user experience and interaction within your client-side application__. The RUM JavaScript agent is also framework-agnostic, which means it can be used with any front-end JavaScript application.
- [Security and compliance](https://logz.io/learn/complete-guide-elk-stack/?utm_source=pocket_saves#common-pitfalls:~:text=guide%40logz.io-,Use%20Cases,-The%20ELK%20Stack)
	- SIEM
- BI
- SEO

### Плюсы-Минусы

Плюсы:

- Полнотекстовый поиск
- [APM support](https://www.elastic.co/guide/en/apm/guide/current/open-telemetry.html) [Open Telemetry](../protocols.integration/otel.md)

Минусы:

- в Elasticsearch [нет встроенной системы авторизации и управления правами доступа](https://gitinsky.com/elkstack), что может привести к проблемам с ИБ
- [масштабирование может оказаться затратным](https://habr.com/ru/company/sbermegamarket/blog/696844/)
- JVM стек потребляет много ресурсов CPU и RAM
- Требуется много места для хранения
- установка и запуск стека ELK — далеко не простой процесс

## Aplication Performance Monitoring (APM)

JS Client

Real User Monitoring (RUM):

- Под фреймворки агенты [React, Angular, Vue.js](https://www.elastic.co/guide/en/apm/agent/rum-js/master/framework-integrations.html)
- [Vue.JS APM client](https://www.elastic.co/guide/en/apm/agent/rum-js/master/vue-integration.html)
- На вход может принимать из [opentracing](https://www.elastic.co/guide/en/apm/agent/rum-js/master/opentracing.html)

## Kibana

- GUI, dashboards, ![charts](https://dytvr9ot2sszz.cloudfront.net/wp-content/uploads/2021/04/fourth-elk-guide-edited.jpg)
- Logs
- ![Visualization](https://dytvr9ot2sszz.cloudfront.net/wp-content/uploads/2021/04/image15-edited.png)
- [Adapter ClickHouse Data Store](https://habr.com/ru/post/581586/)
	![schema](https://habrastorage.org/r/w1560/webt/dq/p0/mu/dqp0mujy3u-arpwischsswnvbow.jpeg)

## Deployment

- [CPU RAM](https://gitinsky.com/elkstack?utm_source=pocket_saves#:~:text=%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5%20%D1%82%D1%80%D0%B5%D0%B1%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)
- [docker](https://logz.io/blog/elk-stack-on-docker/)