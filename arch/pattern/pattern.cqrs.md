# CQRS

## Команда

![command](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/media/microservice-application-layer-implementation-web-api/high-level-writes-side.png)

- это запрос к системе на выполнение действия, [которое изменяет состояние системы](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/microservice-application-layer-implementation-web-api#implement-the-command-and-command-handler-patterns). Команды являются императивными и должны обрабатываться только один раз
- Команды имеет смысл делать [идемпотентными](idempotent.md), если этого требуют бизнес-правила и инварианты предметной области.
- Команда — это объект передачи данных (DTO) особого типа, предназначенный специально для запроса изменений или транзакций.

### Обработчик комманд

[Обработчик комманд](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/microservice-application-layer-implementation-web-api#the-command-handler-class)
- [FAQ](https://cqrs.nu/Faq/command-handlers)

Конвейер обработки команд: активация обработчика команд - [Медиатор](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/microservice-application-layer-implementation-web-api#the-command-process-pipeline-how-to-trigger-a-command-handler)

![mediator](https://docs.microsoft.com/ru-ru/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/media/microservice-application-layer-implementation-web-api/mediator-cqrs-microservice.png)

## Запрос
