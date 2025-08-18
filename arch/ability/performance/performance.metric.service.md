# Service Metrics

## Зачем

Вид [метрик производительности](performance.metric.md).

Сюда относятся данные, связанные с производительностью внешних сервисов. Эти данные не отражают чистую производительность внешних сервисов, а всего лишь содержат информацию об исполнении запросов, которые ваша система им отправляет.

## API

- Latency Задержка - __0,1-1 сек__ 
![scheme](https://blog.hubspot.com/hs-fs/hubfs/Google%20Drive%20Integration/API%20Response%20Time%2c%20Explained%20in%201000%20Words%20or%20Less-1.jpeg?width=650&name=API%20Response%20Time%2c%20Explained%20in%201000%20Words%20or%20Less-1.jpeg)
  - API [Benchmark](https://github.com/tsenart/vegeta) Latency
- [Response Time Время отлика](https://blog.hubspot.com/website/api-response-time) - __[1-2 сек](https://sematext.com/glossary/response-time/)__:
  - DNS Lookup Time  
  - Authentication and connection time
  - Redirect Time
  - Time to First Byte
  - Time to Last byte
  - Benchmark
    - [JMeter](https://www.guru99.com/response-time-testing.html)
