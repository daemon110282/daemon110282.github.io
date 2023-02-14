# Server Sent Events

Реализует однонаправленную связь в [паттернах интеграции](../../arch/pattern/pattern.integration.md).

[Server Sent Events](https://learn.javascript.ru/server-sent-events) (Server-Side Events)
- Соединение постоянное, __протокол HTTP__, альтернатива [Polling, Long Polling](https://web.dev/eventsource-basics/) from FrontEnd
- скорость, равная скорости потоковой передачи в [формате JSON](https://aengel.medium.com/server-sent-events-vs-json-stream-3a9f472120a4)
	- [PHP](https://bigboxcode.com/php-server-sent-events-sse)
	- [Node JS example](https://web.dev/eventsource-basics/#server-examples)
	- [.NET](https://www.tpeczek.com/2017/02/server-sent-events-sse-support-for.html)
- меньше накладных расходов на установление [соединений vs Polling](https://stackoverflow.com/questions/9397528/server-sent-events-vs-polling)
- Прост в реализации и использовании, как на стороне клиента, так и на стороне сервера, более производителен для сервера, меньше задержка ответа клиента [vs Long Polling](https://www.turtle-techies.com/long-polling-vs-server-sent-events/)
	- Минус: Ограничение, связанное с __количеством соединений, которые могут быть открыты между клиентом и сервером одновременно__
- Поддержка [97,5% браузеров в 2023 году](https://caniuse.com/eventsource), но IE<11 нет, Edge только
- [Безопасность на уровне Origin от кого сообщение](https://web.dev/eventsource-basics/#a-word-on-security)
- [CORS with сredentials](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events) in [Headers API Key (аналогично с fetch)](https://learn.javascript.ru/fetch-crossorigin#neprostye-zaprosy)

[Модель](https://learn.javascript.ru/server-sent-events#format-otveta-servera):
- data - JSON
- event - Event Name - Client subscribe to type of events
	- default [генерирует 3 события](https://learn.javascript.ru/server-sent-events#tipy-sobytiy):
		- message – получено сообщение, доступно как event.data.
		- open – соединение открыто.
		- error – не удалось установить соединение, например, сервер вернул статус 500
- lastEventId - ИД события
- retry - мс на переподключение при обрыве связи

Адресация сообщений возможна по event (пример: ИДПользователя_ДоговорСтатусИзменен), где клиент подписывается на события для конкретного пользователя, сервер ИД пользователя получает при аутентификации.

## Технологии

- signal.ir
- Node.js
- [PHP](https://web.dev/eventsource-basics/#server-examples)
	- [MDN sample](https://github.com/mdn/dom-examples/tree/main/server-sent-events)
- [vue plugin](https://github.com/tserkov/vue-sse)