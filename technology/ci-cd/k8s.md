# Kubernetes (k8s)

- [Kubernetes (k8s)](#kubernetes-k8s)
  - [Reference Architecture](#reference-architecture)
  - [Patterns](#patterns)
    - [Canary deployment](#canary-deployment)
    - [Scalability Performance масштабирование](#scalability-performance-масштабирование)
  - [Технологии](#технологии)
  - [Links](#links)

## Reference Architecture

- [NGINX Modern Apps Reference Architecture (MARA)](https://github.com/nginxinc/kic-reference-architectures/)
  - Distributed storage
- [Oracle MuShop](https://oracle-quickstart.github.io/oci-cloudnative/)

## Patterns

- [Rate limiting](https://www.nginx.com/blog/microservices-march-protect-kubernetes-apis-with-rate-limiting/)
- TODO Кол-во сервисов на контейнер
  - Ограничение кластера по подам на ноде?
  - создание маленьких контейнеров, т.к. контейнеры автоматически запускаются на разных хостах, и их меньший размер ускорит время запуска (поскольку предварительно их нужно физически скопировать на хостовую систему).
  - Метрики 
    - кол-ва k8s дашборд
    - Утилизация ресурсов?

### Canary deployment

- [Nginx](https://www.nginx.com/blog/microservices-march-improve-kubernetes-uptime-and-resilience-with-a-canary-deployment/)

### Scalability Performance масштабирование

- Avtoscaling
  - Min max nodes in cluster
- Запросы requests и лимиты limits CPU - by namespace, node, pod, container
- memory limit and a memory request
- Quality of Service (QoS) classes to the Pod:
  - Guaranteed
  - Burstable
  - BestEffort
- Утилизация ресурсов cluster, nodes, pods, container
  - Когда вы утилизируете большую часть ресурсов кластера, контейнеры могут работать без проблем при обычной нагрузке, но в сценариях с высокой нагрузкой контейнеры могут начать использовать ЦП и память до предела. Это приведет к тому, что узел начнет выселять pods, а в критических ситуациях узел перестанет работать из-за нехватки ресурсов.
- настраивать проверки работоспособности (health probes)

## Технологии

- Helm
- Jenkins	- automation server on Kubernetes
- Container Registry
  - Nexus

## Links