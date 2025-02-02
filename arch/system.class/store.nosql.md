# NOSQL Store

## Зачем

Подвид [хранилищ данных](store.md) с __слабо структурированными__ данными.
[Критерии выбора](store.md#критерии-выбора).

## Плюсы-минусы

Плюсы:

- Быстрые из-за
  - отсутствия __схемы__
  - функций __реляционности__
  - __транзакционности__
  - контроля __ссылочной целостности__

## Виды

- [Key Value](../../technology/store.nosql.md#key-value-in-memory)
  - In-memory store - Their speed and limited data size make them ideal for fast operations.
- [Column Based](../../technology/store.nosql.md#column-based)
- [Wide column store](../../technology/store.nosql.md#wide-column) - They are usually used for __big data, analytics, reporting__, etc., which needs __denormalized data__
- [Graph database](../../technology/store.nosql.md#graph-database)
  - It is suitable for complex __relationships between unstructured objects__
  - Графовые базы данных — нереляционный тип БД. Их особенность — применение структуры графа для хранения данных и запросов.
- [Document store](../../technology/store.nosql.md#document-oriented) - They are good for __large immutable data__
