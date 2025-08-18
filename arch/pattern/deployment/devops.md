# DevOps

- [DevOps](#devops)
  - [Зачем](#зачем)
  - [Этапы процесса (Pipeline)](#этапы-процесса-pipeline)
    - [Code](#code)
    - [CI](#ci)
      - [Build Сборка](#build-сборка)
      - [Test](#test)
      - [Release](#release)
    - [CD](#cd)
      - [Deploy Развертывание](#deploy-развертывание)
      - [Operate](#operate)
    - [Monitor](#monitor)
  - [Мобильные приложения Pipeline](#мобильные-приложения-pipeline)
  - [Паттерны](#паттерны)
    - [Сколько сервисов(BC) в одном контейнере](#сколько-сервисовbc-в-одном-контейнере)
    - [Auto Scaling](#auto-scaling)
    - [Naming Convention](#naming-convention)

## Зачем

DevOps (development и operations):

- это __методология автоматизации__ технологических процессов сборки, настройки и развёртывания программного обеспечения
- позволяет выстроить __конвейер__, на котором разработчики, тестировщики и сисадмины работают в едином потоке и вместе отвечают за результат — __код, выпущенный в релиз__ [для пользователей](https://practicum.yandex.ru/blog/chto-takoe-tehnologiya-devops/)
- CI - процесс обеспечения процесса __непрерывной интеграции__
- CD - процесс __доставки, развертывания__

![tech](https://substackcdn.com/image/fetch/w_848,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F05104299-813f-4df7-91d1-e143fd1ee6a6_1016x571.png)
  
## Этапы процесса (Pipeline)

### Code

- VCS: Git, GitLab, GitHab
- Jira
- Git Flow, Управление branch

### CI

#### Build Сборка

- Maven, SBT
- Запускается по Trigger:
  - push: This workflow is initiated when changes are pushed to the repository
  - branches: It runs when changes are pushed to the "main" branch

#### Test

- Авто тесты [Tests](../test.md): Unit, E2E
- Code Style
- Integration Tests

#### Release

- [Jenkins](../../../technology/ci-cd/jenkins.md)
- [GitLab](../gitlab.md) CI
- GitHab Action
- [TeamCity](../../../technology/ci-cd/teamcity.md)

### CD

#### Deploy Развертывание

- Spinnaker
- [GitLab](../gitlab.md) CD
- [TeamCity](../../../technology/ci-cd/teamcity.md)
- В [Docker](../../../technology/ci-cd/docker.md) собирается сборка под требуемый контур
  - [docker desktop](../../../technology/ci-cd/docker.md)
  - [docker-compose.yml when building a multi-container Docker](../../../technology/ci-cd/docker.md) application
- Контура
- Стратегии [Deployment](pattern.deploy.md)

#### Operate

- Контейнеризация
  - [k8s](../../../technology/ci-cd/k8s.md)
  - OpenShift
  - [Ansible](../../../technology/ci-cd/ansible.md)
- Infrastructure-As-Code [IAC](../../../technology/ci-cd/iac.md)
  - [Ansible](../../../technology/ci-cd/ansible.md)
  - [Helm](../../../technology/ci-cd/helm.md)
- [Load balancer](../../../technology/middleware/loadbalancer.md)
- [API Managment](../../../api/api-managment.md)

### Monitor

- Наблюдаемость [Observability](../../ability/observability.md)
  - [Log management](../../../technology/observability/logging.md)
    - [Security](../../ability/security.md)
    - [Audit](../observability/pattern.audit.md)
  - Metric
    - Обеспечить [Производительность](../../ability/performance/performance.md): Auto Scaling
    - [Performance monitoring (APM класс систем) and dashboards](../../system.class/apm.md)
    - [Health Checks](../observability/pattern.healthcheck.md): k8s liveness и readiness probes
  - Trace
    - [Distributed Tracing](../../../technology/observability/tracing.distributed.md)
- Обеспечить [Надежность](../../ability/reliability.md)
  - Методология [SRE](../../../devops/sre.md)
  - Crash Analytics
- Обеспечить [Доступность](../../ability/availability.md)
- Обеспечить Отказоустойчивость

## Мобильные приложения Pipeline

- Старт разработки
- Создание аккаунтов в Store
- Подготовка
- Финальная [проверка сборки](https://habr.com/ru/companies/agima/articles/797223/)
  - имитировать установку приложения из Store
    - Для Android-сборок мы можем использовать, к примеру, [FireBase](../../../technology/ci-cd/firebase.md). У них есть раздел App Distribute. Для iOS-сборок есть TestFlight.
- Отправка сборки на проверку в Store
  - [fastlane нюансы разрешений приложения](https://t.me/flutter_mad_fans/291)
- Финал разработки
- Публикация Deploy сборки Release в Store: fastlane IOS
- Примеры
  - [Flutter GitLab CI CD Firebase](https://habr.com/ru/companies/doubletapp/articles/712490/)

## Паттерны

- [Модель DevOps оценки компании](http://agilemindset.ru/%d0%bc%d0%be%d0%b4%d0%b5%d0%bb%d1%8c-%d0%be%d1%86%d0%b5%d0%bd%d0%ba%d0%b8-%d0%ba%d0%be%d0%bc%d0%bf%d0%b5%d1%82%d0%b5%d0%bd%d1%86%d0%b8%d0%b9-devops-%d0%b2-miro/)
- TODO [Антипаттерны](https://mcs.mail.ru/blog/antipatterny-deploya-v-kubernetes)
- [MTA nginx](https://www.nginx.com/blog/enabling-multi-tenancy-namespace-isolation-in-kubernetes-with-nginx/)
- Strategy [Deployment (например blue-green deployment)](pattern.deploy.md)

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
