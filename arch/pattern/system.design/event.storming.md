# Event Storming

Метод, который смещает акцент у __событий__ с технического на организационный и бизнес уровни и помогает [создать __устойчивую модульную систему__](https://habr.com/ru/companies/oleg-bunin/articles/537862/).

## Зачем

- помогает быстро получить __стратегический дизайн__, определив границы, в рамках которых технические решения можно принимать автономно
- Общее __понимание бизнеса__
- __снижает риски__ декомпозиции на сервисы  и __реализации распределенного монолита__. В монолите проще провести рефакторинг, микросервисы как распределенный монолит - дорого рефакторить из за интеграций.  
- Если преднамеренно не нарушать границы на уровне реализации, то зависимости не появятся
- Появляется возможность __эволюционного развития__ к целевому видению

Примеры

- [IBM sample event-storming analysis](https://ibm-cloud-architecture.github.io/refarch-kc/implementation/event-storming-analysis/)
- [IBM sample Event-storming](https://www.ibm.com/cloud/architecture/architecture/practices/event-storming-methodology-architecture/)

## План проведения

![Alt text](../../../img/pattern/ddd/event.storming.plan.jpg)

- можете ли вы разделить __область знаний__ на более мелкие __бизнес-процессы__, которые вы моделируете один за другим в __нескольких циклах__ Event Storming.

![Alt text](../../../img/pattern/ddd/event.storming.elements.jpg)

- Hot Spots - вопросы на подумать

![Alt text](../../../img/pattern/ddd/event.storming.step.jpg)