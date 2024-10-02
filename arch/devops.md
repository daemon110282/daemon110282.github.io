# DevOps

- [DevOps](#devops)
  - [Зачем](#зачем)
  - [Паттерны](#паттерны)
    - [Сколько сервисов(BC) в одном контейнере](#сколько-сервисовbc-в-одном-контейнере)
    - [Auto Scaling](#auto-scaling)
    - [Naming Convention](#naming-convention)
  - [Технологии](#технологии)

## Зачем

![tech](https://substackcdn.com/image/fetch/w_848,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F05104299-813f-4df7-91d1-e143fd1ee6a6_1016x571.png)

- CI - обеспечения процесса непрерывной интеграции
  - Авто тесты [Tests](pattern/test.md)
- CD - процесс доставки, развертывания: [Jenkins](../technology/ci-cd/jenkins.md)
- [Deployment](pattern/deployment/pattern.deploy.md)
  - [A\B test](ref/abtesting.md)
- [Service Mesh](../technology/middleware/servicemesh.md)
- [Доступность](ability/availability.md), Отказоустойчивость, Надежность
- [Производительность](ability/performance.md)
  - Auto Scaling
- [Infrastructure-as-Code (IaC) automation](../technology/ci-cd/ioc.md)
- Сквозная функциональность
  - Наблюдаемость [Observability](ability/observability.md)
    - [Log management](../technology/observability/logging.md)
    - [Performance monitoring (APM класс систем) and dashboards](system.class/apm.md)
  - [Security](ability/security.md)
  - [Audit](pattern/observability/pattern.audit.md)
- [SRE](../devops/sre.md)

## Паттерны

- [Модель DevOps оценки компании](http://agilemindset.ru/%d0%bc%d0%be%d0%b4%d0%b5%d0%bb%d1%8c-%d0%be%d1%86%d0%b5%d0%bd%d0%ba%d0%b8-%d0%ba%d0%be%d0%bc%d0%bf%d0%b5%d1%82%d0%b5%d0%bd%d1%86%d0%b8%d0%b9-devops-%d0%b2-miro/)
- TODO [Антипаттерны](https://mcs.mail.ru/blog/antipatterny-deploya-v-kubernetes)
- [MTA nginx](https://www.nginx.com/blog/enabling-multi-tenancy-namespace-isolation-in-kubernetes-with-nginx/)
- Strategy [Deployment (например blue-green deployment)](pattern/deployment/pattern.deploy.md)

### Сколько сервисов(BC) в одном контейнере

Each container __should do one thing and do it well__. A few reasons:

- There's a good chance you'd have to scale APIs and front-ends differently than databases.
- Separate containers let you version and update versions in isolation.
- While you may use a container for the database locally, you may want to use a managed service for the database in production. You don't want to ship your database engine with your app then.
- Running multiple processes will require a process manager (the container only starts one process), which adds complexity to container startup/shutdown.

### Auto Scaling

- [NGinx sample](https://www.nginx.com/blog/microservices-march-reduce-kubernetes-latency-with-autoscaling?mkt_tok=NjUzLVNNQy03ODMAAAGDoZc8tPFlFaIeMTkzcjbbLlI4Pk4BFagxrtzVyB8ZNM49BVO7w6eXPd56CdEOAe8AVXs53VxDwocBuOsl44YWrJj4nu6ULQB5gGE7c8YP5juQrkPKjg)
- Limit
  - CPU
  - MEM

### Naming Convention

- Namespace
  - env
- [Label](https://www.split.io/blog/kubernetes-labels-best-practices/) - key\value
  - key - alphanumeric character \[a-z0-9A-Z\] with dashes (-), underscores (_), dots (.), and alphanumerics between, [max length 253](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#syntax-and-character-set)
  - value - max length 63
  - Reserved [prefixes](https://kubernetes.io/docs/reference/labels-annotations-taints/)
    - kubernetes.io
    - kubernetes.azure.com
    - k8s.io
  - примеры
    - release : stable, release, canary
    - [kubernetes.io/os](https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels) : debian, linux
    - [kubernetes.azure.com/cluster](https://learn.microsoft.com/en-us/azure/aks/use-labels#reserved-system-labels) : cl1
    - kubernetes.io/part-of : родительская ИС\сервис
    - kubernetes.io/version : semver format
    - [sec.<organization_domain>/tenant-id](https://www.helpnetsecurity.com/2021/05/26/kubernetes-security/) : tenant-uid
- Tenant-Type service-Name Service-Type Component-Name Component-Technology Stack-Name module
  - Type service: категория ИС: LK, CRM, IDM
  - Technology Stack: PHP, .NET, Python, NodeJS, Java
  - Type Component - Tier: api, db, cache, frontend, backend
    - db: mssql, mysql
    - api:
    - cache: redis, memcached

## Технологии

- Code
- Build
- Test
- Release
  - Jenkins
- CD
  - Spinnaker
  - [Docker](../technology/ci-cd/docker.md)
    - [docker desktop](../technology/ci-cd/docker.md)
    - [docker-compose.yml when building a multi-container Docker](../technology/ci-cd/docker.md) application
- Operate
  - Контейнеризация
    - [k8s](../technology/ci-cd/k8s.md)
    - OpenShift
  - Infrastructure-as-Code
    - Ansible
    - [Helm](../technology/ci-cd/helm.md)
  - [Load balancer](../technology/middleware/loadbalancer.md)
  - [API Managment](../api/api-managment.md)
- Monitor
  - [Distributed Tracing](../technology/observability/tracing.distributed.md)
  - Logs
  - Metric
