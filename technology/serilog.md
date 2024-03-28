# Serilog

## Зачем

[Serilog](https://github.com/serilog/serilog/wiki)

- [aspnetcore](https://github.com/serilog/serilog-aspnetcore)
	- [request-logging](https://github.com/serilog/serilog-aspnetcore?tab=readme-ov-file#request-logging)
- отправляет логи в разные получатели [sinks](https://github.com/serilog/serilog/wiki/Provided-Sinks)
	- отправка __логов__ в OTLP по протоколу [opentelemetry](https://github.com/serilog/serilog-sinks-opentelemetry) [OTLP](../protocols.integration/otel.md)
	- console
	- DataDog
	- GrayLog
	- Sentry
	- Telegram
	- [Zipkin](https://www.nuget.org/packages/SerilogTracing.Sinks.Zipkin/)
- trace
	- [Serilog](https://github.com/serilog-tracing/serilog-tracing)
	- отправляет trace в разные получатели [sinks](https://github.com/serilog/serilog/wiki/Provided-Sinks)
		- отправка __trace__ в OTLP по протоколу [opentelemetry](https://www.nuget.org/packages/SerilogTracing.Sinks.OpenTelemetry/) [OTLP](../protocols.integration/otel.md)
