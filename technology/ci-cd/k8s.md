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

- Платформа для оркестрации контейнеров
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
- [Отличие от Docker](https://mcs.mail.ru/blog/chto-umeet-kubernetes-chego-ne-umeet-docker) - инструмент для создания и запуска контейнеров

![k8s](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/daemon110282/daemon110282.github.io/daemon110282-patch-1/technology/ci-cd/k8s.puml)

![Ingress Controller](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/daemon110282/daemon110282.github.io/daemon110282-patch-1/technology/ci-cd/k8s.IC.puml)

## Reference Architecture

- [NGINX Modern Apps Reference Architecture (MARA)](https://github.com/nginxinc/kic-reference-architectures/)
  - [Distributed storage](../../technology/filesystem/filesystem.md)
  - [Object Storage](../../technology/filesystem/object.storage.md)
- [Oracle MuShop](https://oracle-quickstart.github.io/oci-cloudnative/)
- MSA ![MSA](../../img/technology/ci-cd/k8s.msa.jpg)

## Patterns

- Storage Solutions for Kubernetes
  - [Container Attached Storage](https://openebs.io/docs/concepts/cas) - это программное обеспечение, включающее контроллеры хранения на основе микросервисов, управляемые Kubernetes. 
    - Эти контроллеры хранилища могут работать в любом месте, которое доступно Kubernetes, то есть на любом облачном сервере или даже на обычном сервере с общим хранилищем или поверх традиционной системы общего хранения. 
    - Критически важно, что доступ к самим данным также осуществляется через контейнеры, в отличие от хранения в системе общего масштабирования вне платформы.
  - three categories of volumes
    - Persistent volumes: storage in the Kubernetes cluster that is preprovisioned or created via dynamic provisioning using storage classes
    - Projected volumes: a type of storage that can map several existing volumes in the same directory
    - Ephemeral volumes: storage that does not persist across restarts like emptyDir (useful for logs), configMap, or secret
  - Container Attached Storage - Distributed Persistent Volumes easily deploy Kubernetes __Stateful Workloads__  
    - [OpenEBS](https://openebs.io/docs/)
    - Rook
    - GlusterFS
    - [Compare OpenEBS-Rook-GlusterFS](https://kubevious.io/blog/post/comparing-top-storage-solutions-for-kubernetes)
  - [Distributed storage](../../technology/filesystem/filesystem.md) - NFS
    - [Container Attached Storage (CAS) vs. Shared Storage](https://blog.mayadata.io/container-attached-storage-cas-vs.-shared-storage-which-one-to-choose)
  - [Object Storage](../../technology/filesystem/object.storage.md) - Minio
- [Rate limiting](https://www.nginx.com/blog/microservices-march-protect-kubernetes-apis-with-rate-limiting/)
- TODO Кол-во сервисов на контейнер
  - Ограничение кластера по подам на ноде?
  - создание маленьких контейнеров, т.к. контейнеры автоматически запускаются на разных хостах, и их меньший размер ускорит время запуска (поскольку предварительно их нужно физически скопировать на хостовую систему).
- __Stateful Workloads__ on __multi-container pods__ [and container communication](https://www.mirantis.com/blog/multi-container-pods-and-container-communication-in-kubernetes/)
- TODO
  - https://developers.redhat.com/blog/2020/05/11/top-10-must-know-kubernetes-design-patterns
  - [10 антипаттернов деплоя](https://mcs.mail.ru/blog/antipatterny-deploya-v-kubernetes)
  - [11 факапов PRO-уровня при внедрении Kubernetes](https://mcs.mail.ru/blog/11-fakapov-pro-urovnja-pri-vnedrenii-kubernetes)
- [Cron Job](../../arch/pattern/cron.job.md)
  - [Cron Job](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/)
    - запускается на выполнение, и после завершения возвращает соответствующий __код завершения__ (exit status), который сообщает, [является ли результат успешным или неудачным](https://digitrain.ru/articles/279243/).
    - гарантируют, что __один или несколько подов выполнят свои команды__ и успешно завершатся. После завершения всех подов без ошибок, Job завершается.
      - job’ы должны быть __идемпотентными__, есть __риск создания 2х job__ 
        - как решать?
      - Ограничение выполнения Job’а Kubernetes по времени - параметр activeDeadlineSeconds 
      - Возможность одновременного выполнения - параметр concurrencyPolicy: Forbid, Allow, Replace
      - при сбоях 
        - повторы backoffLimit
        - RestartPolicy: Never (никогда) и OnFailure
    - Зачем
      - Пакетная обработка данных
      - Команды/специфические задачи
    - Паттерны
      - [Несколько одиночных Job’ов](https://habr.com/ru/companies/otus/articles/546376/) - параметр completions
      - Несколько параллельно запущенных Job’ов (Work Queue) - параметр parallelism
    

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
