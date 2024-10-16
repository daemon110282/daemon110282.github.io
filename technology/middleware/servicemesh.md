# Service Mesh Сеть сервисов

- [Service Mesh Сеть сервисов](#service-mesh-сеть-сервисов)
  - [Зачем](#зачем)
  - [Плюсы и минусы](#плюсы-и-минусы)
  - [Технологии](#технологии)

## Зачем

Сетевая инфраструктура, через которую сервис общается с другими сервисами и внешними ИС.

- [Маршрутизация трафика](../../arch/pattern/deployment/pattern.proxy.reverse.md) на основе правил
  - процент
  - параметры запроса (в header, url параметр)
  - стратегии [deployment](../../arch/pattern/deployment/pattern.deploy.md) (сине-зеленое, канареечное и тп)
- [Балансировка трафика](../../arch/pattern/deployment/load.balancing.md)
- [Observability](../../arch/ability/observability.md)
  - [Распределенная трассировка](../observability/tracing.distributed.md)
- [Service Discovery](../../arch/pattern/deployment/service.discovery.md)
- [Circuit Breaker](../../arch/pattern/system.design/fault.tolerance/pattern.failure.md)
- Безопасность
  - TLS обеспечение
- Rate Limit, Quota на запросы

Отличия [от __API GW__](https://habr.com/ru/companies/slurm/articles/702262/):

- есть __Service Discovery__ (хотя и в API GW есть?)
- API GW служит периферийным микросервисом и выполняет задачи, __связанные с бизнес-логикой микросервисов__, например __преобразование запросов__, __сложная маршрутизация__ или обработка полезной нагрузки, тогда как service mesh отвечает только за некоторые аспекты __взаимодействия между сервисами__
- API GW и Service Mesh работают на разных уровнях.
  - API GW
    - на __уровне приложения__
    - __находится между пользователем и внутренней логикой приложения__
    - отвечает за __вертикальный трафик__
  - Service Mmesh
    - на __уровне инфраструктуры__
    - между __внутренними микросервисами__
    - обрабатывает __горизонтальный трафик__ между микросервисами
  - API GW направлен на бизнес-логику, а service mesh управляет взаимодействием между сервисами.
- API GW работает почти с __любым приложением или архитектурой__, даже монолитными приложениями. Service mesh предназначена только для некоторых решений, например __Kubernetes__
- [TODO](https://konghq.com/blog/enterprise/the-difference-between-api-gateways-and-service-mesh)

## Плюсы и минусы

## Технологии

[Варианты](https://habr.com/ru/companies/slurm/articles/703552/)

- [Istio](service.mesh/istio.md)
- Nginx?
- Netscaler?
- Linkerd 2.x
- Conduit
- AWS App Mesh
- [Consul Hashicorp](consul.md)
- Kuma от Kong
- [Maesh от Traefik](https://traefik.io/traefik-mesh/)
