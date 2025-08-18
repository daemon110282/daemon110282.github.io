# Паттерны интеграций

- [Паттерны интеграций](#паттерны-интеграций)
  - [Виды (стили) интеграций](#виды-стили-интеграций)
  - [Критерии выбора](#критерии-выбора)
  - [Паттерны](#паттерны)
  - [Технологии](#технологии)

## Виды (стили) интеграций

[Виды (стили) интеграций](https://www.enterpriseintegrationpatterns.com/patterns/messaging/IntegrationStylesIntro.html)

- Пользователи
- Данные
  - [ETL (Extract, Transform, Load)](https://python.ivan-shamaev.ru/etl-best-practices-design-data-patterns/)
  - [ELT (Extract, Load, Transform)](https://www.striim.com/blog/data-integration/)
    - [ELT vs ETL](https://coderlessons.com/tutorials/bolshie-dannye-i-analitika/teoriia-khraneniia-dannykh/5-etl-protiv-elt)
  - [Shared Database\Table Шлюзовая БД (ШБД)](pattern.shareddb.md)
  - Файловый обмен
    - [Распределенные файловые системы](../../../technology/filesystem/filesystem.md)
      - [Object Storage](../../../technology/store/object.storage.md)
    - [Upload File](pattern.uploadfile.md)
    - [Download File](../../../api/api.rest.md)
    - [CDN](../../system.class/cdn.md) реализует паттерн [Static content hosting](https://learn.microsoft.com/en-us/azure/architecture/patterns/static-content-hosting)
    - Протокол [WebDAV](https://xakep.ru/2014/09/09/webdav/) HTTP API (IIS, Apache support) для подключения сайтов как сетевых дисков
- Приложения
  - Direct
    - [API REST](../../../api/api.md)
    - SOAP, [WCF](../../../technology/protocols.integration/wcf.md), ODATA
    - [GraphQL](../../../technology/protocols.integration/graphql.md)
  - Remote Procedure Invocation (RPC)
    - __Двунаправленная связь__ для обмена сообщениями между клиентом и сервером
      - протокол __WebSocket__
    - __Однонаправленная связь__
      - HTML спецификация [Server Sent Events](../../../technology/protocols.integration/sse.md)
      - [gRPC](../../../technology/protocols.integration/grpc.md)
  - Middleware
    - [Message-oriented](pattern.messagebroker.md)
      - Advanced transient messaging
      - Message-oriented persistent
      - log-based message queue
    - [API Gateway](../deployment/api.gateway.md)
    - [SOA](../../style/soa.md)

## Критерии выбора

Способа интеграции:

- Производительность (RPS)?
  - менее 10? RPS
    - RPC + LB (API GW)
  - более Х RPS?
    - MessageBus
      - RMQ 20k RPS
- Схема интеграции
  - Точка-точка Point2Point
  - Издатель-Подписчики Pub-Sub
- Возможность использовать выбранный способ интеграции для всех приложений, участвующих в интеграции
- Возможность внесения изменений в приложения
- Требования к обеспечению надежности
- Уровень связанности приложений
- Временные задержки доставки данных (Latency)
- Требования к защите данных

## Паттерны

- [Messaging Patterns](pattern.messagebroker.md)
- [RPC Команды\Запросы](pattern.rpc.md)
  - [Request-Reply](https://www.enterpriseintegrationpatterns.com/patterns/messaging/RequestReply.html)
  - Async Request-Reply
- [Обработка сбоев: Retry Policy, Rate Limit, Circuit Breaker](../system.design/fault.tolerance/pattern.failure.md)
- Sidecar - паттерн интеграции между приложением и сервисом, развернутый на стороне приложения
  - Отвечает за развертывание компонентов приложения в отдельном процессе или контейнере для обеспечения изоляции и инкапсуляции
  - Сквозная функциональность
- Ambassador Посредник
  - nginx
- Anti-Corruption Layer
- [DbC - Design by contract](https://habr.com/ru/company/southbridge/blog/679906/)
- [Fault Tolerance](../system.design/fault.tolerance/pattern.failure.md): Retry Policy, Circuit Breaker, Rate Limit

TODO

- см. EIP <https://www.enterpriseintegrationpatterns.com/patterns/messaging/>
  - <https://ducmanhphan.github.io/2020-08-10-Introduction-to-Enterprise-Integration-Patterns/>
- <https://medium.com/nuances-of-programming/краткий-обзор-10-популярных-архитектурных-шаблонов-приложений-81647be5c46f>
- TODO <https://github.com/Sairyss/distributed-systems-topics>

## Технологии

- SOA
  - [ESB](../../../technology/middleware/esb.md)
- [Распределенные файловые системы](../../../technology/filesystem/dfs.md)
- GraphQL
- SOAP
- RPC
  - [WebSocket](../../../technology/protocols.integration/websocket.md)
  - [Server Sent Events](../../../technology/protocols.integration/sse.md)
  - gRPC
