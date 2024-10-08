# Java Spring Framework

## Зачем

Универсальный фреймворк с __открытым исходным кодом__ для Java-платформы. Обеспечивает базовую поддержку управления зависимостями, управление транзакциями веб-приложений, доступ к данным, обмен сообщениями.

Типы приложений: Веб, декстоп, мобильный, консольные

## Модули

- Spring Core:
  - AOP
  - IoC (DI)
  - Component Abstraction
  - i18n
- Spring Web: позволяет предоставлять [__API__ для потребителя](https://habr.com/ru/companies/skillfactory/articles/811769/)
- Spring Web MVC: реализация паттерна [MVC](https://practicum.yandex.ru/blog/framework-spring-java/)
- Spring Test: предоставляет инструментарий для написания
  - юнит
  - интеграционных тестов
  - mock-объекты
  - Spring MVC Test
- Spring Data (DAO):
  - работает с различными видами баз данных, как SQL, так и NoSQL
  - транзакции
  - поддержка DAO, JDBC, ORM
  - Repository
- Spring Security: аутентификация, авторизация
- Spring Integration:
  - интегрирует приложения компании в единую систему
  - удалённое взаимодействие
  - JMS, JCA, JMX
  - электронная почта
  - задачи, планирование
  - кеш
- Spring Boot:
  - конфигурация
  - сборка, запуск приложений, веб-сервер Tomcat
  - проверка работоспособности
  - использование внешней конфигурации
  - [сбор метрик](https://tproger.ru/articles/spring-modules-overview)
- Spring [State Machine](https://spring.io/projects/spring-statemachine)
- Spring Cloud: много полезных инструментов для микросервисов и распределённых систем
- Spring Batch: для пакетной обработки данных
- Spring LDAP
- Spring Roo: используют для создания бизнес-приложений. На его основе можно создать [многофункциональный пользовательский интерфейс](https://ru.hexlet.io/blog/posts/spring-framework)

## Плюсы-минусы

Плюсы:

- Универсальность
- Популярность
- Открытый исходный код

Минусы:

- Сложность
- Объем кода
- Неиспользуемые зависимости

## Функции

- Бин - объект какого-то класса
- Application context - набор бинов (объектов)
- [Автоматическая конфигурация](https://javarush.com/groups/posts/477-spring-dlja-lenivihkh-osnovih-bazovihe-koncepcii-i-primerih-s-kodom-chastjh-2)
- dependency injection

TODO

<https://client.sbertech.ru/docs/public/SEI/3.11/ASGT/3.11.0-1/documents/developer-guide/index.html>

## Deployment

- Test Project
  - [Hello World](https://spring.io/quickstart)
  - [start.spring.io](https://practicum.yandex.ru/blog/framework-spring-java/)
