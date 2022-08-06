# Паттерны интеграций

Виды интеграций

- Пользователи
- Данные
  - [ETL (extract, transform, load)](https://python.ivan-shamaev.ru/etl-best-practices-design-data-patterns/)
  - [ELT (Extract, load, transform)](https://www.striim.com/blog/data-integration/)
    - [elt vs etl](https://coderlessons.com/tutorials/bolshie-dannye-i-analitika/teoriia-khraneniia-dannykh/5-etl-protiv-elt)
  - [Shared Database Шлюзовая БД (ШБД)](pattern.shareddb.md)\Table
  - [Передача файлов](https://www.artofba.com/post/%D0%BE%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5-%D1%82%D1%80%D0%B5%D0%B1%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B9-%D0%BA-%D0%B8%D0%BD%D1%82%D0%B5%D0%B3%D1%80%D0%B0%D1%86%D0%B8%D0%B8-%D1%87%D0%B0%D1%81%D1%82%D1%8C-1-%D1%84%D0%B0%D0%B9%D0%BB%D0%BE%D0%B2%D1%8B%D0%B9-%D0%BE%D0%B1%D0%BC%D0%B5%D0%BD)
- Приложения
  - Direct (API REST, SOAP, WCF, ODATA, GraphQL, gRPC)
    - RPC
  - Middleware (API Gateway, RMQ, SOA, ESB)
    - RPC

## Критерии выбора способа интеграции

- Возможность использовать выбранный способ интеграции для всех приложений, участвующих в интеграции
- Возможность внесения изменений в приложения
- Требования к обеспечению надежности
- Уровень связанности приложений
- Временные задержки доставки данных
- Требования к защите данных

## Паттерны

- Circuit Breaker
- Sidecar
- Ambassador
- Anti-Corruption Layer
- Async Request-Reply

[TODO](https://habr.com/ru/company/southbridge/blog/679906/)

## Технологии

- ESB
  - Enterprise Integration Patterns
    - Spring Integration
    - Mule ESB
    - Apache Camel
    - IBM Integration Bus
  
## Links

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