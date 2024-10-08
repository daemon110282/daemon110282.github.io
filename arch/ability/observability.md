# Наблюдаемость Observability

- [Наблюдаемость Observability](#наблюдаемость-observability)
	- [Зачем](#зачем)
	- [Плюсы-минусы](#плюсы-минусы)
	- [Patterns](#patterns)
	- [Технологии](#технологии)
		- [Варианты решений](#варианты-решений)
		- [Data Collector](#data-collector)
		- [Time Series Database](#time-series-database)
	- [TODO](#todo)

## Зачем

- [Метрики Мониторинг](../../technology/observability/monitoring.md), статистика
- Агрегация логов [Logging](../../technology/observability/logging.md)
- Распределенная трассировка [Distributed Trace](../../technology/observability/tracing.distributed.md)
- [Обработка исключений](../pattern/observability/exception.handle.md)
- [Аудит](../pattern/observability/pattern.audit.md)
- [Health Check API](../pattern/observability/pattern.healthcheck.md)

Реализуется в концепции [OpenTelemetry (OTel)](../../technology/protocols.integration/otel.md), которая объединила OpenTracing + OpenCensus.

Характеристики:

- Последовательность
- Парсинг
- Транзакционность событий (логов)
- ИД событий
- Время событий

## Плюсы-минусы

Плюсы:

- [Ускорение разрешения инцидентов](https://habr.com/ru/amp/publications/727072/)
- Повышение __быстродействия__ системы
- Эффективное планирование ресурсопотребления
- Повышение эффективности разработки
- Более эффективное сотрудничество
- Повышение __надёжности__ системы

Минусы:

- Сложная архитектура ИС реализующих принципы наблюдаемости

## Patterns

- Простота расширения
- Корреляция данных
- Универсальные агенты Data Collector по протоколу OpenTelemetry
- Трансформация команд на принципах [Site Reliability Engineering (SRE)](../../devops/sre.md) four [golden signals](https://sre.google/sre-book/monitoring-distributed-systems/)
	- TODO

Reference Arch:

- [Integrating OpenTelemetry into the Modern Apps Reference Architecture NGINX](https://www.nginx.com/blog/integrating-opentelemetry-modern-apps-reference-architecture-progress-report?mkt_tok=NjUzLVNNQy03ODMAAAGDoZc8tBnTTPpd0LyW8jL4ptLEDNmRtqT86ruxAIy0w26Q36wbMRlF5KC3BMfg2BcRVqWCoPUW3J4gMfJLANmKejRzOQC80kmD2-ueYoqT-DoXcB1iUA)
- [RedHat](https://www.redhat.com/architect/hybrid-cloud-observability)
	![roadmap](https://www.redhat.com/architect/sites/default/files/styles/embed_large/public/2022-11/summaryofobservalitysolution.png?itok=Vihud-bJ)
	![plan](https://www.redhat.com/architect/sites/default/files/styles/embed_large/public/2022-11/observabilitysolution.insteps.png?itok=3c9lpFUb)

## Технологии

### Варианты решений

- Appdynamics
- Dynatrace
- Splunk
- [ElastickSearch Kibana](../../technology/observability/monitoring/elk.md)
- [GrayLog, ELK](../../technology/observability/logging.md)
- [Jaeger+ELK, Jaeger+ClickHouse, Zipkin](../../technology/observability/tracing.distributed.md)
- [Sentry](../../technology/observability/sentry.md)
- Promtail + Loki + Grafana
- fluentbit + Yandex Data Streams + Yandex Query (и бекап логов через Yandex Transfer в S3)

Compare:

- [ELK - Jaeger - OpenTelemetry](https://www.nginx.com/blog/integrating-opentelemetry-modern-apps-reference-architecture-progress-report?mkt_tok=NjUzLVNNQy03ODMAAAGDoZc8tBnTTPpd0LyW8jL4ptLEDNmRtqT86ruxAIy0w26Q36wbMRlF5KC3BMfg2BcRVqWCoPUW3J4gMfJLANmKejRzOQC80kmD2-ueYoqT-DoXcB1iUA)
- [GrayLog - ELK - Grfana Loki - Monq](https://habr.com/ru/post/594805/)

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
- [Prometeus](../../technology/store/prometheus.md)
- [Victoria metrics](../../technology/store/victoriametrics.md)

## TODO

Мы допустили все [ошибки](https://habr.com/ru/company/sbermegamarket/blog/696844/#comment_24875276) какие могли:

- Сразу не настроили отправку метрики с Promtail и Loki в prometheus, чтобы сразу увидеть, где проблема
- Не настроили сразу кеширование, лимиты и чанки
- Выбрали обычные ssd вместо не реплицируемых (нужна была макс скорость)
- Перегнули с количеством лейблов
- Не использовали драйвер Loki для контейнеров
- Сразу не угадали с количество реплик всех частей
