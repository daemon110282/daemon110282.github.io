# Kubernetes (k8s)

- [Kubernetes (k8s)](#kubernetes-k8s)
  - [Зачем](#зачем)
    - [Элементы k8s](#элементы-k8s)
  - [Reference Architecture](#reference-architecture)
  - [Patterns](#patterns)
    - [Storage Solutions](#storage-solutions)
    - [Performance](#performance)
    - [Stateful Workloads](#stateful-workloads)
    - [Naming convention](#naming-convention)
    - [Deployment](#deployment)
      - [Canary deployment](#canary-deployment)
    - [Scalability Performance масштабирование](#scalability-performance-масштабирование)
    - [Управление сертификатами TLS](#управление-сертификатами-tls)
  - [Мониторинг](#мониторинг)
  - [Технологии](#технологии)

## Зачем

- Платформа для __оркестрации контейнеров__
- Обнаружение сервисов __[Service Discovery](../../arch/pattern/deployment/service.discovery.md)__
- Окружения
  - организованы используя kubernetes __namespaces__ в рамках одного __кластера__. Такой подход является максимально простым и быстрым на старте, но так же имеет свои недостатки: namespaces не полностью изолированы друг от друга в kubernetes
- Удобство для разработчиков. Встроить Kubernetes в workflow разработки можно разными способами:
  - Telepresence.io
  - Skaffold
- управление __конфигурациями и секретами__
  - Config, secrets
  - Configmaps
  - Consul, Vault и Consul Template для управления конфигурациями.
    - Consul Template запускается как init-контейнер, а в будущем планируется запускать его как sidecar к pod'ам, чтобы он следил за изменениями конфигурации в Consul и обновлял секреты с истекающим сроком действия в Vault и мягко (gracefully) перезапускал процессы приложений.
- [Observability](../../arch/ability/observability.md)
  - [Logs](../observability/logging.md)
  - [метрики](k8s.performance.metric.md): утилизация ресурсов, health checks probes, разворачивания
- [Отличие от Docker](https://mcs.mail.ru/blog/chto-umeet-kubernetes-chego-ne-umeet-docker) - инструмент для создания и запуска контейнеров

### Элементы k8s

![k8s](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/daemon110282/daemon110282.github.io/daemon110282-patch-1/technology/ci-cd/k8s.puml)

- [Ingress Controller](k8s.ingress.md)
- [Job, CronJob](k8s.job.md)

## Reference Architecture

- [NGINX Modern Apps Reference Architecture (MARA)](https://github.com/nginxinc/kic-reference-architectures/)
  - [Distributed storage](../../technology/filesystem/filesystem.md)
  - [Object Storage](../store/object.storage.md)
- [Oracle MuShop](https://oracle-quickstart.github.io/oci-cloudnative/)
- MSA ![MSA](../../img/technology/ci-cd/k8s.msa.jpg)

## Patterns

- Для упрощения развертывания k8s используются платформы управления: [Rancher](rancher.md)

TODO

- [redhat](https://developers.redhat.com/blog/2020/05/11/top-10-must-know-kubernetes-design-patterns)
- [10 антипаттернов деплоя](https://mcs.mail.ru/blog/antipatterny-deploya-v-kubernetes)
- [11 факапов PRO-уровня при внедрении Kubernetes](https://mcs.mail.ru/blog/11-fakapov-pro-urovnja-pri-vnedrenii-kubernetes)

### Storage Solutions

- [Container Attached Storage](https://openebs.io/docs/concepts/cas) - это программное обеспечение, включающее контроллеры хранения на основе микросервисов, управляемые Kubernetes.
  - Эти контроллеры хранилища могут работать в любом месте, которое доступно Kubernetes, то есть на любом облачном сервере или даже на обычном сервере с общим хранилищем или поверх традиционной системы общего хранения.
  - Критически важно, что доступ к самим данным также осуществляется через контейнеры, в отличие от хранения в системе общего масштабирования вне платформы.
- three categories of volumes
  - __Persistent volumes__: storage in the Kubernetes cluster that is preprovisioned or created via dynamic provisioning using storage classes
  - __Projected volumes__: a type of storage that can map several existing volumes in the same directory
  - __Ephemeral volumes__: storage that does not persist across restarts like emptyDir (useful for logs), configMap, or secret
- Container Attached Storage - Distributed Persistent Volumes easily deploy Kubernetes __Stateful Workloads__  
  - [OpenEBS](https://openebs.io/docs/)
  - Rook
  - GlusterFS
  - [Compare OpenEBS-Rook-GlusterFS](https://kubevious.io/blog/post/comparing-top-storage-solutions-for-kubernetes)
- [Distributed storage](../../technology/filesystem/filesystem.md) - NFS
  - [Container Attached Storage (CAS) vs. Shared Storage](https://blog.mayadata.io/container-attached-storage-cas-vs.-shared-storage-which-one-to-choose)
- [Object Storage](../store/object.storage.md) - Minio

### Performance

- [Rate limiting](../../arch/pattern/performance/rate.limit.md)

### Stateful Workloads

- __Stateful Workloads__ on __multi-container pods__ [and container communication](https://www.mirantis.com/blog/multi-container-pods-and-container-communication-in-kubernetes/)

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
    - Start and end with alphanumerics "a-z0-9A-Z" (unless length is 0)
    - dashes "-", underscore "_" and dot "." allowed (internally)
    - (Optional) prefix must be a series of DNS labels separated by dots and followed by a slash

### Deployment

- TODO Кол-во сервисов на контейнер
  - Ограничение кластера по подам на ноде?
  - создание маленьких контейнеров, т.к. контейнеры автоматически запускаются на разных хостах, и их меньший размер ускорит время запуска (поскольку предварительно их нужно физически скопировать на хостовую систему)

![schema](../../img/technology/ci-cd/k8s.deploy.jpg)

#### Canary deployment

- [Nginx](https://www.nginx.com/blog/microservices-march-improve-kubernetes-uptime-and-resilience-with-a-canary-deployment/)

### Scalability Performance масштабирование

- [метрики](k8s.performance.metric.md)
- Avtoscaling
  - Min max nodes in cluster
  - [Горизонтальный POD Autoscaling](https://docs.netscaler.com/en-us/netscaler-k8s-ingress-controller/how-to/cpx-hpa)
- RAM, CPU
  - Запросы requests
  - Лимиты [limits](https://habr.com/ru/companies/flant/articles/489668/)
    - by namespace, node, pod, container
    - Утилизация ресурсов cluster, nodes, pods, container
    - Когда вы утилизируете большую часть ресурсов кластера, контейнеры могут работать без проблем при обычной нагрузке, но в сценариях с высокой нагрузкой контейнеры могут начать использовать ЦП и память до предела.
      - Это приведет к тому, что узел начнет __выселять pods__
        - превышен limit RAM - статус перезапуска pod=__[OOMKilled](k8s.performance.metric.md)__
        - превышен limit CPU - включается __троттлинг__ (т.е. оно получает меньше тактов CPU)
      - в критических ситуациях узел __перестанет работать__ из-за нехватки ресурсов.
  ![limits](../../img/technology/ci-cd/k8s.limits.png))
- Quality of Service (QoS) classes to the Pod:
  - Guaranteed
  - Burstable
  - BestEffort
- настраивать проверки работоспособности (health probes)

### Управление сертификатами TLS

В Kubernetes управление TLS-сертификатами на уровне backend может быть организовано несколькими способами, в зависимости от требований безопасности и архитектуры.

- Использование cert-manager (автоматизация TLS)- cert-manager — это популярный инструмент для автоматического управления TLS-сертификатами в Kubernetes. Он может интегрироваться с Let’s Encrypt, HashiCorp Vault или внутренними CA.
- Использование Kubernetes Secrets (ручное управление TLS) - Если cert-manager не нужен, можно вручную загрузить сертификаты в Kubernetes.
- Использование Istio/Linkerd (end-to-end mTLS) - Если требуется автоматическое шифрование трафика внутри кластера, можно использовать сервис-меши:
  - Istio (автоматически выдает и управляет TLS-сертификатами)
  - Linkerd (меньше возможностей, но проще)

Подход	Автоматизация	Подходит для
cert-manager	Высокая	Автоматического управления внешними TLS-сертификатами
Kubernetes Secrets	Ручная	Простых случаев, когда сертификаты меняются редко
Istio/Linkerd	Полностью автоматическая	Защиты внутреннего трафика в микросервисах

Если у вас много сервисов и нужна автоматизация, лучше использовать cert-manager или Istio. 
Если сертификаты меняются редко, можно управлять вручную через Secrets.

## Мониторинг

- [node-problem-detector](https://github.com/kubernetes/node-problem-detector/tree/master)
  - опыт Авито [поиск деградации на нодах в кластерах Kubernetes](https://habr.com/ru/companies/avito/articles/847466/)

## Технологии

- CI/CD
  - [Jenkins](jenkins.md)	- automation server on Kubernetes, pipeline
- IaC
  - [Helm](helm.md)
- Container Registry
  - Nexus
- [Service mesh](../middleware/servicemesh.md)
