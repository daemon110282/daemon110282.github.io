# Нефункциональные требования (НФТ) (NFR)

Входит в [шаблон](template.md) ПЗ

## Security Безопасность

- [Auth As Service on MVP](https://ryanccollins.com/stock-exchange-systems-design-case-study)
- Антифрод
  - на уровне биржи есть
  
## Производительность

- количество активных пользователей - 500к\день
- rps
  - ~100,000,000 requests per day
  - ~30 krps in a trading day
- количество ордер 1млн\день
- ~3000 transactions per second
  - Up to 10x during peaks = ~30,000 transactions per second
- Latency важна
  - мы не хотим, чтобы пользователь был удивлен резкими колебаниями цен, и должны приложить все усилия, чтобы обеспечить самую низкую цену.
  - 200-400мс на ордер
- Цены должны обновляться в режиме реального времени, чтобы пользователь мог принять решение, основываясь на уверенности в текущей рыночной цене.

## Надежность

- 24\7
- доступность 99,9%

## Migrations Миграции

## Observability Наблюдаемость

Логи
Аудит
Trace

### Технические метрики

- Сервисные
- Системные
- Аналитика: [Firebase](../../technology/ci-cd/firebase.md) Analytics, Crashlytics, AppsFlyer, Amplitude

## Test strategy

## TODO

- RTO
- RPO
- Техокно
- MAU DAU
- Глубина хранения
- Интернационализация
- 63ФЗ
- PCI DSS
