# Remote Procedure Invocation (RPC)

## Зачем

- Some client one handler service - клиент хочет получать только результаты по своим сообщениям.
- Паттерн [интеграции](../pattern.integration.md) [Request-Reply](https://www.enterpriseintegrationpatterns.com/patterns/messaging/RequestReply.html)

## Паттерны
  
- Sync [Request-Reply](https://www.enterpriseintegrationpatterns.com/patterns/messaging/RequestReply.html)
- Async Request-Reply
- __Двунаправленная связь__ для обмена сообщениями между клиентом и сервером
  - протокол __[WebSocket](../../../../technology/protocols.integration/websocket.md)__
- __Однонаправленная связь__
  - HTML спецификация [Server Sent Events](../../../../technology/protocols.integration/sse.md)
  - [gRPC](../../../../technology/protocols.integration/grpc.md)
