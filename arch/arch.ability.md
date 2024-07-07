# Атрибуты качества (ability) архитектуры

- [Атрибуты качества (ability) архитектуры](#атрибуты-качества-ability-архитектуры)
  - [Атрибуты качества, архитектурные характеристики ИС](#атрибуты-качества-архитектурные-характеристики-ис)
  - [Коммерческие атрибуты](#коммерческие-атрибуты)
  - [Кросс-системные правила и руководства](#кросс-системные-правила-и-руководства)
  - [Фитнес функции](#фитнес-функции)
  - [Категории](#категории)
  - [TODO](#todo)

## Атрибуты качества, архитектурные характеристики ИС

- Стандарты  
  - [ГОСТ Р ИСО/МЭК 9126-93](https://m-i-kuznetsov.livejournal.com/157150.html)

Атрибуты качества

- [Надежность Reliability](ability/reliability.md)
  - [Доступность Availability (Эксплуатационные)](ability/availability.md)
  - [Отказоустойчивость Fault tolerance](ability/fault.tolerance.md)
  - Стабильность (Maturity) - количество отказов системы за единицу времени. Т.е. частота сбоев при штатной работе системы.
    - Изоляция сбоев [Resilience](ability/resilience.md)
  - Восстанавливаемость Recoverability
  - Согласованность Consistency (Эксплуатационные)  
  - Живучесть Robustness  
- [Производительность Performance](ability/performance.md) (Эксплуатационные)  
- Переносимость Portability
  - Возможность повторного использования [Reusability](reusability.md) (Единая кодовая база)
    - Mdm - master data manager
  - Модифицируемость/способности к взаимодействию//изменениям Modifiability (Эволюция)
    - Сложность дальнейших интеграции
  - Совместимость Interoperability (Эволюция)
  - Расширяемость Extensibility
  - Adaptability
  - Замещаемость
    - [API Gateway](../api/api.gateway.md)
    - Server-side [service discovery](./pattern/deployment/service.discovery.md)
    - [Proxy\Balancing](./pattern/deployment/pattern.proxy.reverse.md)
  - [Слабая связанность (low coupling)](pattern/low.coupling.md)
- Durability
- Функциональность
  - [Security Безопасность](ability/security.md)
  - Гибкость Flexibility
  - Целостность Integrity
  - Конфигурируемость Configurability
- Удобство использования Usability (Пользовательский опыт)
  - Практичность Usability
  - Удобство Accessibility (Пользовательский опыт)
  - Локализация Localization (Пользовательский опыт)
- Удобство сопровождения Maintainability
  - Анализируемость (Analyzability)
  - Изменяемость (Changeability)
  - Устойчивость (Stability)
  - [Тестопригодность Testability](ability/testability.md)
    - разделением на слои и следованием [Dependency Rule (правилу зависимостей)](https://habr.com/ru/company/mobileup/blog/335382/)
- [Автодокументирование API](../api/api.md)
- [Наблюдаемость Observability](ability/observability.md)

TODO

- CI-CD куда?
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

Fitness Functions

- Юнит тесты
- Контрактные тесты
- Процессные метрики
- Мониторинг
- Арх-е метрики
- Интеграционные тесты

Технологии:

- Danger

## Категории

- Ключевые
- Релевантные
- Нерелевантные

## TODO

- [TODO Excel list](ability/Quality-Attributes-2013.xlsx)
- ![nft](../img/arch/nft.png)
