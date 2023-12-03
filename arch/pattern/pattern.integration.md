# Паттерны интеграций

- [Паттерны интеграций](#паттерны-интеграций)
  - [Виды (стили) интеграций](#виды-стили-интеграций)
  - [Критерии выбора способа интеграции](#критерии-выбора-способа-интеграции)
  - [Паттерны](#паттерны)
  - [Технологии](#технологии)

## Виды (стили) интеграций

[Виды (стили) интеграций](https://www.enterpriseintegrationpatterns.com/patterns/messaging/IntegrationStylesIntro.html)

- Пользователи
- Данные
  - [ETL (Extract, Transform, Load)](https://python.ivan-shamaev.ru/etl-best-practices-design-data-patterns/)
  - [ELT (Extract, Load, Transform)](https://www.striim.com/blog/data-integration/)
    - [ELT vs ETL](https://coderlessons.com/tutorials/bolshie-dannye-i-analitika/teoriia-khraneniia-dannykh/5-etl-protiv-elt)
  - [Shared Database\Table Шлюзовая БД (ШБД)](integration/pattern.shareddb.md)
  - Файловый обмен
    - [Распределенные файловые системы](../../technology/filesystem/filesystem.md)
      - [Object Storage](../../technology/filesystem/object.storage.md)
    - [Upload File](integration/pattern.uploadfile.md)
    - [Download File](../../api/api.rest.md)
    - [CDN](../system.class/cdn.md) реализует паттерн [Static content hosting](https://learn.microsoft.com/en-us/azure/architecture/patterns/static-content-hosting)
    - Протокол [WebDAV](https://xakep.ru/2014/09/09/webdav/) HTTP API (IIS, Apache support) для подключения сайтов как сетевых дисков
- Приложения
  - Direct
    - [API REST](../../api/api.md)
    - SOAP, [WCF](../../technology/protocols.integration/wcf.md), ODATA
    - [GraphQL](../../technology/protocols.integration/graphql.md)
  - Remote Procedure Invocation (RPC)
    - __Двунаправленная связь__ для обмена сообщениями между клиентом и сервером
      - протокол __WebSocket__
    - __Однонаправленная связь__
      - HTML спецификация [Server Sent Events](../../technology/protocols.integration/sse.md)
      - [gRPC](../technology/../../technology/protocols.integration/grpc.md)
  - Middleware
    - [Message-oriented](integration/pattern.messagebroker.md)
      - Advanced transient messaging
      - Message-oriented persistent
      - log-based message queue
    - [API Gateway](../../api/api.gateway.md)
    - [SOA](../../technology/middleware/soa.md)
    - [ESB Интеграционная шина](../../technology/middleware/esb.md) ![scheme](../../img/pattern/integration/esb.jpg)

## Критерии выбора способа интеграции

- Возможность использовать выбранный способ интеграции для всех приложений, участвующих в интеграции
- Возможность внесения изменений в приложения
- Требования к обеспечению надежности
- Уровень связанности приложений
- Временные задержки доставки данных
- Требования к защите данных

## Паттерны

TODO см. EIP

- [Messaging Patterns](integration/pattern.messagebroker.md)
- [RPC Команды\Запросы](integration/pattern.rpc.md)
- [Обработка сбоев: Retry Policy, Rate Limit, Circuit Breaker](pattern.failure.md)
- Sidecar
- Ambassador Посредник
  - nginx
- Anti-Corruption Layer
- Async Request-Reply

[TODO](https://habr.com/ru/company/southbridge/blog/679906/)
[UMP](https://airtable.com/embed/shr8hjWhgmcRMq8ZT/tblRsPPtXXbYI4IzT)

TODO
- https://mxsmirnov.com/2010/06/27/%d1%81%d1%86%d0%b5%d0%bd%d0%b0%d1%80%d0%b8%d0%b8-%d0%b8%d0%bd%d1%82%d0%b5%d0%b3%d1%80%d0%b0%d1%86%d0%b8%d0%b8-%d0%bf%d1%80%d0%b8%d0%bb%d0%be%d0%b6%d0%b5%d0%bd%d0%b8%d0%b9/#more-357
- http://citforum.ru/SE/project/pattern/p_4.shtml
- https://www.enterpriseintegrationpatterns.com/patterns/messaging/
- https://mcs.mail.ru/blog/26-osnovnyh-patternov-mikroservisnoj-razrabotki/amp
- https://www.bigdataschool.ru/blog/architecture-patterns-for-distributed-systems.html
- https://medium.com/nuances-of-programming/краткий-обзор-10-популярных-архитектурных-шаблонов-приложений-81647be5c46f
- https://success.outsystems.com/Documentation/Best_Practices/Architecture/Designing_the_Architecture_of_Your_OutSystems_Applications/Integration_Patterns_for_Core_Services_Abstraction
- https://ducmanhphan.github.io/2020-08-10-Introduction-to-Enterprise-Integration-Patterns/
- https://habr.com/ru/company/southbridge/blog/679906/
- TODO https://github.com/Sairyss/distributed-systems-topics

## Технологии

- [ESB](../../technology/middleware/esb.md)
- [Распределенные файловые системы](../../technology/filesystem/dfs.md)
- RPC
  - [WebSocket](../../technology/protocols.integration/websocket.md)
  - [Server Sent Events](../../technology/protocols.integration/sse.md)
