# Kubernetes (k8s)


# Patterns

## scalability Performance масштабирование

Avtoscaling
  Min max nodes in cluster
Запросы requests и лимиты limits CPU - by namespace, node, pod, container
memory limit and a memory request
Quality of Service (QoS) classes to the Pod:
  Guaranteed
  Burstable
  BestEffort
Утилизация ресурсов cluster, nodes, pods, container
  Когда вы утилизируете большую часть ресурсов кластера, контейнеры могут работать без проблем при обычной нагрузке, но в сценариях с высокой нагрузкой контейнеры могут начать использовать ЦП и память до предела. Это приведет к тому, что узел начнет выселять pods, а в критических ситуациях узел перестанет работать из-за нехватки ресурсов.
настраивать проверки работоспособности (health probes)


# Links
