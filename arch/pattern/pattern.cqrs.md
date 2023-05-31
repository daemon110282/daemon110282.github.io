# CQRS

- [CQRS](#cqrs)
	- [Команда](#команда)
		- [Обработчик комманд](#обработчик-комманд)
	- [Запрос](#запрос)
	- [Паттерны](#паттерны)
	- [Технологии](#технологии)

## Команда

![command](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/media/microservice-application-layer-implementation-web-api/high-level-writes-side.png)
![cqrs](../../img/arch/eda/eda.cqrs.jpg)

- это запрос к системе на выполнение действия, [которое изменяет состояние системы](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/microservice-application-layer-implementation-web-api#implement-the-command-and-command-handler-patterns)
- Команды являются __императивными__ и должны обрабатываться только один раз
- Команды имеет смысл делать [идемпотентными](idempotent.md), если этого требуют бизнес-правила и инварианты предметной области
- Команда — это объект передачи данных (DTO) особого типа, предназначенный специально для запроса изменений или транзакций.

### Обработчик комманд

[Обработчик комманд](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/microservice-application-layer-implementation-web-api#the-command-handler-class):

- [FAQ](https://cqrs.nu/Faq/command-handlers)
- Конвейер обработки команд может активировать обработчик команд способами:
  - в памяти паттерн [Медиатор](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/microservice-application-layer-implementation-web-api#the-command-process-pipeline-how-to-trigger-a-command-handler)
	![mediator](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/media/microservice-application-layer-implementation-web-api/mediator-cqrs-microservice.png)
  - вне процесса через [Command Bus](command.bus.md) on [Message Broker](pattern.messagebroker.md) transport ![cqrs mq](../../img/arch/eda/cqrs.mq.jpg)
    - Реализация паттерна [Command](command.md) и [Command Bus](command.bus.md).

## Запрос

- Чтение это просто «отфильтруй данные и преобразуй их в формат удобный для фронта». Уже фраза - формат удобный для фронта намекает что это __не про домен__.
- Плюс __чтение не оказывает влияние на целостность агрегатов, их инварианты__ 
- В противовес же (как техническое обоснование почему чтению нечего делать в домене) - операции чтения редко требуется вернуть модель в том виде в котором она представлена в домене. Куда чаще это какие-то более плоские ViewModel. Тогда зачем городить для всего этого лишний слой абстракции?
- Представим ситуацию что мы сделали репозиторий и достаём из него пагинированные агрегаты чтобы потом представить их в плоскую модель для отображения таблички на фронте. Операция «достать агрегат» дорогостоящая (в силу того что агрегат почти всегда имеет достаточно сложную иерархическую структуру). Вместо этого мы могли бы сразу написать query которая достанет только необходимые данные и не создаст лишнего оверхеда
- Чтение является бизнес-требованием, но вряд ли его можно назвать бизнес-правилом доменной области. Потребности чтения могут меняться в зависимости от смены фронта или дизайна приложения. Является ли это частью описания жизненного цикла бизнес сущностей в домене?

## Паттерны

- [Command](command.md)
- [Command Bus](command.bus.md)
- [materialized view](https://learn.microsoft.com/ru-ru/azure/architecture/patterns/materialized-view)
- [Event Sourcing](event.sourcing.md)
- Если хранилище чтения и записи единое
Event sourcing не требуется.

## Технологии

- [.Net](https://github.com/heynickc/awesome-ddd#jvm-languages)
	- [eShopOnContainers](https://github.com/dotnet-architecture/eShopOnContainers/search?q=page)
	- [Пример от Jimmy Bogard](https://github.com/jbogard/ContosoUniversityDotNetCore-Pages/search?q=page)
	- Пример реализации [паджинатора](https://github.com/PacktPublishing/Hands-On-Domain-Driven-Design-with-.NET-Core/search?q=page)
- Пример от [Kamil Grzybek](https://github.com/kgrzybek/modular-monolith-with-ddd/search?q=page)
- Пример от [vkhorikov](https://github.com/vkhorikov/SpecPattern/search?q=page)
  - https://github.com/vkhorikov/SpecificationPattern/search?q=page
