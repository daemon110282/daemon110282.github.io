# Паттерны интеграций

- [Паттерны интеграций](#паттерны-интеграций)
  - [Критерии выбора способа интеграции](#критерии-выбора-способа-интеграции)
  - [Паттерны](#паттерны)
  - [Технологии](#технологии)
  - [Links](#links)


[Виды (стили) интеграций](https://www.enterpriseintegrationpatterns.com/patterns/messaging/IntegrationStylesIntro.html)

- Пользователи
- Данные
  - [ETL (Extract, Transform, Load)](https://python.ivan-shamaev.ru/etl-best-practices-design-data-patterns/)
  - [ELT (Extract, Load, Transform)](https://www.striim.com/blog/data-integration/)
    - [ELT vs ETL](https://coderlessons.com/tutorials/bolshie-dannye-i-analitika/teoriia-khraneniia-dannykh/5-etl-protiv-elt)
  - [Shared Database\Table Шлюзовая БД (ШБД)](pattern.shareddb.md)
  - [Файловый обмен, Распределенные файловые системы](pattern.uploadfile.md)
- Приложения
  - Direct ([API REST](../../api/api.md), SOAP, WCF, ODATA, GraphQL, gRPC)
  - Remote Procedure Invocation (RPC)
  - Middleware
    - [API Gateway](../../api/api.gateway.md)
    - [SOA](../../technology/soa.md)
    - [ESB](../../technology/esb.md)
    - ![Интеграционная шина](../img/pattern/integration/IMG_20220614_180434_1.jpg)
    - [Message Bus](../../technology/rmq.md)
      ![MQ](../../img/pattern/integration/IMG_20220614_180420.jpg)
      ![MB VS](../../img/pattern/integration/IMG_20220614_180525_1.jpg)
      - Транспорт  
        - [RMQ](../../technology/rmq.md)
        - Kafka

## Критерии выбора способа интеграции

- Возможность использовать выбранный способ интеграции для всех приложений, участвующих в интеграции
- Возможность внесения изменений в приложения
- Требования к обеспечению надежности
- Уровень связанности приложений
- Временные задержки доставки данных
- Требования к защите данных

## Паттерны

TODO см. EIP

- [Messaging Patterns](https://www.enterpriseintegrationpatterns.com/patterns/messaging/)
  - [MS](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/category/messaging)
  - Pub\Sub События
  - Task (Worker) Queue
- [RPC Команды\Запросы](pattern.rpc.md)
- [Обработка сбоев: Retry Policy, Rate Limit, Circuit Breaker](pattern.failure.md)
- Sidecar
- Ambassador Посредник
  - nginx
- Anti-Corruption Layer
- Async Request-Reply

[TODO](https://habr.com/ru/company/southbridge/blog/679906/)
[UMP](https://airtable.com/embed/shr8hjWhgmcRMq8ZT/tblRsPPtXXbYI4IzT)

## Технологии

- [ESB](../../technology/esb.md)
- [Распределенные файловые системы](../../technology/dfs.md)

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
- TODO https://github.com/Sairyss/distributed-systems-topics
