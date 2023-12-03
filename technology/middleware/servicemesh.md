# Service Mesh Сеть сервисов

Сетевая инфраструктура, через которую сервис общается с другими сервисами и внешними ИС.

## Зачем

- [Маршрутизация трафика](../../arch/pattern/deployment/pattern.proxy.reverse.md) на основе правил
  - процент
  - параметры запроса (в header, url параметр)
  - стратегии [deployment](../../arch/pattern/pattern.deploy.md) (сине-зеленое, канареечное и тп)
- [Балансировка трафика](../../arch/pattern/deployment/load.balancing.md)
- [Observability](../../arch/ability/observability.md)
  - [Распределенная трассировка](../../technology/tracing.distributed.md)
- [Service Discovery](../../arch/pattern/deployment/service.discovery.md)
- [Circuit Breaker](../../arch/pattern/pattern.failure.md)
- Безопасность
  - TLS обеспечение
- Rate Limit, Quota на запросы

Отличия [от API GW](https://habr.com/ru/companies/slurm/articles/702262/):

- есть Service Discovery (хотя и в API GW есть?)
- API-шлюз служит периферийным микросервисом и выполняет задачи, __связанные с бизнес-логикой микросервисов__, например __преобразование запросов__, __сложная маршрутизация__ или обработка полезной нагрузки, тогда как service mesh отвечает только за некоторые аспекты взаимодействия между сервисами.
- API-шлюз и service mesh работают на разных уровнях. 
  - API-шлюз 
    - на уровне приложения
    - __находится между пользователем и внутренней логикой приложения__
    - отвечает за __вертикальный трафик__
  - service mesh 
    - на уровне инфраструктуры
    - между внутренними микросервисами
    - обрабатывает __горизонтальный трафик__ между микросервисами
  - API-шлюз направлен на бизнес-логику, а service mesh управляет взаимодействием между сервисами.
- API-шлюз работает почти с __любым приложением или архитектурой__, даже монолитными приложениями. Service mesh предназначена только для некоторых решений, например __Kubernetes__. 
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
- Consul Hashicorp
- Kuma от Kong
- [Maesh от Traefik](https://traefik.io/traefik-mesh/)