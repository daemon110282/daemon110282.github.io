# k8s метрики

[Metrics monitoring](../observability/monitoring.md):

- Метрики
  - кол-ва k8s дашборд
  - Утилизация ресурсов?
- в процессе мониторинга нам необходимо постоянно сопоставлять физический мир контейнеров с реальностью Kubernetes
- Статистика выполнения CronJobs
- Использование ресурсов подом (процессор и память)
- Запросы к API-серверу

TODO

- 6 главных метрик, на которые нужно [обращать внимание](https://habr.com/ru/companies/vk/articles/687766/)

## Доступность

- Проверки работоспособности [health checks](../../arch/pattern/observability/pattern.healthcheck.md). У Kubernetes есть два их типа __probes__:
	- liveness
	- readiness
- Состояние подов — ready (сколько реплик доступно), status, restarts (количество рестартов), age (сколько времени приложение запущено)
- Статус развертываний (Deployments) — desired (целевое количество реплик), current (текущее количество реплик), up-to-date (сколько реплик обновлено), available (сколько реплик доступно), age (сколько времени приложение запущено)
- Статус StatefulSets
- События Kubernetes
- Статистика Etcd
- Статистика смонтированных томов
- Статус StatefulSets.
- Статистика выполнения CronJobs.
- Использование ресурсов подом (процессор и память).
- События Kubernetes
- Запросы к API-серверу

## OOMKilled

- [Метрики](https://songrgg.github.io/operation/how-to-alert-for-Pod-Restart-OOMKilled-in-Kubernetes/)
- Пример
	
kube_pod_container_resource_limits{resource="memory", pod=""}

kube_pod_container_status_restarts_total {pod=""}
kube_pod_container_status_restarts_total  {cluster="", container="", namespace="production"}
kube_pod_container_status_restarts_total {cluster=~"$cluster",container="",exported_namespace=~"$namespace"}
kube_pod_container_status_restarts_total {cluster=~"$cluster",pod="$pod",exported_namespace=~"$namespace"}

kube_pod_container_status_last_terminated_reason { reason= "OOMKilled", pod=""}
kube_pod_container_status_last_terminated_reason { reason= "OOMKilled", pod="$pod"}
sum(container_memory_usage_bytes{cluster=~"$cluster",namespace=~"$namespace",pod="$pod",name!="",name!~".*POD.*"}) by (pod)

kube_pod_container_status_last_terminated_reason { cluster=~"$cluster",pod="$pod",reason= "OOMKilled"}