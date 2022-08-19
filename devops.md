# DevOps

- [DevOps](#devops)
  - [Зачем](#зачем)
  - [Паттерны](#паттерны)
    - [Сколько сервисов(BC) в одном контейнере](#сколько-сервисовbc-в-одном-контейнере)
    - [Auto Scaling](#auto-scaling)
    - [Deployment](#deployment)
      - [Blue Green Deployment](#blue-green-deployment)
      - [Canary Deployment](#canary-deployment)
  - [Технологии](#технологии)
  - [Links](#links)

## Зачем

- CI
- CD
- A\B test
- Deployment
  - Blue Green Deployment
  - Canary Deployment
- [Service Mesh](technology/servicemesh.md)
- Доступность, Отказоустойчивость, Надежность
- Производительность
  - Auto Scaling
- [Infrastructure-as-Code (IaC) automation](technology/ioc.md)
- Сквозная функциональность
  - [Log management](technology/logging.md)
  - [Security](arch/ability/security.md)
  - [Performance monitoring and dashboards](technology/monitoring.md)
  - [Audit](arch/pattern/pattern.audit.md)

## Паттерны

### Сколько сервисов(BC) в одном контейнере

todo

### Auto Scaling

- Limit
  - CPU
  - MEM

[Deployment (например blue-green deployment)](arch/pattern/pattern.deploy.md)

## Технологии

- [k8s](technology/k8s.md)
- Helm
- [docker-compose.yml when building a multi-container Docker](technology/docker.md) application
- [load balancer](technology/loadbalancer.md)
- edge
- CD
  - Spinnaker
- [Distributed Tracing](technology/tracing.distributed.md)
- [API Managment](api/api-managment.md)

## Links

- [Модель оценки компании](http://agilemindset.ru/%d0%bc%d0%be%d0%b4%d0%b5%d0%bb%d1%8c-%d0%be%d1%86%d0%b5%d0%bd%d0%ba%d0%b8-%d0%ba%d0%be%d0%bc%d0%bf%d0%b5%d1%82%d0%b5%d0%bd%d1%86%d0%b8%d0%b9-devops-%d0%b2-miro/)
