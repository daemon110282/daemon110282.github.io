# Паттерны Разворачивания Deployment

[Patterns](https://airtable.com/embed/shryjXK2rzf52sv9u/tbl2vjDV9Es36E2cW):

- Containerization
  - Контейнеры: docker
  - Платформы оркестрации контейнеров: k8s OpenShift
  - Платформа управление кластерами контейнеризации: Rancher  
- Service instance per host\VM\Container
- Serverless
- Sidecar
- Ambassador
- Isolation Control
- Медология [DevOps](./devops.md)
  - Процессы [CI](./devops.md#ci)
  - Процессы [CD](./devops.md#cd)
  - [Deploy](pattern.deploy.md)
    - [Отката изменений](pattern.rollback.md) Rollback
    - [Стратегии развертывания](pattern.deploy.md#стратегии-развертывания-deploy): AB BG Canary FeatureToggle
    - Graceful Shutdown
- Надежность
  - Проверка работоспособности ([Health-check](../observability/pattern.healthcheck.md))
- Производительность
  - [Балансировка нагрузки](load.balancing.md)
    - [Load balancer](../../../technology/middleware/loadbalancer.md)
  - Auto Scale
- [Service Discovery](service.discovery.md) и Service Registry
- [Service Mesh](../../../technology/middleware/servicemesh.md)
