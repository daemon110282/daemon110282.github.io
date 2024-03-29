# Архитектура

- [Архитектура](#архитектура)
  - [Задачи IT-архитектора](#задачи-it-архитектора)
  - [Процесс](#процесс)
  - [Элементы архитектуры](#элементы-архитектуры)

[Состоит из](https://docs.microsoft.com/ru-ru/azure/architecture/guide/):

- [Стили архитектуры](arch.styles.md)
- [Качества архитектуры, архитектурные характеристики](arch.ability.md)
- [Технологии](../technology/technology.md)
- Приложения
  - [Шаблоны Паттерны](patterns.md)
  - [Reference Architecture](arch.ref.md)
- [Критерии выбора решения](arch.criteria.md)
- [Документирование архитектуры](pattern/pattern.docs.md)

## Задачи IT-архитектора

- __Архитектура ~ architecture__
  - структура системы, включающая все ПО, оборудование и людей, из которых она состоит
  - интерфейсы
    - Требования для интерфейса внешнего устройства ~ external interface requirement — описание интерфейса между системой ПО и пользователем, другой системой ПО или оборудованием.
  - взаимосвязи между этими компонентами и поведение компонентов, видимое другим компонентам
  - технологическая база IT-продукта
- Архитектор знает
  - когда полезно __использовать определенную технологию__
  - самое главное – когда этого не нужно делать
  - какие есть __риски__

Задачи:

- Обеспечить __баланс__ между __стоимостью__ разработки и __гибкостью__ решения для быстрого внедрения __будущих требований__.
  - We design software to reduce its cost. The cost of software is ≈ the cost of changing the software.
    - The cost of changing the software is ≈ the cost of the expensive changes (power laws and all that).
      - The cost of the expensive changes is generated by cascading changes — if I change this then I have to change that and that, and if I change that then.
  - Coupling between elements of a design is this propensity for a change to propagate.
  - So, design ≈ cost ≈ change ≈ big change ≈ coupling. Transitively, __software design ≈ managing coupling__
- Контролировать реализацию: заложить каркас системы и провести __архитектурный надзор__.
- Архитектор __декларирует общие концепции__: аналитик, разработчик реализует их (пример шаблон API, ПЗ)
  - императивное программирование — как сделать. Пример: Купить овощи, замешать, сварить борщ
  - декларативное программирование — __что сделать__. Пример: Сделайте борщ.
    - декларативное программирование по-прежнему использует императивное программирование под капотом, поэтому невозможно писать только декларативный код
- Фиксировать и распространять знания
- Преодолевать разрыв между предметной областью и технической командой
- Предоставлять методики проектирования решений
- Выстраивать матрицу ответственности за сервисы
- Обеспечивать предсказуемость и повторяемость результатов в последующих проектах
- Обеспечивать автономность команд

## Процесс

![process](../img/arch/arch.process.png)
![view](../img/arch/arch.view.png)
![Схема](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/daemon110282/daemon110282.github.io/master/arch/arch.puml)

## Элементы архитектуры

- Сервис — это единица прикладного поведения, заключает полный сценарий
  - Сервис может использовать другие сервисы как части своего сценария
- Система — иерархия сервисов, сгруппированных в домены
- Продукт — это совокупность сервисов, совместно реализующих некоторую ценность для конечного пользователя
  - Границы продукта отражают некоторую предметную область бизнеса
  - Продукты могут использовать общую платформ
- Платформа
  - Платформа является частным случаем продукта для внутренних пользователей
  - Платформы решают задачи обеспечения бизнес-процессов, используемых множеством продуктов
  - Платформа предоставляет набор повторно используемых сервисов
  - Платформа может стать самостоятельным продуктом
