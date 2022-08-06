# Атрибуты качества (ability) архитектуры

Атрибуты качества, архитектурные характеристики

* Атрибуты качества (на основе ISO 9126)
  * Переносимость Portability
    * Возможность повторного использования Resuability (Единая кодовая база)
    * Модифицируемость/способности к взаимодействию/расширяемости/изменениям Modifiability (Эволюция)
    * Совместимость Interoperability (Эволюция)
    * extensibility
    * adaptability
  * Функциональность
    * [Security Безопасность](ability/security.md)
    * Гибкость Flexibility
    * Целостность Integrity
    * Конфигурируемость Configurability
  * Удобство использования Usability (Пользовательский опыт)
    * Практичность Usability
    * Удобство Accessibility (Пользовательский опыт)
    * Локализация Localization (Пользовательский опыт)
  * Удобство сопровождения
    * Тестопригодность Testability
    * CI-CD куда?
    * Автодокументирование API?
  * Надежность Reliability
    * [Готовность Availability (Эксплуатационные)](ability/availability.md)
    * Согласованность Consistency (Эксплуатационные)
    * [Отказоустойчивость Fault tolerance](ability/faulttolerance.md)
    * Стабильность (Изоляция сбоев)
    * Живучесть Robustness
    * Recoverability
  * Производительность Performance (Эксплуатационные)
    * Масштабирование (Эволюция)
    * concurrency

TODO:

- scalability interoperability
- responsiveness
- elasticity
- abstraction
- data integrity
- data consistency

## Коммерческие атрибуты

  * Сроки выхода на рынок TimeToMarket
  * Стоимость и прибыль Cost
  * Срок службы системы Life Time
  * Целевой рынок Target Market
  * График развертывания продукта Product Schedule
  * Интеграция с существующими системами Interoperability

## Кросс-системные правила и руководства

  * Responsibilities Отвественности компонентов
  * Ul integration Интеграция с UI
  * Communication protocols Протоколы взаимодействия
  * Data formats Форматы данных
  * Redundant data Избыточность данных
  * BI interfaces Интерфейсы с BI
  * Logging, Monitoring Логирование и мониторинг
