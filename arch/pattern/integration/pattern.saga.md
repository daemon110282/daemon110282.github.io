# SAGA

## Зачем

Паттерн для Распределенных транзаций

- __последовательность транзакций__, которые обновляют каждую службу
- и __публикуют сообщение или событие__ для __активации следующего шага транзакции__
- Если шаг __завершается ошибкой__, SAGA выполняет __компенсирующие действия транзакции__, которые противодействуют предыдущим локальным транзакциям
- Паттерн обеспечения согласованности(консистентности) данных при распределенных (бизнес) транзакциях, решает __проблемы производительности Long Lived Trasactioin__ (LLT).
- Решения по обеспечению надёжности (констистентности) транзакций, стали востребованы в __микросервисной архитектуре__ MSA
- SAGA состоит из действий (actions) направленных на обеспечение __консистентности транзакций__ и является при этом неатомарной единицей (unit) консистентности
- При реализации SAGA особое внимание нужно __уделять уровням изоляции__

Транзакция (договор) - механизм сохранения консистентности данных при нескольких логически связанных последовательных изменениях состояния. Должна быть выполнена только полностью. Транзакции должны быть атомарными, согласованными, изолированными и устойчивыми (ACID).

TODO

- [Хореографии или Оркестрации](https://developers.redhat.com/articles/2021/09/21/distributed-transaction-patterns-microservices-compared)
- [Backward recovery](https://learn.microsoft.com/ru-ru/azure/architecture/reference-architectures/saga/saga)
- Forward recovery

## Плюсы-минусы

Плюсы:

- __децентрализованный подход__, не использует центральный контроллер
  - Чтобы отказаться от [Two phase commit](pattern.2pc.md) в распределенной среде - плохо масштабируемый алгоритм

Минусы:

- Сложность
  - __Распределенная транзакция - зло__, необходимо избегать разделяя правильно на ограниченные контексты [DDD](../system.design/ddd.md)
- не полная поддержка ACID принципов транзакции: __Isolation не обеспечивается__. Локальные транзакции комитятся и другие транзакции уже видят их, но в итоге SAGA может быть отменена с компенсаций
  - решается False Negative (Вася забронировал Audi, а Петя уже не смог и купил Ford, а затем сбой у Васи и Audi свободна)

## Паттерны

- машины состояний [state machine](../development/pattern.state.machine.md)
- наблюдателя (Observer) для логирования
- Реализация при помощи [Хореографии](../system.design/orchestration-choreography.md) или __Оркестрации__
- Для повышения надежности при асинхронном обмене событиями через Message Broker используется __Transactional Outbox__

## Технологии

- Хореография [Debezium + Kafka](https://habr.com/ru/companies/redhatrussia/articles/575844/)
- serverless saga pattern by using AWS Step Functions
- [MassTransit example](https://habr.com/ru/company/true_engineering/blog/412793/)
- <https://axoniq.io>
- <https://eventuate.io/abouteventuatetram.html>
- <https://github.com/eclipse/microprofile-lra>
- <https://github.com/jbosstm/narayana/tree/master/rts/lra>
- Оркестрация
  - [camunda](https://camunda.com/blog/2018/08/bpmn-microservices-orchestration-part-2-graphical-models/)
  - Apache Airflow
  - Azure Durable Functions
  - Apache [Camel Saga](https://camel.apache.org/components/4.8.x/eips/saga-eip.html)
  - NServiceBus [Saga](https://docs.particular.net/nservicebus/sagas/)
