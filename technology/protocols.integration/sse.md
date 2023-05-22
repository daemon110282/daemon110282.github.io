# Server Sent Events

- [Server Sent Events](#server-sent-events)
	- [Зачем](#зачем)
	- [Плюсы-минусы](#плюсы-минусы)
	- [Модель](#модель)
	- [Patterns](#patterns)
	- [Технологии](#технологии)

## Зачем

Реализует однонаправленную связь в [паттернах интеграции](../../arch/pattern/pattern.integration.md).

[Server Sent Events](https://learn.javascript.ru/server-sent-events) (Server-Side Events):

- Соединение постоянное, __протокол HTTP__, альтернатива [Polling, Long Polling](https://web.dev/eventsource-basics/) from FrontEnd
- скорость, равная скорости потоковой передачи в [формате JSON](https://aengel.medium.com/server-sent-events-vs-json-stream-3a9f472120a4)
- меньше накладных расходов на установление [соединений vs Polling](https://stackoverflow.com/questions/9397528/server-sent-events-vs-polling)
- Прост в реализации и использовании, как на стороне клиента, так и на стороне сервера, более производителен для сервера, меньше задержка ответа клиента [vs Long Polling](https://www.turtle-techies.com/long-polling-vs-server-sent-events/)
- Безопасность 
	- [на уровне клиента по Origin от кого сообщения](https://web.dev/eventsource-basics/#a-word-on-security)
  - на уровне сервера [CORS](cors.md) [with сredentials](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events) in [Headers API Key (аналогично с fetch)](https://learn.javascript.ru/fetch-crossorigin#neprostye-zaprosy)
- built-in support for __reestablishing dropped connections__, as well as recovery of messages the client may have missed while disconnected.
  - By default, if the connection is dropped, then the browser will automatically reestablish the connection. The SSE specification recommends a 2–3 second delay, which is a common default for most browsers, but the server can also set a custom interval at any point by sending a retry command to the client.

## Плюсы-минусы

Плюсы:

- automatic reconnection,
- event IDs
- automatic event parsing

Минусы:

- Ограничение, связанное с __количеством соединений, которые могут быть открыты между клиентом и сервером одновременно__
- Поддержка [97,5% браузеров в 2023 году](https://caniuse.com/eventsource), но IE<11 нет, Edge только
- It only allows data reception from the server (unidirectional)
- Events are limited to UTF-8 (no binary data)

## Модель

[Модель](https://learn.javascript.ru/server-sent-events#format-otveta-servera):

- data - JSON
- event - Event Name - Client subscribe to type of events
	- default [генерирует 3 события](https://learn.javascript.ru/server-sent-events#tipy-sobytiy):
		- message – получено сообщение, доступно как event.data.
		- open – соединение открыто.
		- error – не удалось установить соединение, например, сервер вернул статус 500
- lastEventId - ИД события
- retry - мс на переподключение при обрыве связи

## Patterns

- Адресация сообщений возможна по event
  - пример: ИДПользователя_ДоговорСтатусИзменен, где клиент подписывается на события для конкретного пользователя, сервер ИД пользователя получает при аутентификации.
- Обработка потери соединения
  - Setting an ID lets the browser keep track of the last event fired so that if, the connection to the server is dropped, a special HTTP header (__Last-Event-ID__) is set with the new request. This lets the browser determine which event is appropriate to fire. The message event contains a e.lastEventId property.
server can implement several different strategies:
  - If lost messages are acceptable, then no event IDs or special logic is required: simply let the client reconnect and resume the stream.
  - If message recovery is required, then the server needs to specify IDs for relevant events, such that the client can report the last seen ID when reconnecting.
  - Also, the server needs to implement some form of a __local cache to recover and retransmit missed messages__ to the client.

## Технологии

- signal.ir
- Node.js
- [PHP](https://web.dev/eventsource-basics/#server-examples)
	- [MDN sample](https://github.com/mdn/dom-examples/tree/main/server-sent-events)
    - [PHP](https://bigboxcode.com/php-server-sent-events-sse)
- [vue plugin](https://github.com/tserkov/vue-sse)
- [Node JS example](https://web.dev/eventsource-basics/#server-examples)
- [.NET](https://www.tpeczek.com/2017/02/server-sent-events-sse-support-for.html)
- [Fetch API](https://github.com/Azure/fetch-event-source)
	- support SSE format message
	- более [гибкий вариант](https://blog.logrocket.com/using-fetch-event-source-server-sent-events-react/) (Body & Headers parameters, HTTP Method не только GET, больше вариантов обработки сбоя соединения)
	- [fetch() function](https://developer.mozilla.org/en-US/docs/Web/API/fetch)
	- support disable events on browser minimize [Page Visibility API](https://developer.mozilla.org/en-US/docs/Web/API/Page_Visibility_API)