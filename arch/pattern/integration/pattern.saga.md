# SAGA

## Зачем

- Чтобы отказаться от [two phase commit](https://neerc.ifmo.ru/wiki/index.php?title=2_Phase_Commit) в распределенной среде - плохо масштабируемый алгоритм.
- __Распределенная транзакция - зло__, необходимо избегать разделяя правильно на ограниченные контексты [DDD](../system.design/ddd.md)
- Паттерн обеспечения согласованности(консистентности) данных при распределенных (бизнес) транзакциях, решает проблемы производительности Long Lived Trasactioin (LLT).
- Решения по обеспечению надёжности (констистентности) транзакций, стали востребованы в микросервисной архитектуре.
- Сага состоит из действий (actions) направленных на обеспечение консистентности транзакций, включая компенсации, и является при этом неатомарной единицей (unit) консистентности
- При реализации саг особое внимание нужно уделять изоляции

Транзакция (договор) - механизм сохранения консистентности данных при нескольких логически связанных последовательных изменениях состояния. Должна быть выполнена только полностью. Транзакции должны быть атомарными, согласованными, изолированными и устойчивыми (ACID).

- [Backward recovery](https://learn.microsoft.com/ru-ru/azure/architecture/reference-architectures/saga/saga)
- Forward recovery
- Компенсирующие действия
- Реализация при помощи [Оркестровки или Хореографии](../system.design/orchestration-choreography.md)

TODO

- <https://www.bigdataschool.ru/blog/architecture-patterns-for-distributed-systems.html> 
- https://t.me/microservices_arch/307
- https://t.me/ru_arc/112

Состоит из:

- машины состояний [state machine](../development/pattern.state.machine.md)
- наблюдателя (Observer) для логирования

## Паттерны


## Технологии

- [Debezium + Kafka](https://habr.com/ru/companies/redhatrussia/articles/575844/)
- serverless saga pattern by using AWS Step Functions
- [MassTransit example](https://habr.com/ru/company/true_engineering/blog/412793/)
