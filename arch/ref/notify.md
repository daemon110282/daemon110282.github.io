# Уведомления

Отправка уведомлений от сервера - клиенту.

Функции:

- GET /status endpoint to know how many clients have connected
- [CORS](../../technology/protocols.integration/cors.md) middleware to allow connections from the frontend app
- Cancellable Notification
  - Any notification should be cancellable at any time.
  - Any notification can be canceled at any time because the user removes the user ID from the client-side application.
- Dedupe Notification
  - Users should not receive the same notification twice.
- Logs every notification sent.
  - Logs and unsuccessful job/task
  - Should be able to see the logs in real-time when the application is in the product.

## Технологии

- [SSE](../../technology/protocols.integration/sse.md)
- [Redis](../../technology/store/redis.md) Stream
