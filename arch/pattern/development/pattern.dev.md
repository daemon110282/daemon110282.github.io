# Паттерны Реализации

- [Паттерны Реализации](#паттерны-реализации)
  - [Иные](#иные)
  - [ООП](#ооп)
  - [GOF](#gof)
    - [Поведения (behavior)](#поведения-behavior)
    - [Порождающие (creational)](#порождающие-creational)
    - [Структурные (structural)](#структурные-structural)

## Иные

- [Clean Code](cleancode.md)
- [feature toggle](feature.toggle.md)
- [DB name convention](db.name_convention.md)
- [Mock](mock.md)
- [Soft delete](pattern.softdelete.md)
- [Immutability Неизменяемость](immutability.md)
- [DB isolation level](store.isolation.level.md)

## ООП

- [спецификация - бизнес условия для фильтрации данных](https://habr.com/ru/post/171559/)
- [BackgroundJob](background.job.md)
- [CommandBus](GOF/command.bus.md)
- [FSM Конечный автомат](pattern.state.machine.md)
  
## GOF

[Cheat sheet](https://habr.com/ru/articles/210288/).

[GOF](https://backendinterview.ru/architecture/gof.html) (23 шаблона):

- TODO

### Поведения (behavior)

- Цепочка обязанностей [Chain of Responsibility](GOF/chainofresp.md)
- Команда [Command](GOF/command.md) - объект команды заключает в себе __само действие и его параметры__
- Посредник [Mediator](GOF/mediator.md)
- Interpreter  
- Итератор Iterator  
- Observer
- State
- Strategy - определяет __семейство схожих алгоритмов__ и помещает каждый из них __в отдельный класс__, после чего алгоритмы можно __взаимозаменять__ прямо во время __исполнения программы__
- Template Method
- Visitor  
- Memento

### Порождающие (creational)

- Abstract Factory - __интерфейс__ для __создания группы связанных\зависимых объектов__
- Builder
- Factory Method
- Prototype
- [Singleton](https://sky.pro/media/primery-patternov-proektirovaniya-gof-v-bazovyh-bibliotekah-java/) - гарантирующий, что в __однопоточном приложении__ будет __единственный экземпляр__ класса с глобальной точкой доступа

### Структурные (structural)

- Adapter - организации __использования функций__ объекта, __недоступного для модификации__, через специально созданный __интерфейс__
- Bridge
- Сomposite
- Decorator - позволяет __динамически добавлять__ объектам __новую функциональность__
- Facade - __скрыть сложность__ системы путём сведения всех возможных __внешних вызовов__ к __одному объекту__, делегирующему их соответствующим объектам системы
- Flyweight
- Заместитель Прокси Proxy - __контролирует доступ__ к другому объекту, __перехватывая__ все __вызовы__ (выполняет функцию контейнера)
