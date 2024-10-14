# Паттерны Реализации

## ООП

- [Паттерн спецификация - бизнес условия для фильтрации данных](https://habr.com/ru/post/171559/)
- [BackgroundJob](background.job.md)
- [CommandBus](command.bus.md)
- [FSM Конечный автомат](pattern.state.machine.md)
  
## GOF

[Cheat sheet](https://habr.com/ru/articles/210288/).

[GOF](https://backendinterview.ru/architecture/gof.html) (23 шаблона):

- Поведения (behavior)
  - Цепочка обязанностей [Chain of Responsibility](chainofresp.md)
  - Команда [Command](command.md) - объект команды заключает в себе __само действие и его параметры__
  - Посредник [Mediator](mediator.md)
  - Interpreter  
  - Итератор Iterator  
  - Observer
  - State
  - Strategy - определяет __семейство схожих алгоритмов__ и помещает каждый из них __в отдельный класс__, после чего алгоритмы можно __взаимозаменять__ прямо во время __исполнения программы__
  - Template Method
  - Visitor  
  - Memento
- Порождающие (creational)
  - Паттерн Abstract Factory - __интерфейс__ для __создания группы связанных\зависимых объектов__
  - Паттерн Builder
  - Паттерн Factory Method
  - Паттерн Prototype
  - Паттерн [Singleton](https://sky.pro/media/primery-patternov-proektirovaniya-gof-v-bazovyh-bibliotekah-java/) - гарантирующий, что в __однопоточном приложении__ будет __единственный экземпляр__ класса с глобальной точкой доступа
- Структурные (structural)
  - Паттерн Adapter - организации __использования функций__ объекта, __недоступного для модификации__, через специально созданный __интерфейс__
  - Паттерн Bridge
  - Паттерн Сomposite
  - Паттерн Decorator - позволяет __динамически добавлять__ объектам __новую функциональность__
  - Паттерн Facade - __скрыть сложность__ системы путём сведения всех возможных __внешних вызовов__ к __одному объекту__, делегирующему их соответствующим объектам системы
  - Паттерн Flyweight
  - Заместитель Прокси Proxy - __контролирует доступ__ к другому объекту, __перехватывая__ все __вызовы__ (выполняет функцию контейнера)
- TODO
