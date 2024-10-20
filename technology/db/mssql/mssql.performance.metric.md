# MSSQL Performance metric

Метрики производительности [MSSQL](mssql.md#производительность).

[miro](https://miro.com/app/board/uXjVOMlBLHQ=/?moveToWidget=3458764577784794347&cot=14)

## Виды метрик

- Database properties
- Quick Stats
- Database size
- Performance counters
- Memory break down
- Database I/O
- Database Latency
- Availability Replica

## Паттерны

- ТОП 5
  - долгих запросов Long Query [EV](mssql.extended.events.md)
  - блокировки Locks [EV](mssql.extended.events.md)
  - часто вызываемых
  - с ошибками Error [EV](mssql.extended.events.md)
- Latency
  - [Waits](mssql.waits.md)
    - Total average wait time
  - [Latches](mssql.latches.md)
    - [Total latch wait Time](https://documentation.red-gate.com/sm/metrics-alerts-and-notifications/metrics-and-alerts-reference/list-of-metrics#Listofmetrics-Latchwaittime)  
  - Buffer cache hit ratio
  - CPU
    - CPU queue length - При нехватке ядер процессора возникает ожидание в виде очередей. 
    - CPU Utilization
    - Context Switches per second
- Traffic
  - [Active transactions](https://habr.com/ru/articles/338498/)