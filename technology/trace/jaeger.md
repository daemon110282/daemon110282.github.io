# Jaeger

## Зачем

- Networking
- Качество архитектуры [Наблюдаемость Observability](../../arch/ability/observability.md) __Tracing__

## Плюсы-минусы

Плюсы:

- [OpenTelemetry (OTel) Protocol](../protocols.integration/otel.md)
- gRPC support
- OpenSource
- Хранилища: 
  - [ClickHouse](../store/clickhouse.md)
    - [plugin gRPC](https://github.com/jaegertracing/jaeger-clickhouse)
  - [PostgreSQL with Promscale](../db/postgresql.md), [ELK](../monitoring/elk.md)
- Topology Graph
  - System Architecture
  - Deep Dependency Graph

Минусы:

- 