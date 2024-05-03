# k8s метрики

## Доступность

- Состояние подов — ready (сколько реплик доступно), status, restarts (количество рестартов), age (сколько времени приложение запущено)
- Статус развертываний (Deployments) — desired (целевое количество реплик), current (текущее количество реплик), up-to-date (сколько реплик обновлено), available (сколько реплик доступно), age (сколько времени приложение запущено)
- Статус StatefulSets
- Статистика выполнения CronJobs
- Использование ресурсов подом (процессор и память)
- Проверки работоспособности (Health checks)
- События Kubernetes
- Запросы к API-серверу
- Статистика Etcd
- Статистика смонтированных томов.

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