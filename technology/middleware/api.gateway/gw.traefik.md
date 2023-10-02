# Traefik

## Зачем

Реализует паттерн [Reverse Proxy](../../../arch/pattern/pattern.proxy.reverse.md) и [API Gateway](../../../api/api.gateway.md).

- [Reverse Proxy](../proxy/router.traefik.md)
- [api-gateway](https://traefik.io/solutions/api-gateway/)
	- ![arch](https://doc.traefik.io/traefik/assets/img/middleware/overview.png)
	- [HTTP middleware](https://doc.traefik.io/traefik/middlewares/http/overview/): Rate limit, Chain, CircuitBreaker, Retry и тп
	- [Metrics by EntryPoint, Router, Service](https://doc.traefik.io/traefik/observability/metrics/overview/)