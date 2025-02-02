# ClickHouse

Технология для [хранилищ данных](../../arch/system.class/store.md).

Колоночная аналитическая NOSQL СУБД с __открытым кодом__, позволяющая выполнять [аналитические запросы](https://cloud.yandex.ru/ru/blog/posts/2020/10/managed-clickhouse-overview) (__OLAP__) в режиме __реального времени__ на __структурированных__ [больших данных Big Data](../../arch/style/bigdata.md).

[Критерии выбора](../../arch/system.class/store.md#критерии-выбора).

## Зачем

- аналитическая отчетность по __большим данным__ в режиме __реального времени__
- real time мониторинг бизнес-метрик
- Визуализация
  - Cloud
    - Yandex DataLens
  - On Premise
    - Grafana Plugin

## Функции

- Управление [CLICKHOUSE KEEPER](https://bigdataschool.ru/wiki/clickhouse)
- GUI [Интерфейсы](https://clickhouse.com/docs/ru/interfaces/third-party/gui) для написания запросов
  - DBeaver
  - Grafana
  - [DataGrip](https://clickhouse.com/docs/en/integrations/datagrip)
- Сжатие и опции [партиционирования данных](https://habr.com/ru/companies/otus/articles/773174/)

## Плюсы-минусы

Плюсы:

- Мало места под хранение (сжатие)
- РФ
- Горизонтальное __масштабирование__ и __репликация__ из коробки, хоть это и требует больше усилий по сравнению с Elasticsearch
- Улучшенное планирование запросов и более высокая общая производительность
- [Поддержка диалекта __SQL__](https://habr.com/ru/company/ua-hosting/blog/483112/)
- Поддержка поиска регулярных выражений Regex вместо поиска полного текста
- авто очистка (retention) данных по TTL

Минусы:

- Сложность [транзакций](https://clickhouse.com/docs/en/guides/developer/transactional)
- Под OLAP нагрузку - аналитическая БД, есть проблемы с UPDATE, DELETE
- нужно думать [о структуре хранимых типов данных](https://habr.com/ru/post/581586/)
- Всего один разреженный индекс на таблицу
- ClickHouse плохо справляется с __частыми INSERT__ в него
- Документация
- Соединения таблиц ограничены оперативной памятью сервера
