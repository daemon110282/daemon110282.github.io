# Рефакторинг кода

- [Рефакторинг кода](#рефакторинг-кода)
	- [Зачем](#зачем)
		- [Паттерны](#паттерны)

Паттерны распила [монолита](../../style/monolit.md) на [MSA](../../style/msa.md)

## Зачем

Часть [рефакторинга монолита](monolit2msa.md).

- Рефакторинг - это процесс __улучшения структуры кода без изменения его поведения__.
- Большинство инженерных проблем возникает из-за беспорядка, который мы имеем в коде.
- Writing code is very simple, but writing simple code is the hardest thing there is.
- Написание чистого кода и поддержание его чистоты возможно только путем практики непрерывного рефакторинга.

Цель:

- [simplify design](https://craftbettersoftware.com/p/refactor-like-a-pro)
- improve namings
- identify and remove code smells
- use design patterns for common problems
- improve testability and maintainability

Ошибки:

- Нет тестов: Test-Driven Development (TDD)
- Изменение поведения при рефакторинге

### Паттерны

![Схема](../../../out/arch/pattern/refactoring/monolit2msa/(@id=code).svg)

- Слои приложения разделить: UI-BLL-DAL
- Выявить зависимости между ФБ
  - Выносить Вышестоящие ФБ первыми без зависимостей от Нижестоящих (внешние вызовы). Паттерн __"Фикус-удавка" (strangler fig app)__ - [параллельная функциональность](https://habr.com/ru/companies/redhatrussia/articles/573720/) с [маршрутизацией запросов](#рефакторинг-интеграций)
  	- Состояние (БД) вынести и возможно потребуется обратно его обновлять
  	- Возможность переключения-отката: монолит-сервис
      	- Ограничение: если изменения функционала происходят в сервисе, откат затрудняется, требуется синхронизировать и монолит. В идеале __фриз измненений__.
  - Иначе (не рекомендуется) выносить Нижестоящие ФБ с зависимостями от Вышестоящих (внутренние вызовы). Паттерн __"Ветвление по абстракции" (branch by abstraction)__
  	- Монолит переключается на абстракцию
  	- Имплементация абстракции AS-IS
  	- Имплементация абстракции адаптера TO-BE к новому сервису
  	- Переключение на TO-BE имплементацию
  		- Тестирование, Rollback если __фриз измненений__
  	- Удаление AS-IS иплементации
- Прокси для трансформации форматов АПИ [Sidecar](https://habr.com/ru/companies/redhatrussia/articles/573720/)
- __Monorepo__
