# Kubernetes (k8s)

## Reference Architecture

- [NGINX Modern Apps Reference Architecture (MARA)](https://github.com/nginxinc/kic-reference-architectures/)
  - Distributed storage
- [Oracle MuShop](https://oracle-quickstart.github.io/oci-cloudnative/)

## Patterns

- [Rate limiting](https://www.nginx.com/blog/microservices-march-protect-kubernetes-apis-with-rate-limiting/)

### Canary deployment

- [Nginx](https://www.nginx.com/blog/microservices-march-improve-kubernetes-uptime-and-resilience-with-a-canary-deployment/)

#### Scalability Performance масштабирование

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
