# Reliability Надежность

## Зачем

- Надёжность (Reliability) - способность сохранять уровень качества в течение установленного периода времени.

## Паттерны

- [SRE](../../devops/sre.md)
- надо классифицировать [приложения по разным типам](https://tellmeabout.tech/create-reliable-systems-is-the-game-worth-the-candle-50cfb7714167)
  - Business critical
  - Line of business applications
  - Internal applications
- определить [SLI, SLO, SLA](../../devops/sre.md)
- Померить [Observability](observability.md)
  - Four Golden Signals
  - RED
- [Чем обеспечивается](https://www.youtube.com/watch?v=pTPDj8J6JC8)
  - [Fault Tolerance](fault.tolerance.md)
  - [Sharding](../pattern/performance/shard.db.md)
  - [Инкрементальное обновление приложений](../pattern/deployment/pattern.deploy.md) с [возможностью отката](../pattern/deployment/pattern.rollback.md)
  - важно понимать свои __зависимости__, их параметры availability, их модели отказов, и учитывать это влияние на дизайн и доступность приложения
- Концепции работы с данными:
  - долговечность
  - доступность
  - резервное копирование
    - RPO (Recovery Point Objective) - это показатель точки восстановления, который определяет какой объем данных можно потерять, например, восстанавливаясь из бэкапа
    - RTO (Recovery Time Objective) - определяет сколько потребуется времени на восстановление работоспособности сервисов, что зачастую определяется в большей степени скоростью восстановления данных, что нужны для работы приложений
- Базовые паттерны надежности
  - [повторные попытки](../pattern/fault.tolerance/pattern.failure.md#логика-повторения-retry-logic-retry-policy)
  - timeout, deadlines
  - [ограничение нагрузки](../pattern/performance/rate.limit.md) (Rate Limit)
  - [выключатель запросов](../pattern/fault.tolerance/pattern.failure.md#автоматы-замыкания-circuit-breakers) (Circuit Breaker)
