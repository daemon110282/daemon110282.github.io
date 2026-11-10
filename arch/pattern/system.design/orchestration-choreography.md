# Оркестрация Orchestration и Хореография Choreography

- [Оркестрация Orchestration и Хореография Choreography](#оркестрация-orchestration-и-хореография-choreography)
  - [Зачем](#зачем)
  - [TODO](#todo)
  - [Оркестрация](#оркестрация)
  - [Хореография](#хореография)
  - [Технологии](#технологии)

## Зачем

- Оркестратор - ИС которая управляет изменениями в Х ИС
- Хореография - Каждая ИС сама подписывается на события в Шине Сообщений и реагирует на изменения
  - Паттерн Распределенных транзаций [SAGA](../integration/pattern.saga.md)

## TODO

- [пример](https://learn.microsoft.com/ru-ru/azure/architecture/patterns/choreography#example)
- https://babok-school.ru/blog/orchestration-and-choreography-of-microservices-in-eda/
- https://techcommunity.microsoft.com/t5/azure-integration-services/orchestration-vs-choreography-how-to-pick-the-right-integration/m-p/3792149
- https://solace.com/blog/microservices-choreography-vs-orchestration/
- https://camunda.com/blog/2023/02/orchestration-vs-choreography/

- совместить подходы
	- в отдельных ограниченных контекстах допустима оркестрация

## Оркестрация

- Вместо нее UI APP – use case – умный

## Хореография

Плюсы:

- Отсутствует системная связь (coupling). Каждый процесс независим от других. Процесс E2E осуществляется с помощью хореографии различных процессов

## Технологии

- Хореография
  - [Debezium + Kafka](https://habr.com/ru/companies/redhatrussia/articles/575844/)
  - serverless saga pattern by using AWS Step Functions
  - [MassTransit example](https://habr.com/ru/company/true_engineering/blog/412793/)
  - <https://axoniq.io>
  - <https://eventuate.io/abouteventuatetram.html>
  - <https://github.com/eclipse/microprofile-lra>
  - <https://github.com/jbosstm/narayana/tree/master/rts/lra>
  - Apache [Camel Saga](https://camel.apache.org/components/4.8.x/eips/saga-eip.html)
  - NServiceBus [Saga](https://docs.particular.net/nservicebus/sagas/)
- Spring Integration
- Mule ESB
- BPEL (business process execution language)
- Оркестрация
  - [BPMS](../../system.class/bpms.md)
    - [camunda](https://camunda.com/blog/2018/08/bpmn-microservices-orchestration-part-2-graphical-models/)
  - Apache [Airflow](/technology/apache.airflow.md)
  - Azure Durable Functions
