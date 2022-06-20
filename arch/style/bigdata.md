# Большие данные Big data

- [Большие данные Big data](#большие-данные-big-data)
	- [Зачем](#зачем)
	- [Плюсы-минусы](#плюсы-минусы)
	- [Паттерны](#паттерны)
	- [Технологии](#технологии)
	- [Links](#links)

[Схемы](https://docs.google.com/document/d/1mnnoMCTpg2lusnA3KQ-e0ijBhEfuRRgrVzGcv87q6dM/edit?usp=sharing)

## Зачем

- преобразование неструктурированных данных для анализа и создания отчетов
- архивные данные
- построение единой отчетности (BI)

## Плюсы-минусы

[Критерии](arch.criteria.md)

| + | - |
| - | - |
| Изоляция OLAP операций от OLTP | Множество компонентов |
|| Безопасность |
|| |

## Паттерны

- [Система отчетности](../report.md)
- [Хранилища данных](../store.md)
  - [DWH](../dwh.md)
- Massive Parallel Processing (MPP) архитектура

## Технологии

- Apache Hadoop не предназначен для анализа данных в режиме реального времени – это решение для хранения неструктурированных данных с возможностью анализа этих данных в будущем, что не соответствует требованиям компаний иметь возможность оперативного анализа данных для хранилищ данных.
- HDFS, HBase, Hive, Pig, Spark, Storm, Oozie, Sqoop 
- Kafka

## Links

- [Большие данные](https://docs.microsoft.com/ru-ru/azure/architecture/guide/architecture-styles/big-data)
- Azure https://docs.microsoft.com/en-us/azure/architecture/browse/
- https://docs.microsoft.com/ru-ru/azure/architecture/browse/
- https://docs.microsoft.com/ru-ru/azure/architecture/patterns/
- https://ru.wikipedia.org/wiki/%D0%A8%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD_%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F
