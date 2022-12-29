# Наблюдаемость Observability

- [Наблюдаемость Observability](#наблюдаемость-observability)
	- [Patterns](#patterns)
	- [Технологии](#технологии)
		- [Варианты решений](#варианты-решений)
		- [Data Collector](#data-collector)
		- [Time Series Database](#time-series-database)
	- [TODO](#todo)

Концепция [OpenTelemetry (OTel)](../../technology/protocols.integration/otel.md) объединила OpenTracing + OpenCensus:

- [Метрики Мониторинг](../../technology/monitoring.md), статистика
	- При проектировании в архитектуру закладываются измерители, генерирующие информацию для системы мониторинга
	- Key Quality Indicators продукта. Необходимы для возможности мониторинга качества предоставления продукта дежурной сменой Service Desk и ДКК. Данный раздел описывает непосредственно счетчики, используемые в качестве KPI, источники получения соответствующих счетчиков, периодичность съёма данных формат и интерфейсы предоставления информации, пороговые значения для алармов и их получателей. Время и место хранения статистики.
	- Real-user monitoring (RUM)
	- [Application Perfomance Monitoring (APM)](../system.class/apm.md).
- [Logging](../../technology/logging.md)
- [Trace](../../technology/tracing.distributed.md)

Характеристики:

- Последовательность
- Парсинг
- Транзакционность событий (логов)
- ИД событий
- Время событий

## Patterns

- Простота расширения
- Корреляция данных
- Универсальные агенты Data Collector по протоколу OpenTelemetry
- Трансформация команд на принципах Site Reliability Engineering (SRE) four [golden signals](https://sre.google/sre-book/monitoring-distributed-systems/)
	- TODO

Reference Arch:

- [Integrating OpenTelemetry into the Modern Apps Reference Architecture NGINX](https://www.nginx.com/blog/integrating-opentelemetry-modern-apps-reference-architecture-progress-report?mkt_tok=NjUzLVNNQy03ODMAAAGDoZc8tBnTTPpd0LyW8jL4ptLEDNmRtqT86ruxAIy0w26Q36wbMRlF5KC3BMfg2BcRVqWCoPUW3J4gMfJLANmKejRzOQC80kmD2-ueYoqT-DoXcB1iUA)
- [RedHat](https://www.redhat.com/architect/hybrid-cloud-observability)
	![roadmap](https://www.redhat.com/architect/sites/default/files/styles/embed_large/public/2022-11/summaryofobservalitysolution.png?itok=Vihud-bJ)
	![plan](https://www.redhat.com/architect/sites/default/files/styles/embed_large/public/2022-11/observabilitysolution.insteps.png?itok=3c9lpFUb)

## Технологии

Compare:

- [ELK - Jaeger - OpenTelemetry](https://www.nginx.com/blog/integrating-opentelemetry-modern-apps-reference-architecture-progress-report?mkt_tok=NjUzLVNNQy03ODMAAAGDoZc8tBnTTPpd0LyW8jL4ptLEDNmRtqT86ruxAIy0w26Q36wbMRlF5KC3BMfg2BcRVqWCoPUW3J4gMfJLANmKejRzOQC80kmD2-ueYoqT-DoXcB1iUA)
- [GrayLog - ELK - Grfana Loki - Monq](https://habr.com/ru/post/594805/)

### Варианты решений

- Appdynamics
- Dynatrace
- Splunk
- [ElastickSearch Kibana](../../technology/monitoring/elk.md)
- [GrayLog, ELK](../../technology/logging.md)
- [Jaeger+ELK, Jaeger+ClickHouse, Zipkin](../../technology/tracing.distributed.md)
- [Sentry](../../technology/observability/sentry.md)
- Promtail + Loki + Grafana	
- fluentbit + Yandex Data Streams + Yandex Query (и бекап логов через Yandex Transfer в S3)

### Data Collector

__Основная проблема: потеря логов__ при больших объемах и интенсивности.

1. [Vector](https://vector.dev/) v.0.26 beta
2. Fluentbit
3. [FluentD плохой опыт СберМегаМаркет с ElasticSearch v.7](https://habr.com/ru/company/sbermegamarket/blog/696844/)
	- многие плагины FluentD просто не умеют работать с воркерами, используя по дефолту только один
4. Filebeat
5. LogStash
6. GrayLog GELF

TODO:

- FluentD лучше LogStash?
- Fluentbit лучше FluentD?
	- [Не всегда, опыт СберМегаМаркет](https://habr.com/ru/company/sbermegamarket/blog/696844/)
- Vector лучше Fluentbit?
	- [Да, опыт СберМегаМаркет](https://habr.com/ru/company/sbermegamarket/blog/696844/) справляется с текущими объемами данных порядка __7 терабайт в сутки__ и количеством сообщений около __240 000 в секунду__
		- ![img](https://habrastorage.org/r/w1560/getpro/habr/upload_files/770/8d7/241/7708d72418f567bfadab0e381fc8c462.png)
- Filebeat?

### Time Series Database

- InfluxDB
- Prometeus
- [Victoria metrics](../../technology/monitoring/victoriametrics.md)


## TODO

Мы допустили все [ошибки](https://habr.com/ru/company/sbermegamarket/blog/696844/#comment_24875276) какие могли:
- Сразу не настроили отправку метрики с Promtail и Loki в prometheus, чтобы сразу увидеть, где проблема
- Не настроили сразу кеширование, лимиты и чанки
- Выбрали обычные ssd вместо не реплицируемых (нужна была макс скорость)
- Перегнули с количеством лейблов
- Не использовали драйвер Loki для контейнеров
- Сразу не угадали с количество реплик всех частей