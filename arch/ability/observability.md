# Наблюдаемость Observability

Концепция OpenTelemetry (OTel) объединил OpenTracing + OpenCensus:

- [Метрики Мониторинг](../../technology/monitoring.md), статистика
	- При проектировании в архитектуру закладываются измерители, генерирующие информацию для системы мониторинга
	- Key Quality Indicators продукта. Необходимы для возможности мониторинга качества предоставления продукта дежурной сменой Service Desk и ДКК. Данный раздел описывает непосредственно счетчики, используемые в качестве KPI, источники получения соответствующих счетчиков, периодичность съёма данных формат и интерфейсы предоставления информации, пороговые значения для алармов и их получателей. Время и место хранения статистики.
- [Logging](../../technology/logging.md)
- [Trace](../../technology/tracing.distributed.md)

Характеристики:

- Последовательность
- Парсинг
- Транзакционность событий (логов)
- ИД событий
- Время событий

Reference Arch:

- [Integrating OpenTelemetry into the Modern Apps Reference Architecture NGINX](https://www.nginx.com/blog/integrating-opentelemetry-modern-apps-reference-architecture-progress-report?mkt_tok=NjUzLVNNQy03ODMAAAGDoZc8tBnTTPpd0LyW8jL4ptLEDNmRtqT86ruxAIy0w26Q36wbMRlF5KC3BMfg2BcRVqWCoPUW3J4gMfJLANmKejRzOQC80kmD2-ueYoqT-DoXcB1iUA)

## Технологии

[Compare](https://www.nginx.com/blog/integrating-opentelemetry-modern-apps-reference-architecture-progress-report?mkt_tok=NjUzLVNNQy03ODMAAAGDoZc8tBnTTPpd0LyW8jL4ptLEDNmRtqT86ruxAIy0w26Q36wbMRlF5KC3BMfg2BcRVqWCoPUW3J4gMfJLANmKejRzOQC80kmD2-ueYoqT-DoXcB1iUA)

### Варианты решений

- Appdynamics
- Dynatrace
- Splunk
- [ElastickSearch Kibana](../../technology/monitoring/elk.md)
- [GrayLog, ELK](../../technology/logging.md)
- [Jaeger+ELK, Jaeger+ClickHouse, Zipkin](../../technology/tracing.distributed.md)
- Promtail + Loki + Grafana	
- fluentbit + Yandex Data Streams + Yandex Query (и бекап логов через Yandex Transfer в S3)

### Data Collector

__Основная проблема: потеря логов__ при больших объемах и интенсивности.

- LogStash
- Fluentbit
- GrayLog GELF
- [FluentD плохой опыт СберМегаМаркет с ElasticSearch v.7](https://habr.com/ru/company/sbermegamarket/blog/696844/)
	- многие плагины FluentD просто не умеют работать с воркерами, используя по дефолту только один
- [Vector](https://vector.dev/) v.0.26 beta

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
- [Victoria metrics](https://victoriametrics.com/)


## TODO

Мы допустили все [ошибки](https://habr.com/ru/company/sbermegamarket/blog/696844/#comment_24875276) какие могли:
Сразу не настроили отправку метрики с Promtail и Loki в prometheus, чтобы сразу увидеть, где проблема
Не настроили сразу кеширование, лимиты и чанки
Выбрали обычные ssd вместо не реплицируемых (нужна была макс скорость)
Перегнули с количеством лейблов
Не использовали драйвер Loki для контейнеров
Сразу не угадали с количество реплик всех частей