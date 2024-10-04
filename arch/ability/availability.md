# Доступность High Availability

- [Доступность High Availability](#доступность-high-availability)
  - [Зачем](#зачем)
  - [Паттерны](#паттерны)
  - [Метрики](#метрики)
  - [Технологии](#технологии)
    - [Health checks](#health-checks)

## Зачем

Для обеспечения [Надежности ИС](reliability.md).

- [Таблица](https://sre.google/sre-book/availability-table/) __сколько времени__ простоя разрешено для достижения __заданного уровня доступности__.
- Доступность Uptime ИС зависит от частоты и продолжительности __простоев__. [Она измеряется](https://habr.com/ru/companies/itsumma/articles/435662/) через:
  - Частоту простоя, или обратную от нее: __MTTF (mean time to failure, среднее время безотказной работы)__
  - Продолжительность простоя, __MTTR (mean time to repair, среднее время восстановления)__. Продолжительность простоя определяется временем пользователя: от начала неисправности до возобновления [нормальной работы сервиса](https://habr.com/ru/companies/slurm/articles/525176/).
    - [Observability](observability.md) напрямую связана с MTTR. __Чем выше Observability сервиса, тем проще определить ошибку__, исправить и автоматизировать, и тем ниже MTTR.
  - Доступность определяется как MTTF/(MTTF+MTTR)
- Доступность можно определять по-разному:
  - Сервер AWS считается недоступным только в случае, если за __пять минут не дает никаких ответов на запросы, кроме 500 или 503__. Эти коды ответов обозначают две ошибки: Internal Server Error и Service Unavailable. Все остальные ответы сервера не учитываются при расчёте надёжности.
    - в Amazon успешен только [один запрос в 5 минут](https://habr.com/ru/companies/avito/articles/742960/), по их мнению, это 100%-я доступность
    - иначе: у вас могут быть до 21 минуты полной деградации, и неограниченное число частичных деградаций.
    - Амазон не нарушит свои условия о 99,95% доступности. Или в крайнем случае - 8640 успешных запросов (по 1му раз в 5 минут) и неограниченное число неуспешных.

## Паттерны

- [Throttling](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/throttling) - Ограничение ресурсов ИС
- [TODO](https://photos.app.goo.gl/VaUseEzeFcvSJj6U9)
- отказоустойчивость и масштабирование MariaDB и RabbitMQ в основе лежит разделение баз и брокеров по сервисам.
- Избегайте состояния (__stateless__) в вашем приложении
- [Балансировка](../pattern/deployment/load.balancing.md)
- [Big data](../style/bigdata.md)

## Метрики

- [доступность сервиса (время простоя)](https://bigdataschool.ru/blog/sre-indicators-devops-itil.html) (A) за конкретный период зависит от планового значения этого показателя (B) и суммарного времени простоев (C)  A = (B - C)/ B * 100 %
  - важно определить __максимально возможное время простоя__ и его цену
- RTO (__Recovery Time Objective__, целевое время восстановления) – промежуток времени, в течение которого __система может оставаться недоступной в случае аварии__, т.е. время, необходимое для восстановления полного функционирования сервиса после наступления аварийного события.
- Процент времени, в течение которого ваш API работает и способен обрабатывать запросы
  - ping
  - [Health check](#health-checks)
- __Circuit Breaker Trips__
  - If you're using the circuit breaker pattern to handle failures, you might track how often the circuit breaker is tripped. This can give you a sense of how often your API or its dependencies are failing.

## Технологии

### Health checks

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
- [Traefik](../../technology/middleware/api.gateway/gw.traefik.md)  
  - Configure health check to remove unhealthy servers from the load balancing rotation. Traefik will consider your servers healthy as long as they return status codes between 2XX and 3XX to the health check requests (carried out every interval).
- K8s
  - Kubernetes has an health check mechanism to remove unhealthy pods from Kubernetes services (cf __readiness probe__). As unhealthy pods have no Kubernetes endpoints.
- [Zabbix](https://www.zabbix.com/documentation/current/en/manual/web_interface/frontend_sections/reports/availability)
- [PRTG](https://www.paessler.com/server-uptime)
- [KUMA](https://github.com/louislam/uptime-kuma)
  - интеграция с [Traefik](https://www.paulsblog.dev/use-docker-uptime-kuma-and-traefik-to-monitor-your-website/)
