# Distributed Tracing

- [Distributed Tracing](#distributed-tracing)
  - [Паттерны](#паттерны)
    - [X-Request-ID](#x-request-id)
    - [Response Time](#response-time)
  - [Технологии](#технологии)
    - [Фреймворки](#фреймворки)
    - [Data OTEL Collector](#data-otel-collector)

## Паттерны 

### X-Request-ID

- [When receives a web request](https://http.dev/x-request-id), it assigns each request a __unique request ID__, in the __HTTP header X-Request-ID__, and preserves that request ID across multiple log files. The HTTP request ID can help you diagnose problems by __correlating log entries__ for a given web request across many log files, which otherwise would not contain a common piece of information.
- __ABP Framework__ generates a correlationId for the first time when an operation is started and then attaches the current correlationId to distributed events as an additional property
  - For example, if you are using the transactional outbox or inbox pattern provided by ABP Framework, you can see the correlationId in the extra properties of the IncomingEventInfo or OutgoingEventInfo classes with the standard X-Correlation-Id key.
- подходы к генерации
  - UUID4 - 96a101dd-c49a-4fea-aee2-a76510f32190
  - [unique request identifier generated](http://nginx.org/en/docs/http/ngx_http_core_module.html#var_request_id) from 16 random bytes, in hexadecimal (1.11.0) 32 hexadecimal characters - 444535f9378a3dfa1b8604bc9e05a303
- как передавать
  - HTTP Header
  - Query String - менее распространено
- Настройка
  - [nginx](https://www.nginx.com/blog/application-tracing-nginx-plus/)
  - netscaler - не нашел
  - [sentry](https://blog.sentry.io/using-nginx-sentry-trace-errors-logs/)
  - [apache drupal php](https://docs.acquia.com/cloud-platform/develop/drupal/requestid/)
  - [envoy](https://www.envoyproxy.io/docs/envoy/latest/configuration/http/http_conn_man/headers#x-request-id)

### Response Time

[.NET in log](https://www.codeproject.com/Tips/5337523/Response-Time-Header-in-ASP-NET-Core)

## Технологии

### Фреймворки

- [Serilog](../serilog.md)

### Data OTEL Collector

[Compare](https://www.nginx.com/blog/integrating-opentelemetry-modern-apps-reference-architecture-progress-report?mkt_tok=NjUzLVNNQy03ODMAAAGDoZc8tBnTTPpd0LyW8jL4ptLEDNmRtqT86ruxAIy0w26Q36wbMRlF5KC3BMfg2BcRVqWCoPUW3J4gMfJLANmKejRzOQC80kmD2-ueYoqT-DoXcB1iUA)

- [Jaeger 1.45.0](trace/jaeger.md)
  - плюсы
    - Support Protocol [OpenTelemetry](../protocols.integration/otel.md)
    - в Yandex Cloud используется (но переписан сильно)
- [Zipkin](trace/zipkin.md) 0.7.0
  - минусы
    - [No active development](https://uptrace.dev/blog/distributed-tracing-tools.html)
    - java
    - OpenTelemetry support requires an adapter
  - плюсы
    - dependency graph service
    - NoSQL Cassandra, ElasticSearch storage
  - [.NET Core Support + Zipkin](https://docs.microsoft.com/en-us/dotnet/core/diagnostics/distributed-tracing-instrumentation-walkthroughs)
- [Sentry Self Hosted 23.5.2](sentry.md)
  - плюсы
    - Сбор телеметрии (логи, метрики, трейсы)
  - минусы
    - dependency graph service
- [Service Mesh](../middleware/servicemesh.md) [Istio](../middleware/service.mesh/istio.md)
- [Seq](https://datalust.co/seq)