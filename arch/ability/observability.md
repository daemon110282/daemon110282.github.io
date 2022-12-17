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

- Appdynamics
- Dynatrace
- Splunk
- [ElastickSearch Kibana](../../technology/monitoring/elk.md)
- [GrayLog, ELK](../../technology/logging.md)
- [Jaeger+ELK, Jaeger+ClickHouse, Zipkin](../../technology/tracing.distributed.md)
