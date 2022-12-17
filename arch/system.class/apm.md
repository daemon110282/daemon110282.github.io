# Application Performance monitoring (APM)

Класс систем Application Perfomance Monitoring (APM).

Функции:

- Агенты сбора метрик
- Distributed Tracing
- Дашборды
- Алерты
- Real User Monitoring (RUM)

[SPA](style/spa.md):

- JavaScript errors
- Framework-specific issues
- Network request failure
- Performance issues
- User experience problems

## Pattern

- [RED method for MSA](https://thenewstack.io/monitoring-microservices-red-method/)
  - Rate (R): The number of requests per second.
  - Errors (E): The number of failed requests.
  - Duration (D): The amount of time to process a request.
- [Автотесты UI в ПРОДе](https://nedmcclain.medium.com/frontend-monitoring-with-prometheus-38f798406125) и экспорт в Prometheus результатов

## Технологии

- [Monitoring](../technology/monitoring.md)