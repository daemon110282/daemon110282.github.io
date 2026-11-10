# BPMN нотация

## Зачем

Нотация моделирования, описания [бизнес процессов](analytica.bt.md#бизнес-процесс-бп):

- [Виды шлюзов](https://bpmn2.ru/blog/vse-shluzi-v-bpmn-s-primerami/)

## Паттерны

- BPMN предназначена
  - для [бизнес-специалистов](https://creately.com/guides/bpmn-vs-uml/)
  - моделирование, анализ и оптимизация __бизнес-процессов__
- а UML (Use Case, Sequence, Class)
  - для системных аналитиков или разработчиков систем
  - требования к моделированию выходят за рамки бизнес-процессов и включают аспекты разработки программного обеспечения, такие как __архитектура системы, структуры классов и динамическое поведение__
- __Не использовать__ для [описания](https://bpmn2.ru/blog/5-nepravilnix-sposobov-ispolzovat-bpmn):
  - __инструкций__ пользователей
  - __алгоритмов__ ПО (можно использовать Data Flow Diagrams (DFD))
  - переходы клиента __по страницам__ (можно использовать UserFlow Diagrams)
  - __Состояния сущности__ (можно использовать UML State Diagram)
  - __Интеграции приложений__ между друг другом (можно использовать UML Sequence Diagram)

## Технологии

- [дизайнеры](https://stormbpmn.com/compare), варианты [BPMS](../arch/system.class/bpms.md)
  - visio
  - bizagi
  - stormbpmn
  - [camunda modeler](../technology/middleware/bpms/camunda.md)
