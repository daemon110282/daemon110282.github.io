# Доступность Availability (high availability) Upstream Uptime

Для обеспечения [Надежности ИС](../../devops/sre.md).

## Метрики

- [доступность сервиса (время простоя)](https://bigdataschool.ru/blog/sre-indicators-devops-itil.html) (A) за конкретный период зависит от планового значения этого показателя (B) и суммарного времени простоев (C)  A = (B - C)/ B * 100 %
- важно определить __максимально возможное время простоя__ и его цену
- RTO (__Recovery Time Objective__, целевое время восстановления) – промежуток времени, в течение которого __система может оставаться недоступной в случае аварии__, т.е. время, необходимое для восстановления полного функционирования сервиса после наступления аварийного события.
- Процент времени, в течение которого ваш API работает и способен обрабатывать запросы (ping health check)
  - Nginx
    - __Available Upstream__
      - This indicates the number of upstream servers available to serve the requests in case NGINX is working as a reverse proxy.
      - Impact and remediation: This tells you whether your upstream servers are working or not. If these go down, your request serving capacity will likely decrease due to the loss of an upstream server.
      - Thresholds: Any decrease in the number of upstreams indicates that your upstream server is down.
    - __Active Upstream Connections__ 
      - Active upstream connections are the total active connections with the upstream servers in case of a reverse proxy. 
      - Impact and remediation: A change here indicates that there is a high number of connections with an upstream server. This could mean that your connections are not getting served properly. You may also see an increase in response time due to the added latency. An increase in RPS also means that throughput has increased and your NGINX servers need to be scaled. 
      - Thresholds: This will depend on your machines and the number of upstream servers. Look out for any sudden spikes.
    - __Upstream Errors__
      - This alerts you to errors coming from upstream servers if NGINX is working as a reverse proxy. 
      - Impact and remediation: An increase in this value indicates that there are errors from upstream servers that may need to be dealt with. 
      - Thresholds: This will depend on your application, as with server errors.
  - Traefik
    - Configure health check to remove unhealthy servers from the load balancing rotation. Traefik will consider your servers healthy as long as they return status codes between 2XX and 3XX to the health check requests (carried out every interval).
  - K8s
    - Kubernetes has an health check mechanism to remove unhealthy pods from Kubernetes services (cf __readiness probe__). As unhealthy pods have no Kubernetes endpoints.
- Circuit Breaker Trips: If you're using the circuit breaker pattern to handle failures, you might track how often the circuit breaker is tripped. This can give you a sense of how often your API or its dependencies are failing.

## Паттерны

- Ограничение ресурсов ИС [throttling](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/throttling)
- [TODO](https://photos.app.goo.gl/VaUseEzeFcvSJj6U9)
- отказоустойчивость и масштабирование MariaDB и RabbitMQ в основе лежит разделение баз и брокеров по сервисам.
- Избегайте состояния (stateless) в вашем приложении
- [Балансировка](../pattern/load.balancing.md)
- Big data
  - [MapReduce, gfs, hadoop, clickhouse, splunk, vertica, netapp](http://habrahabr.ru/post/272041/)
