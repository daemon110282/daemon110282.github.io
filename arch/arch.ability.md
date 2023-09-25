# Атрибуты качества (ability) архитектуры

- [Атрибуты качества (ability) архитектуры](#атрибуты-качества-ability-архитектуры)
  - [Атрибуты качества, архитектурные характеристики](#атрибуты-качества-архитектурные-характеристики)
  - [Коммерческие атрибуты](#коммерческие-атрибуты)
  - [Кросс-системные правила и руководства](#кросс-системные-правила-и-руководства)
  - [Фитнес функции](#фитнес-функции)

## Атрибуты качества, архитектурные характеристики

![nft](../img/arch/nft.png)

Атрибуты качества (на основе ISO 9126)
  
- Переносимость Portability
  - Возможность повторного использования Resuability (Единая кодовая база)
    - Mdm - master data manager
  - Модифицируемость/способности к взаимодействию/расширяемости/изменениям Modifiability (Эволюция)
    - Сложность дальнейших интеграции
  - Совместимость Interoperability (Эволюция)
  - Extensibility
  - Adaptability
  - Замещаемость
    - [API Gateway](../api/api.gateway.md)
    - Server-side service discovery
    - [Proxy\Balancing](../arch/pattern/pattern.proxy.reverse.md)
  - [Слабая связанность (low coupling)](ability/low.coupling.md)
- Функциональность
  - [Security Безопасность](ability/security.md)
  - Гибкость Flexibility
  - Целостность Integrity
  - Конфигурируемость Configurability
- Удобство использования Usability (Пользовательский опыт)
  - Практичность Usability
  - Удобство Accessibility (Пользовательский опыт)
  - Локализация Localization (Пользовательский опыт)
- Удобство сопровождения
  - [Тестопригодность Testability](ability/testability.md)
    - разделением на слои и следованием [Dependency Rule (правилу зависимостей)](https://habr.com/ru/company/mobileup/blog/335382/)
  - CI-CD куда?
  - [Автодокументирование API](../api/api.md)
  - [Наблюдаемость Observability](ability/observability.md)
- [Надежность Reliability](../devops/sre.md)
  - [Доступность Availability (Эксплуатационные)](ability/availability.md)
  - Согласованность Consistency (Эксплуатационные)
  - [Отказоустойчивость Fault tolerance](ability/faulttolerance.md)
  - Стабильность (Изоляция сбоев) [Resilience](ability/resilience.md)
    - [Chaos Engineering](pattern/chaos.eng.md)
  - Живучесть Robustness
  - Recoverability
- [Производительность Performance](ability/performance.md) (Эксплуатационные)

TODO:

- scalability interoperability
- responsiveness
- elasticity
- abstraction
- data integrity
- data consistency

## Коммерческие атрибуты

- Сроки выхода на рынок TimeToMarket
- Стоимость и прибыль Cost
- Срок службы системы Life Time
- Целевой рынок Target Market
- График развертывания продукта Product Schedule
- Интеграция с существующими системами Interoperability

## Кросс-системные правила и руководства

- Responsibilities Отвественности компонентов
- Ul integration Интеграция с UI
- Communication protocols Протоколы взаимодействия
- Data formats Форматы данных
- Redundant data Избыточность данных
- BI interfaces Интерфейсы с BI
- [Logging, Monitoring Логирование и мониторинг](ability/observability.md)

## Фитнес функции

- Юнит тесты
- Контрактные тесты
- Процессные метрики
- Мониторинг
- Арх-е метрки
- Интеграционные тесты

Категории:

- Ключевые
- Релевантные
- Нерелевантные

[TODO Excel list](ability/Quality-Attributes-2013.xlsx)
