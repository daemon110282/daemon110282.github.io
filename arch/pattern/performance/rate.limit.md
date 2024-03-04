# Rate Limit

## Зачем

- [вид ограничителя скорости называется ограничитель одновременных запросов](https://learn.microsoft.com/ru-ru/dotnet/architecture/microservices/implement-resilient-applications/partial-failure-strategies) (concurrent request limiter). Он может быть полезен, когда у вас есть «дорогие» конечные точки, которые не рекомендуется вызывать больше определённого количества раз, если вы хотите обслуживать трафик.
- [rate-limiting](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/rate-limiting-pattern)

## Паттерны

- Чтобы у вас всегда хватало ресурсов для обслуживания критически важных транзакций, используйте __fleet usage load shedder__
  - Он удерживает часть ресурсов для высокоприоритетных запросов и не позволяет низкоприоритетным транзакциям их использовать
  - Load shedder принимает свои решения на основе общего состояния системы, а не размера одиночного пользовательского запроса
- [different types of rate limiting responses](https://blog.bytebytego.com/p/rate-limiting-fundamentals) three categories: 
  - blocking
    - [HTTP Status 409 Too Many Request](https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md#142-return-codes-429-vs-503)
  - throttling - снижение качества видео, например
  - shaping - приоритетность обработки запросов
- [common rate limiting algorithms](https://blog.bytebytego.com/p/rate-limiting-fundamentals)

## Технологии

- API Gateway
  - [CISCO Netscaler](../../../technology/middleware/proxy/proxy.netscaler.md)
  - [NGinx](https://www.nginx.com/blog/microservices-march-protect-kubernetes-apis-with-rate-limiting/)
- Program Level
  - [YII2](../../../technology/framework/yii2.md)
  - TODO
- [RMQ](../../../technology/middleware/messagebus/rmq/rmq.failure.md)
  