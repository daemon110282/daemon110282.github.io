# Distributed Tracing

- When receives a web request, it assigns each request a unique request ID, in the HTTP header X-Request-ID, and preserves that request ID across multiple log files. The HTTP request ID can help you diagnose problems by correlating log entries for a given web request across many log files, which otherwise would not contain a common piece of information. 
  - [Nginx + Sentry](https://blog.sentry.io/2019/01/31/using-nginx-sentry-trace-errors-logs)

## Технологии

- Jaeger
- Zipkin
- Opentelemetry
- Sentry

## Links

TODO

- https://www.nginx.com/blog/integrating-opentelemetry-modern-apps-reference-architecture-progress-report?mkt_tok=NjUzLVNNQy03ODMAAAGDoZc8tBnTTPpd0LyW8jL4ptLEDNmRtqT86ruxAIy0w26Q36wbMRlF5KC3BMfg2BcRVqWCoPUW3J4gMfJLANmKejRzOQC80kmD2-ueYoqT-DoXcB1iUA
- [.NET Core Support + Zipkin](https://docs.microsoft.com/en-us/dotnet/core/diagnostics/distributed-tracing-instrumentation-walkthroughs)
