# Service Mesh Сеть сервисов

Сетевая инфраструктура, через которую сервис общается с другими сервисами и внешними ИС.

## Зачем

- [Маршрутизация трафика](../../arch/pattern/pattern.proxy.reverse.md) на основе правил
  - процент
  - параметры запроса (в header, url параметр)
- [Балансировка трафика](../../arch/pattern/load.balancing.md)
- [Observability](../../arch/ability/observability.md)
  - [Распределенная трассировка](../../technology/tracing.distributed.md)
- Service Discovery
- [Circuit Breaker](../../arch/pattern/pattern.failure.md)
- Безопасность
  - TLS обеспечение
- Rate Limit, Quota на запросы

## Технологии

- [Istio](service.mesh/istio.md)
- Nginx?
- Netscaler?
- Linkerd
- Conduit
