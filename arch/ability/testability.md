# Тестопригодность Testability

![layers](https://miro.medium.com/max/720/0*TQUiJY3Qomuz4vIK.webp)

[Паттерны](../pattern/test.md).

## Виды автоматизированных тестов

В порядке сложности

- unit
- API
- UI
- E2E endtoend Фреймворк сквозного тестирования [включает в себя три части](https://habr.com/ru/companies/otus/articles/681066/):
	- Создание пользовательских функций
	- Создание условий
	- Создание тест-кейсов
- Codestyle
- Integration
- Functional - verifies scenarios from a user's perspective via browser emulation;
- Acceptance - verifies scenarios from a user's perspective in a browser.
- [Load Test](../../technology/ability/performance/load.test.md)

## Виды ошибок

- логическими
- Ui-Формата данных
- Обязанности параметров входящих
- Бизнес правил
- Безопасности
- синтаксическими
- взаимодействия
- компиляционные
- ресурсные
- арифметические
- среды выполнения

## Технологии

- API
	- Postman
	- Insomnia Kong
- UNIT
- UI
	- selenium
- E2E
	- testRigor
	- selenuim
