# BPMN нотация

## Зачем

Нотация моделирования, описания [бизнес процессов](analytica.md#бизнес-процесс-бп):

- [Виды шлюзов](https://bpmn2.ru/blog/vse-shluzi-v-bpmn-s-primerami/)

## Паттерны

- __Не использовать__ для [описания](https://bpmn2.ru/blog/5-nepravilnix-sposobov-ispolzovat-bpmn):
  - __инструкций__ пользователей
  - __алгоритмов__ ПО (можно использовать Data Flow Diagrams (DFD))
  - переходы клиента __по страницам__ (можно использовать UserFlow Diagrams)
  - __Состояния сущности__ (UML State Diagram)
  - __Интеграции приложений__ между друг другом (можно использовать UML Sequence Diagram)

## Технологии

- [дизайнеры](https://stormbpmn.com/compare), варианты [BPMS](../arch/system.class/bpms.md)
  - visio
  - bizagi
  - stormbpmn
  - [camunda modeler](../technology/middleware/bpms/camunda.md)
