# Site Reliability Engineering (SRE)

## Зачем

- Цель инженера по SRE — обеспечить надёжную работу системы
- определяют, что такое надёжность (стабильность, доступность и т. д.) системы, договариваются о показателях и вырабатывают стандарты действий в случае проблем
- Показатели
  - доступности вырабатываются вместе с продакт-оунером и закрепляются в соглашении о целевом уровне обслуживания — __Service-Level Objective (SLO)__
  - SLI
  - Service Level Agreement (SLA) - Обязанности компании перед клиентами закрепляются. Это соглашение описывает работоспособность всего сервиса и штрафы за превышение времени простоя или другие нарушения.
- four [golden signals](https://sre.google/sre-book/monitoring-distributed-systems/)