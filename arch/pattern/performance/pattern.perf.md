# Производительность

- [Производительность](#производительность)
  - [Зачем](#зачем)
  - [Паттерны](#паттерны)
    - [Приложение back-end](#приложение-back-end)
    - [Приложение front-end](#приложение-front-end)
    - [СУБД](#субд)
    - [Сеть](#сеть)

## Зачем

Обеспечить достижение атрибутов качества архитектуры ПО - [характеристика производительности](../../ability/performance.md).

## Паттерны

- [Балансировка](../deployment/load.balancing.md)

### Приложение back-end

- [кэш](pattern.cache.md) вывода, данных (sqldependency)
- денормализация
- Масштабирование: горизонтальный ( рядом новый сервер), вертикальные (ядер, памяти и ТП)
- Решение принимаем по каждому виду данных/бизнес сущности отдельно.
- Ищем __баланс__ с учетом
  - размера данных
  - стоимости их вычисления/чтения с HDD
  - вероятности их повторной востребованности
  - размера, который они занимают в кэше/частоты изменения данных/того
  - насколько "болезненно" будет для пользователя получение "устаревших" данных из __кэша__

### Приложение front-end

Паттерны:

- Compression
  - Compress files and minimize data size before transmission to reduce network load.
- Selective Rendering/Windowing
  - Display only visible elements to optimize rendering performance. For example, in a dynamic list, only render visible items.
- Modular Architecture with Code Splitting
  - Split a bigger application bundle into multiple smaller bundles for efficient loading.
- Priority-Based Loading
  - Prioritize essential resources and visible (or above-the-fold) content for a better user experience.
- Pre-loading
  - Fetch resources in advance before they are requested to improve loading speed.
- Tree Shaking or Dead Code Removal
  - Optimize the final JS bundle by removing dead code that will never be used.
- Pre-fetching
  - Proactively fetch or cache resources that are likely to be needed soon.
- Dynamic Imports
  - Load code modules dynamically based on user actions to optimize the initial loading times.

Мониторинг:

- JavaScript
  - существует инструмент под названием Navigation Timing API, который позволяет собирать на стороне клиента данные по скорости страницы, продолжительности DNS resolve, передачи данных по сети, работы на Backend’е, отрисовки страницы.

### СУБД

- [CQRS](./pattern.cqrs.md) - чтение и запись из разных бд
- Секционирование [Шардирование](./shard.db.md)
- [Репликация](../sync.data.md)
- Кластеризация
- [Уровень изоляции данных](../../store.isolation.level.md)
- Индексы
  - [ms sql](../../../technology/db/mssql.md)
- План запросов
- Объем данных снизить

### Сеть

- [Distributed File System](../../../technology/filesystem/dfs.md) и [Replication](https://windowsnotes.ru/activedirectory/distributed-file-system-arxitektura-i-bazovye-ponyatiya/)
- Каналы связи вертикальное масштабирование [дублирование каналов связи, защита](https://systempb.ru/company/our-articles/vysokie-skorosti-sovremennykh-tsod-kak-vozmozhnosti-stanovyatsya-ogranicheniyami-i-chto-s-etim-delat/)
- [топология сети](http://citforum.ru/nets/optimize/locnop_02.shtml) и используемое коммуникационное оборудование
