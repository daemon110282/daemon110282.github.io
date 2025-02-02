# GRPC

## Зачем

![Alt text](../../img/pattern/integration/rpc.vs.rest.jpg)

- поверх [Http/2](https://www.youtube.com/watch?v=a-sBfyiXysI&ab_channel=ByteByteGo)
  - используется __одно TCP-соединение__, переиспользования одного cокета для нескольких параллельных запросов
  - полного __сжатия данных__
  - контроль трафика
- поддержка __отмены запроса и таймаутов__ из коробки
  - сервер может узнать, как об отмене запроса, так и об истечении таймаута и перестать выполнять запрос на своей стороне
- поддержка как одиночных вызовов, так и __стриминга__
- описание сообщений и самих сервисов осуществляется через некий __Interface Definition Language__ или IDL
- клиент и сервер __генерируются__ при помощи proto-компилятора и gRPC-плагина на основе proto-описания
- __Bi-directional__ - инициации событий с сервера
- [High perf protobuf binary format](https://www.youtube.com/watch?v=gnchfOojMk4&ab_channel=ByteByteGo)

## Плюсы и минусы

Плюсы

- Скорость
- Строгая типизация, версионность
- Серверный стриминг
- поддержка отмены запроса и таймаутов

Минусы

- Бинарный, сложно отлаживать
- uses HTTP/2 as a transport protocol, and [no native browser support exists](https://adjoe.io/company/engineer-blog/working-with-grpc-web/)
  - Для запросов из __браузера__ требуется __библиотека__ и протокол ([grpc-web](https://github.com/grpc/grpc-web)) и __прокси__ (Envoy или [ASP.NET Core gRPC](https://learn.microsoft.com/ru-ru/aspnet/core/grpc/grpcweb))
  - не полная поддержка протокола (Client-side and Bi-directional streaming)

## Паттерны

- [Правила проектирования Google](https://google.aip.dev/general)

## Утилиты

- Linter
  - [Google API Linter](https://linter.aip.dev/)