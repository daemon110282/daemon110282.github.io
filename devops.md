# DevOps

- [DevOps](#devops)
  - [Зачем](#зачем)
  - [Паттерны](#паттерны)
    - [Сколько сервисов(BC) в одном контейнере](#сколько-сервисовbc-в-одном-контейнере)
    - [Auto Scaling](#auto-scaling)
  - [Технологии](#технологии)

## Зачем

- CI
- CD
- A\B test
- [Deployment](arch/pattern/pattern.deploy.md)
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
  - [Performance monitoring (APM класс систем) and dashboards](arch/system.class/apm.md)
  - [Audit](arch/pattern/pattern.audit.md)

## Паттерны

- [Модель DevOps оценки компании](http://agilemindset.ru/%d0%bc%d0%be%d0%b4%d0%b5%d0%bb%d1%8c-%d0%be%d1%86%d0%b5%d0%bd%d0%ba%d0%b8-%d0%ba%d0%be%d0%bc%d0%bf%d0%b5%d1%82%d0%b5%d0%bd%d1%86%d0%b8%d0%b9-devops-%d0%b2-miro/)
Антипаттерны https://mcs.mail.ru/blog/antipatterny-deploya-v-kubernetes
MTA nginx https://www.nginx.com/blog/enabling-multi-tenancy-namespace-isolation-in-kubernetes-with-nginx/?utm_source=pocket_mylist

### Сколько сервисов(BC) в одном контейнере

each container should do one thing and do it well. A few reasons:

- There's a good chance you'd have to scale APIs and front-ends differently than databases.
- Separate containers let you version and update versions in isolation.
- While you may use a container for the database locally, you may want to use a managed service for the database in production. You don't want to ship your database engine with your app then.
- Running multiple processes will require a process manager (the container only starts one process), which adds complexity to container startup/shutdown.

### Auto Scaling

https://www.nginx.com/blog/microservices-march-reduce-kubernetes-latency-with-autoscaling?mkt_tok=NjUzLVNNQy03ODMAAAGDoZc8tPFlFaIeMTkzcjbbLlI4Pk4BFagxrtzVyB8ZNM49BVO7w6eXPd56CdEOAe8AVXs53VxDwocBuOsl44YWrJj4nu6ULQB5gGE7c8YP5juQrkPKjg&utm_source=pocket_mylist
- Limit
  - CPU
  - MEM

[Deployment (например blue-green deployment)](arch/pattern/pattern.deploy.md)

## Технологии

https://substackcdn.com/image/fetch/w_848,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F05104299-813f-4df7-91d1-e143fd1ee6a6_1016x571.png

- [k8s](technology/ci-cd/k8s.md)
- Helm
- [docker](technology/ci-cd/docker.md)
  - [docker desktop](technology/ci-cd/docker.md)
  - [docker-compose.yml when building a multi-container Docker](technology/ci-cd/docker.md) application
- [load balancer](technology/loadbalancer.md)
- edge
- CD
  - Spinnaker
- [Distributed Tracing](technology/tracing.distributed.md)
- [API Managment](api/api-managment.md)
