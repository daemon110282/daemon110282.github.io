# Оркестрация Orchestration и Хореография Choreography

- [Оркестрация Orchestration и Хореография Choreography](#оркестрация-orchestration-и-хореография-choreography)
	- [Зачем](#зачем)
	- [TODO](#todo)
	- [Оркестрация](#оркестрация)
	- [Хореография](#хореография)
	- [Технологии](#технологии)

## Зачем

- Оркестратор - ИС которая управляет изменениями в Х ИС
- Хореография - Каждая ИС сама подписывается на события в Шине Сообщений и реагирует на изменния

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

- Spring Integration, Apache Camel, Mule ESB
- BPEL (business process execution language)
- [BPMS](../../system.class/bpms.md)
