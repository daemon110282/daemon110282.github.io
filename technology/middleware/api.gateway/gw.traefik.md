# Traefik

## Зачем

Реализует паттерн [Reverse Proxy](../../../arch/pattern/pattern.proxy.reverse.md) и [API Gateway](../../../api/api.gateway.md).

- [Reverse Proxy](../proxy/router.traefik.md)
- [api-gateway](https://traefik.io/solutions/api-gateway/)
	- ![arch](https://doc.traefik.io/traefik/assets/img/middleware/overview.png)
	- [HTTP middleware](https://doc.traefik.io/traefik/middlewares/http/overview/): Rate limit, Chain, CircuitBreaker, Retry и тп
	- Observability
		- [Metrics by EntryPoint, Router, Service](https://doc.traefik.io/traefik/observability/metrics/overview/)
		- [SRE metrics on k8s + Prometheus + Grafana + Whoami](https://traefik.io/blog/capture-traefik-metrics-for-apps-on-kubernetes-with-prometheus/)
		- [Distributed trace Jaeger on k8s + DAG](https://traefik.io/blog/distributed-tracing-with-traefik-and-jaeger-on-kubernetes/)

