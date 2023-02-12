# Server Sent Events

Реализует однонаправленную связь в [паттернах интеграции](../../arch/pattern/pattern.integration.md).

[Server Sent Events](https://learn.javascript.ru/server-sent-events) (Server-Side Events)
- Соединение постоянное, __протокол HTTP__, альтернатива [Polling, Long Polling](https://web.dev/eventsource-basics/) from FrontEnd
- скорость, равная скорости потоковой передачи в [формате JSON](https://aengel.medium.com/server-sent-events-vs-json-stream-3a9f472120a4)
- меньше накладных расходов на установление [соединений vs Polling](https://stackoverflow.com/questions/9397528/server-sent-events-vs-polling)
- Прост в реализации и использовании, как на стороне клиента, так и на стороне сервера, более производителен для сервера, меньше задержка ответа клиента [vs Long Polling](https://www.turtle-techies.com/long-polling-vs-server-sent-events/)
	- Минус: Ограничение, связанное с __количеством соединений, которые могут быть открыты между клиентом и сервером одновременно__
- Поддержка [97,5% браузеров в 2023 году](https://caniuse.com/eventsource), но IE<11 нет, Edge только
- [Безопасность на уровне Origin от кого сообщение](https://web.dev/eventsource-basics/#a-word-on-security)
- [CORS with сredentials](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events/Using_server-sent_events) in [Headers API Key (аналогично с fetch)](https://learn.javascript.ru/fetch-crossorigin#neprostye-zaprosy)