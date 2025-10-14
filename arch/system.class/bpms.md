# BPMS

- [BPMS](#bpms)
  - [Зачем](#зачем)
  - [Плюсы и минусы](#плюсы-и-минусы)
  - [Паттерны](#паттерны)
  - [Технологии](#технологии)
    - [Примеры](#примеры)

## Зачем

- [автоматизация процессов BPMN](https://www.g2.com/products/camunda-platform/competitors/alternatives)
- [оркестратора](../pattern/system.design/orchestration-choreography.md) — конвейера, который обрабатывает, например, сущность «заявки»
  - Он по очереди создает клиента, счет и банковскую карту.
  - Если клиент и счет созданы успешно, а создание карты провалилось, заявка не переходит в статус «успешно» и остается в статусе «карта не создана».
  - В будущем фоновая активность подхватит ее и закончит.
  - Система некоторое время находится в состоянии несогласованности, но нас это, в целом, устраивает.

## Плюсы и минусы

Плюсы:

- визуализация всего процесса
- контроль, мониторинг процесса
  - тепловая картв интенсивности процессов
- [управление](https://byndyusoft.com/blogs/orchestrator) распределенными транзакциями

Минусы:

- единая точка отказа

## Паттерны

- Машина состояний [FSM](../pattern/development/pattern.state.machine.md) - это __декларативная модель процесса__. Я не отдаю команды, я объявляю,  декларирую __Правила__:
  - П-1: В системе различаются 5 состояний: A,B,C,D,E;
  - П-2: Система распознаёт 6 сигналов (событий): S1, S2..S6
  - П-3: S2 всегда (DFSM) переводит систему из состояния C в состояние D;
- [BPMN](../../analytic/bp.bpmn.md) - __императивная__ модель процесса
- Моделировать всегда надо Процесс. А не документы, которые лежат на столе у заказчика (как юридические/информационные артефакты процесса)
  - Важны наименования: ОбработкаЗаявки, а не Заявка. Тогда поле ОбработкаЗаявки.Статус (или вообще отдельный, от Обработки
Заявки, механизм FSM) - не будет вызывать вопросов.

## Технологии

- [zeebe-io?](https://blog.bernd-ruecker.com/how-we-built-a-highly-scalable-distributed-state-machine-f2595e3c0422)
- [camunda](../../technology/middleware/bpms/camunda.md)
- [apache activiti](https://habr.com/ru/companies/otus/articles/671360/)
- Apache Airflow
- [ELZA](../../technology/middleware/bpms/elza.md)
- [Activiti framework (Java) 6.0.0](https://www.activiti.org/)
  - [User guide](https://www.activiti.org/userguide/)
  - [REST API](https://habr.com/ru/post/416491/)
  - [Designer Eclipse](https://www.activiti.org/userguide/#eclipseDesignerInstallation)
- [n8n](https://n8n.io/features/) Low Code

### Примеры

- [camunda](https://github.com/berndruecker/flowing-retail)
