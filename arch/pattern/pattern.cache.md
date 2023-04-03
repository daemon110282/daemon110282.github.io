# Cache Кэширование

- вывода дисковой подсистемы
- ответа [веб сервера](https://habr.com/ru/company/ruvds/blog/350310/)
	- [HTTP Headers](https://learn.microsoft.com/ru-ru/azure/cdn/cdn-how-caching-works#cache-directive-headers)
- на клиенте в браузере (HTTP-кэш)
- на [прокси сервере\балансировщике](pattern.proxy.reverse.md)
- [CDN](../system.class/cdn.md) статичный контент
- данных в СУБД (sqldependency)
- данных приложения
	- Disrtibuted Cache - [Redis](../../technology/store/redis.md), Memcached

Параметры кеширования:

- условия инвалидации
- время жизни

## Паттерны

- Cache ![schema](https://substackcdn.com/image/fetch/w_848,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F9d1ca70c-7df2-45e2-92e1-309ceb6e7bdb_1280x1867.jpeg)
- [Стратегии кэширования](https://kislayverma.com/software-architecture/architecture-patterns-caching-part-1/)
- [MS best practices](https://learn.microsoft.com/en-us/azure/architecture/best-practices/caching)
- [top 5 things to consider](https://blog.bytebytego.com/i/102208958/things-to-consider-when-using-cache) ![schema](https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F1f0f7d0b-9622-4bdd-9b69-73c2a53366eb_1728x1646.png)

## Технологии

- [Redis](../../technology/store/redis.md)
- Memcached
