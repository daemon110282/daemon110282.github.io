# RMQ multi-tenancy

## By Virtual host (VH)

- auth, разграничение доступа к данным
- масштабирование по юл,
- Export import config VH
- Http api создание, управление VH
- Минусы:
  - изменения очередей и тп как накатывать на все ЮЛ?
  - Config alter есть? Policy, генерация из кода

## By topic

- topic pattern and Routing/binding key per customer is better than vhost due to resource consumption overhead (for us rabbitmq console is internal/not exposed to customers).
- direct, topic, headers and fanout

TODO

- Exchange to exchange binding