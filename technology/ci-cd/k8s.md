# Kubernetes (k8s)

- [Kubernetes (k8s)](#kubernetes-k8s)
  - [Зачем](#зачем)
  - [Reference Architecture](#reference-architecture)
  - [Patterns](#patterns)
    - [Naming convention](#naming-convention)
    - [Deployment](#deployment)
      - [Canary deployment](#canary-deployment)
    - [Scalability Performance масштабирование](#scalability-performance-масштабирование)
  - [Технологии](#технологии)

## Зачем

- обнаружение сервисов ![schema](../../img/technology/ci-cd/k8s.discovery.jpg)
- Окружения
  - организованы используя kubernetes namespaces в рамках одного кластера. Такой подход является максимально простым и быстрым на старте, но так же имеет свои недостатки: namespaces не полностью изолированы друг от друга в kubernetes
- Удобство для разработчиков. Встроить Kubernetes в workflow разработки можно разными способами:
  - Telepresence.io
  - Skaffold
- управление конфигурациями и секретами
  - Config, secrets
  - Configmaps
  - Consul, Vault и Consul Template для управления конфигурациями.
    - Consul Template запускается как init-контейнер, а в будущем планируется запускать его как sidecar к pod'ам, чтобы он следил за изменениями конфигурации в Consul и обновлял секреты с истекающим сроком действия в Vault и мягко (gracefully) перезапускал процессы приложений.
- [Observability](../../arch/ability/observability.md)
  - [Logs](../logging.md)
  - [Metrics monitoring](../monitoring.md)
    - Метрики
      - кол-ва k8s дашборд
      - Утилизация ресурсов?
    - в процессе мониторинга нам необходимо постоянно сопоставлять физический мир контейнеров с реальностью Kubernetes
    - health checks. У Kubernetes есть два их типа: liveness и readiness probes.

![k8s](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/daemon110282/daemon110282.github.io/daemon110282-patch-1/technology/ci-cd/k8s.puml)

![Ingress Controller](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/daemon110282/daemon110282.github.io/daemon110282-patch-1/technology/ci-cd/k8s.IC.puml)

## Reference Architecture

- [NGINX Modern Apps Reference Architecture (MARA)](https://github.com/nginxinc/kic-reference-architectures/)
  - [Distributed storage](../../technology/filesystem/filesystem.md)
  - [Object Storage](../../technology/filesystem/object.storage.md)
- [Oracle MuShop](https://oracle-quickstart.github.io/oci-cloudnative/)
- MSA ![MSA](../../img/technology/ci-cd/k8s.msa.jpg)

## Patterns

- [Rate limiting](https://www.nginx.com/blog/microservices-march-protect-kubernetes-apis-with-rate-limiting/)
- TODO Кол-во сервисов на контейнер
  - Ограничение кластера по подам на ноде?
  - создание маленьких контейнеров, т.к. контейнеры автоматически запускаются на разных хостах, и их меньший размер ускорит время запуска (поскольку предварительно их нужно физически скопировать на хостовую систему).

### Naming convention

- can only contain alphanumeric characters and hyphens. The alpha characters can only be lower-case, and names cannot start with hyphens. If you try to create objects that violate this naming convention, Kubernetes will complain.
- namespaces can be used for grouping:
  - Resources that are a part of the same application.
  - Resources that belong to a particular user. For example, I can create a namespace called adri, and create a bunch of resources in there as part of my Kubernetes experimentations.
  - Environment-specific resources. For example, rather than having a separate cluster for Dev and QA, you can simply create a dev namespace, and a qa namespace in the same cluster, and deploy resources to the appropriate namespace.
  - Изоляция ресурсов - когда вы удаляете пространство имен, оно удаляет само пространство имен вместе со всеми связанными объектами в этом пространстве имен
  - RBAC
- Labels can be useful for:
  - Determining whether a pod is part of a production or a canary deployment
  - Differentiating between stable and alpha releases
  - Specifying to which layer (UI, business logic, database, and so forth) an object belongs
  - Identifying whether a pod is front-end or back-end
  - Specifying an object’s release version (V1.0, V2.0, V2.1, and so on)
  - Constraints on Labels
  - The following syntax constraints are applied to labels:
    - Key must be unique within a given object
    - Min 0-max 63 characters for the segment (required): 253 for prefix (optional)
    - Start and end with alphanumerics [a-z0-9A-Z] (unless length is 0)
    - dashes "-", underscore "_" and dot "." allowed (internally)
    - (Optional) prefix must be a series of DNS labels separated by dots and followed by a slash

### Deployment

![schema](../../img/technology/ci-cd/k8s.deploy.jpg)

#### Canary deployment

- [Nginx](https://www.nginx.com/blog/microservices-march-improve-kubernetes-uptime-and-resilience-with-a-canary-deployment/)

### Scalability Performance масштабирование

- Avtoscaling
  - Min max nodes in cluster
- Запросы requests и лимиты limits CPU - by namespace, node, pod, container
- memory limit and a memory request
![limits](../../img/technology/ci-cd/k8s.limits.png))
- Quality of Service (QoS) classes to the Pod:
  - Guaranteed
  - Burstable
  - BestEffort
- Утилизация ресурсов cluster, nodes, pods, container
  - Когда вы утилизируете большую часть ресурсов кластера, контейнеры могут работать без проблем при обычной нагрузке, но в сценариях с высокой нагрузкой контейнеры могут начать использовать ЦП и память до предела. Это приведет к тому, что узел начнет выселять pods, а в критических ситуациях узел перестанет работать из-за нехватки ресурсов.
- настраивать проверки работоспособности (health probes)

## Технологии

- CI/CD
  - [Jenkins](jenkins.md)	- automation server on Kubernetes, pipeline
- IaC
  - [Helm](helm.md)
- Container Registry
  - Nexus
- [Service mesh](../servicemesh.md)
