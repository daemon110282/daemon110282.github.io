# Большие данные Big data

- [Большие данные Big data](#большие-данные-big-data)
  - [Зачем](#зачем)
  - [Плюсы-минусы](#плюсы-минусы)
  - [Функции](#функции)
  - [Паттерны](#паттерны)
  - [Технологии](#технологии)

## Зачем

[Архитектурный стиль](../arch.styles.md).

Big Data

- крупные __массивы информации__, которые помогают принимать обоснованные __решения__ основанные на данных (__data-driven__)
- стек специальных технологий для работы с ней
- Важное __отличие__ больших данных __от обычных__ — __распределённая структура__. Это значит, что управлять ими и анализировать их можно с помощью множества микросервисов.

UC:

- преобразование неструктурированных данных для анализа и создания отчетов
- архивные данные
- построение [единой отчетности](../system.class/report.md) (BI)

## Плюсы-минусы

[Критерии](../arch.criteria.md)

Плюсы

- Изоляция OLAP операций от OLTP

Минусы

- Множество компонентов
- Безопасность
- [Высокие затраты](https://yandex.cloud/ru/docs/glossary/bigdata)
- Трудности с масштабированием

## Функции

[Этапы](https://practicum.yandex.ru/blog/chto-takoe-big-data/):

- Сбор данных
  - Реплики
  - CDC
  - ETL
  - Очистка данных Data Cleaning
- Хранение
- Обработка
- Анализ

## Паттерны

- Сбор
  - Streaming Data: [Kafka](../../technology/middleware/messagebus/kafka.md)
  - [CDC](../system.class/cdc.md)
  - Репликация, синхронизация данных [Sync Data](../pattern/sync.data.md)
- Хранение
  - структурированные
    - РСУБД [Хранилища данных](../store.md)
    - [DWH](../system.class/dwh.md)
      - [Data Vault](../pattern/system.design/data.vault.md) - одна из моделей хранилища Data Warehouse с __временными отметками__ размещения данных
  - слабо структурированные
    - [NoSQL](../store.nosql.md)
    - Озеро данных [Data Lake](../pattern/system.design/data.lake.md) - данные в хранилище поступают непрерывно в __реальном времени__
    - [Data Mart](../pattern/system.design/data.mart.md) - витрина __однородных__ данных одной __предметной области__
- Обработка
  - [MapReduce](../pattern/system.design/map.reduce.md)
  - [Massive Parallel Processing](mpp.md) (MPP) архитектура
- Анализ
  - [Системы отчетности](../system.class/report.md): BI, OLAP

- todo <https://coderlessons.com/tutorials/bolshie-dannye-i-analitika/teoriia-khraneniia-dannykh/teoriia-khraneniia-dannykh>
- [Data Mining TODO](https://coderlessons.com/tutorials/bolshie-dannye-i-analitika/teoriia-khraneniia-dannykh/21-data-mining-protiv-khranilishcha-dannykh)

## Технологии

- Сбор
  - Streaming: [Kafka](../../technology/middleware/messagebus/kafka.md)
  - CDC: Debezium
- Хранение
  - структурированные
    - Data Vault: [Yandex Data Lens](../../technology/store/yandex.data.lens.md)
  - слабо структурированные
    - [Yandex Data Lens](../../technology/store/yandex.data.lens.md)
    - [ClickHouse](../../technology/store/clickhouse.md)
    - [Apache Hadoop](../../technology/store/apache.hadoop.md)
    - Apache Spark
- Обработка
  - Apache Hadoop
  - Apache Spark
- Анализ
  - Apache Spark
  - Apache Hadoop
  - ClickHouse
- HDFS, HBase, Hive, Pig, Spark, Storm, Oozie, Sqoop
- [Big data](http://habrahabr.ru/post/272041/)
  - gfs  
  - splunk, vertica, netapp

TODO

- [Большие данные](https://docs.microsoft.com/ru-ru/azure/architecture/guide/architecture-styles/big-data)
- [Azure](https://docs.microsoft.com/en-us/azure/architecture/browse/)
- <https://docs.microsoft.com/ru-ru/azure/architecture/browse/>
- <https://docs.microsoft.com/ru-ru/azure/architecture/patterns/>
- <https://ru.wikipedia.org/wiki/%D0%A8%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD_%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F>
- [Test DataSet](https://habr.com/ru/companies/edison/articles/480408/)
