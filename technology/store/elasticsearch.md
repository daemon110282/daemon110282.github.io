# Elasticsearch

## Зачем

Технология для [хранилищ данных](../../arch/store.md).

Full text search Полнотекстовый поиск решение.

- распределенная [API](https://www.elastic.co/guide/en/elasticsearch/reference/6.1/api-conventions.html) RESTful-система на основе JSON
- хранилище данных - NoSQL-база данных (сохраняет все собранные данные), масштабируемое нереляционное
- поисковой системы
- аналитической системы
- [Basic Elasticsearch Concepts](https://logz.io/learn/complete-guide-elk-stack/)
- [Elasticsearch Plugins](https://logz.io/learn/complete-guide-elk-stack/)
- Необходима [правильная схема\политика индексов данных](https://habr.com/ru/company/sbermegamarket/blog/696844/) ILM (index lifecycle management)
- Архивирование данных логов (Hot, Cold Data)

![scheme](https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fac3c8a9f-2148-4a29-bc72-6898445d1b85_1357x1536.jpeg)
