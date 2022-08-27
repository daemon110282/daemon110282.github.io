# Атрибуты качества (ability) архитектуры

Атрибуты качества, архитектурные характеристики

* Атрибуты качества (на основе ISO 9126)
  * Переносимость Portability
    * Возможность повторного использования Resuability (Единая кодовая база)
      * Mdm - master data manager
    * Модифицируемость/способности к взаимодействию/расширяемости/изменениям Modifiability (Эволюция)
      * Сложность дальнейших интеграции
    * Совместимость Interoperability (Эволюция)
    * extensibility
    * adaptability
    * Замещаемость
      * API Gateway
      * Server-side service discovery
      * Proxy\Balancing
    * [Слабая связанность (low coupling)](https://medium.com/german-gorelkin/low-coupling-high-cohesion-d36369fb1be9) и сильная связность\целостность (high cohesion)
      * не зависеть от UI
      * не зависеть от БД, внешних фреймворков и библиотек.
      * принцип единственной ответственности (single responsibility principle), который гласит: «У класса должна быть только одна причина для изменения»
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
      * разделением на слои и следованием [Dependency Rule (правилу зависимостей)](https://habr.com/ru/company/mobileup/blog/335382/)
    * CI-CD куда?
    * Автодокументирование API?
    * Мониторинг, статистика
      * При проектировании в архитектуру закладываются измерители, генерирующие информацию для системы мониторинга
      * Key Quality Indicators продукта. Необходимы для возможности мониторинга качества предоставления продукта дежурной сменой Service Desk и ДКК. Данный раздел описывает непосредственно счетчики, используемые в качестве KPI, источники получения соответствующих счетчиков, периодичность съёма данных формат и интерфейсы предоставления информации, пороговые значения для алармов и их получателей. Время и место хранения статистики.
      * Elastick Search Kibana
  * Надежность Reliability
    * [Готовность Доступность Availability (Эксплуатационные)](ability/availability.md)
    * Согласованность Consistency (Эксплуатационные)
    * [Отказоустойчивость Fault tolerance](ability/faulttolerance.md)
    * Стабильность (Изоляция сбоев)
    * Живучесть Robustness
    * Recoverability
  * Производительность Performance (Эксплуатационные)
    * [Масштабирование](ability/load.balancing.md)
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
