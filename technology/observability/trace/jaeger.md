# Jaeger

- [Jaeger](#jaeger)
  - [Зачем](#зачем)
  - [Плюсы-минусы](#плюсы-минусы)
  - [Version](#version)

## Зачем

- Networking
- Качество архитектуры [Наблюдаемость Observability](../../../arch/ability/observability.md)
  - __Tracing__
  - Metric
    - Service Performance Monitoring (SPM) - [Experimental](https://www.jaegertracing.io/docs/1.40/spm/)
- Distributed context propagation
- Distributed transaction monitoring
- Root cause analysis
- Service dependency analysis
- Performance / latency optimization

## Плюсы-минусы

Плюсы:

- [OpenTelemetry (OTel) Protocol](../../protocols.integration/otel.md)
- gRPC support
- OpenSource
- Хранилища
  - [ClickHouse](../../store/clickhouse.md)
    - [plugin gRPC](https://github.com/jaegertracing/jaeger-clickhouse)
  - [PostgreSQL with Promscale](../../db/postgresql.md), [ELK](../monitoring/elk.md)
- Topology Graph
  - System Architecture
  - Deep Dependency Graph
- All Jaeger backend components expose __Prometheus metrics__ by default (other metrics backends are also supported).
- Logs are written to stdout using the structured logging library zap.
- Service Performance Monitoring (SPM)
- Visualizes aggregated span data in the form of RED (Requests, Errors, Duration) metrics to highlight services and/or operations with statistically significant request/error rates or latencies, then leveraging Jaeger’s Trace Search capabilities to pinpoint specific traces belonging to these services/operations.

Минусы:

- Limitations
- If your application exports both __traces and metrics using OTLP__, then you would still need to run the __OpenTelemetry Collector__, because the Jaeger collector can __only accept the tracing portion of OTLP data__. Alternatively, you may configure the SDK with two OTLP exporters pointing to different backends.
- Not all the options supported by the OTLP receiver in the OpenTelemetry Collector are supported by the Jaeger backend.
- Only the Jaeger collector supports the new OTLP receiver. The Jaeger agent only supports the “classic” Jaeger formats. If your deployment requires a local agent, we recommend running the OpenTelemetry Collector in that capacity.

## Version

- 1.35
