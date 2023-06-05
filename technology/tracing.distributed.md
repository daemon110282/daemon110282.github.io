# Distributed Tracing

- When receives a web request, it assigns each request a __unique request ID__, in the __HTTP header X-Request-ID__, and preserves that request ID across multiple log files. The HTTP request ID can help you diagnose problems by __correlating log entries__ for a given web request across many log files, which otherwise would not contain a common piece of information.
  
## Технологии

[Compare](https://www.nginx.com/blog/integrating-opentelemetry-modern-apps-reference-architecture-progress-report?mkt_tok=NjUzLVNNQy03ODMAAAGDoZc8tBnTTPpd0LyW8jL4ptLEDNmRtqT86ruxAIy0w26Q36wbMRlF5KC3BMfg2BcRVqWCoPUW3J4gMfJLANmKejRzOQC80kmD2-ueYoqT-DoXcB1iUA)

- [Jaeger 1.45.0](trace/jaeger.md) 
  - плюсы
    - Support Protocol [OpenTelemetry](protocols.integration/otel.md)
    - в Yandex Cloud используется
- Zipkin 0.7.0
  - минусы
    - [No active development](https://uptrace.dev/blog/distributed-tracing-tools.html)
    - java
    - OpenTelemetry support requires an adapter
  - плюсы
    - dependency graph service
    - NoSQL Cassandra, ElasticSearch storage
  - [.NET Core Support + Zipkin](https://docs.microsoft.com/en-us/dotnet/core/diagnostics/distributed-tracing-instrumentation-walkthroughs)
- [Sentry Self Hosted 23.5.2](observability/sentry.md)
  - плюсы
    - Сбор телеметрии (логи, метрики, трейсы)
  - минусы
    - dependency graph service