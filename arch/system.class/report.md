# Система отчетности

- [Система отчетности](#система-отчетности)
  - [Зачем](#зачем)
  - [Плюсы и минусы](#плюсы-и-минусы)
  - [Паттерны](#паттерны)
  - [Принципы проектирования](#принципы-проектирования)
    - [Критерии реализация отчетов внутри ИС или в отдельной системе отчетности](#критерии-реализация-отчетов-внутри-ис-или-в-отдельной-системе-отчетности)
  - [Технологии](#технологии)
  - [Links](#links)

## Зачем

[Reporting database](https://martinfowler.com/bliki/ReportingDatabase.html) has a number of advantages:

- The structure of the reporting database can be specifically **designed** to make it **easier to write** reports.
- You **don't need to normalize** a reporting database, because it's read-only. Feel free to duplicate data as much as needed to make queries and reporting easier.
- The development team can **refactor the operational database** without needing to change the reporting database.
- Влияния на производительность OLTP
  - Queries run against the reporting database **don't add to the load on the operational database**
  - Отчеты долго формируются (тяжелые)
  - Рост числа пользователей, данных
  - См [качества арх-ры](arch.ability.md): доступность, масштабируемость
- You can store derived data in the database, making it easier to write reports that use the derived data without having to introduce a separate set of derivation logic.
- You may have multiple reporting databases for different reporting needs.

## Плюсы и минусы

[Критерии](arch.criteria.md)

| + | - |
| - | - |
| Минимизация рисков производительности | Отдельная БД, отдельный сервер системы отчетности |
| Возможность использования BI систем | Интеграция данных из ИС источников |

## Паттерны

- OLTP
  - MS SQL
  - PostgreSQL
- OLAP
  - [DWH](dwh.md)
- [CQRS](pattern/pattern.cqrs.md)
  - В решениях 1С компромисс
    - События при записи в базу пишутся сразу в несколько мест. В одном месте записи имеют мало индексов и оптимизированы под OLTP нагрузки. Такие таблицы называются регистрами сведений.
    - В другом месте записи индексируются по всем полям и адаптированы для OLAP нагрузок. Такие таблицы называются регистрами накоплений.

## Принципы проектирования

- Требуется ли вообще транзакционность, или её можно отключить/понизить [уровень изоляции на уровне БД](store.isolation.level.md)?
  - При выборе уровня изоляции транзакции, мы пытаемся прийти к консенсусу в выборе между высокой согласованностью данных между транзакциями и скоростью выполнения этих самых транзакций.

### Критерии реализация отчетов внутри ИС или в отдельной системе отчетности

- Качество текущей из коробки отчетности устраивает бизнес (Да\Нет)
- Структура данных
  - Связанные сущности, источники данных в других ИС, агрегация данных из разных ИС
  - Неструктурированный формат данных - XML json
- Особенности использования
  - Онлайн/Оффлайн, требуемая актуальность данных на сейчас/вчера(-1\2Д) (кеш)
  - Частота запуска отчетов (периодичность, ручной запуск, изменение фильтров\по расписанию)
- Глубина и объемы данных
  - Исторические данные
- Сложность вычислений (необходимость ресурсов инф-ры)
- Набор параметров типизирован для отчета

- Типы отчетов
  - Оперативные (онлайн) За короткий период времени на малом количестве сущностей (источниках)
  - Исторические - Управленческие (оффлайн) за большие периоды времени на большом объёме данных и многих сущностях (источниках)
  
## Технологии

- [Report Systems](../technology/report.md)

## Links

- [Big Data](style/bigdata.md)