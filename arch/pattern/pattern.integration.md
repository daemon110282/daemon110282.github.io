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
  - Файловый обмен
    - [Распределенные файловые системы](../../technology/filesystem/filesystem.md)
      - [Object Storage](../../technology/filesystem/object.storage.md)
    - [Upload File](pattern.uploadfile.md)
    - [Download File](../../api/api.rest.md)
    - [CDN](../system.class/cdn.md) реализует паттерн [Static content hosting](https://learn.microsoft.com/en-us/azure/architecture/patterns/static-content-hosting)
    - Протокол [WebDAV](https://xakep.ru/2014/09/09/webdav/) HTTP API (IIS, Apache support) для подключения сайтов как сетевых дисков
- Приложения
  - Direct ([API REST](../../api/api.md), SOAP, WCF, ODATA, GraphQL, gRPC)    
  - Remote Procedure Invocation (RPC)
    - __Двунаправленная связь__ для обмена сообщениями между клиентом и сервером (__протокол WebSocket__).   
    - __Однонаправленная связь__ HTML спецификация [Server Sent Events](https://learn.javascript.ru/server-sent-events) (Server-Side Events)
      - Соединение постоянное, __протокол HTTP__, альтернатива [Polling, Long Polling](https://web.dev/eventsource-basics/) from FrontEnd
        - скорость, равная скорости потоковой передачи в [формате JSON](https://aengel.medium.com/server-sent-events-vs-json-stream-3a9f472120a4)
        - меньше накладных расходов на установление [соединений vs Polling](https://stackoverflow.com/questions/9397528/server-sent-events-vs-polling)
        - Прост в реализации и использовании, как на стороне клиента, так и на стороне сервера, более производителен для сервера, меньше задержка ответа клиента [vs Long Polling](https://www.turtle-techies.com/long-polling-vs-server-sent-events/)
          - Минус: Ограничение, связанное с __количеством соединений, которые могут быть открыты между клиентом и сервером одновременно__
      - Поддержка [97,5% браузеров в 2023 году](https://caniuse.com/eventsource), но IE<11 нет, Edge только
      - [Безопасность на уровне Origin от кого сообщение](https://web.dev/eventsource-basics/#a-word-on-security)
        - [CORS with сredentials](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events) in [Headers API Key (аналогично с fetch)](https://learn.javascript.ru/fetch-crossorigin#neprostye-zaprosy)
  - Middleware
    - [API Gateway](../../api/api.gateway.md)
    - [SOA](../../technology/soa.md)
    - [ESB](../../technology/esb.md)
    - ![Интеграционная шина](../../img/pattern/integration/esb.jpg)
    - [Message Bus](../../technology/rmq.md)
      ![MQ](../../img/pattern/integration/mq.jpg)
      ![MB VS](../../img/pattern/integration/mq.compare.jpg)
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
- RPC 
  - WebSocket
    - signal.ir - кeal-time web functionality enables [server-side code](https://learn.microsoft.com/en-us/aspnet/core/signalr/introduction?view=aspnetcore-7.0) to __push content to clients__ instantly.
    - Vue.js + Node.js + [socket.io](https://blog.openreplay.com/rendering-real-time-data-with-vue-node-and-socket-io)
    - PHP 
      - Node.js + [Laravel Echo](https://laravel.com/docs/5.3/broadcasting#installing-laravel-echo)
      - https://openswoole.com/
      - https://roadrunner.dev/features
      - https://reactphp.org/
    - [Варианты](https://www.educba.com/signalr-alternatives/)
    - [Chat](https://blog.bytebytego.com/i/98040721/how-do-we-design-a-chat-application-like-whatsapp-facebook-messenger-or-discord)
  - Server Sent Events
    - signal.ir
    - Node.js
    - [PHP](https://web.dev/eventsource-basics/#server-examples)
      - [MDN sample](https://github.com/mdn/dom-examples/tree/main/server-sent-events)
    - [vue plugin](https://github.com/tserkov/vue-sse)

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
