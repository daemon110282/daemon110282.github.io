# Проверка доступности Email при регистрации

- [Проверка доступности Email при регистрации](#проверка-доступности-email-при-регистрации)
	- [Задача](#задача)
	- [Решение](#решение)
		- [1. **Выбор хранилища данных**](#1-выбор-хранилища-данных)
		- [2. **Оптимизация запросов**](#2-оптимизация-запросов)
		- [3. **Масштабируемость и балансировка нагрузки**](#3-масштабируемость-и-балансировка-нагрузки)
		- [4. **API для проверки email**](#4-api-для-проверки-email)
		- [5. **Кеширование результатов**](#5-кеширование-результатов)
		- [6. **Мониторинг и алертинг**](#6-мониторинг-и-алертинг)
		- [7. **Автоматическое масштабирование**](#7-автоматическое-масштабирование)
		- [Пример архитектуры](#пример-архитектуры)
		- [Заключение](#заключение)

## Задача

Есть почтовая система. В ней 250000 email.
Есть форма регистрации где нужно проверить, что email свободен для регистрации. 25000 запросов в день на проверку доступности email адреса.

## Решение

Для проектирования решения, которое сможет обрабатывать 25 000 запросов в день на проверку доступности email-адреса среди 250 000 уже зарегистрированных email, нужно учитывать как производительность, так и масштабируемость системы. Рассмотрим следующую архитектуру решения:

### 1. **Выбор хранилища данных**

Для хранения 250 000 email-адресов можно использовать одну из следующих баз данных:

- **SQL-база данных** (например, PostgreSQL или MySQL). Для быстрого поиска email потребуется создать индекс на поле email. Такой индекс позволит делать быстрые запросы на поиск конкретного адреса.
- **NoSQL-база данных** (например, Redis, MongoDB). Redis можно использовать для хранения email-адресов в виде множества или хеш-таблицы, что обеспечит очень быструю проверку на существование.

Выбор хранилища зависит от требований к масштабируемости и доступности. Redis может быть предпочтительным для более быстрого доступа, если речь идет только о проверке существования email.

### 2. **Оптимизация запросов**

Для частых запросов (25 000 в день) проверка на наличие email должна быть максимально быстрой:

- **Кеширование**: Используйте Redis в качестве кеша для часто запрашиваемых email-адресов. Если email не найден в кеше, запрос отправляется в основное хранилище.
- **Индексы**: Для SQL-баз данных важно создать индекс на колонку email, чтобы поисковые запросы выполнялись быстрее.

### 3. **Масштабируемость и балансировка нагрузки**

Так как система должна поддерживать большой объем запросов:

- **Балансировщик нагрузки**: Внедрение балансировщика нагрузки (например, Nginx, HAProxy), который распределяет входящие запросы на несколько серверов с базой данных или серверов приложений.
- **Шардирование**: Если база данных SQL, можно разбить данные на сегменты (шардирование) по первой букве или хешу email. Это позволит распределить нагрузку между несколькими серверами.

### 4. **API для проверки email**

Создайте REST или gRPC API, через который пользователи смогут отправлять запросы на проверку доступности email:

- **REST API**: HTTP-запросы для проверки существования email. Если нагрузка становится высокой, можно масштабировать сервис горизонтально, запуская несколько экземпляров API.
- **gRPC**: Если требуется низкая задержка, можно использовать gRPC, который более эффективен для двоичной передачи данных и высокопроизводительных систем.

### 5. **Кеширование результатов**

Если email часто запрашивается, можно внедрить дополнительный уровень кеширования, чтобы уменьшить количество запросов к основной базе данных:

- **Кеш на уровне API**: Использование in-memory кеша (например, Redis или Memcached) для хранения часто запрашиваемых email-адресов и их статуса (занят или свободен).
- **Time-to-live (TTL)** для кеша: Настройте TTL для элементов кеша, чтобы данные обновлялись через определенный период времени и не устаревали.

### 6. **Мониторинг и алертинг**

Для обеспечения стабильности системы необходимо реализовать мониторинг:

- **Мониторинг производительности**: Используйте инструменты мониторинга (например, Prometheus, Grafana) для отслеживания времени ответа API, нагрузки на базу данных и серверы.
- **Алерты**: Настройте уведомления при превышении допустимого времени ответа или при высоком уровне ошибок.

### 7. **Автоматическое масштабирование**

Для обработки пиковых нагрузок используйте автоматическое масштабирование серверов API и базы данных:

- **Auto-scaling**: Внедрение авто-масштабирования серверов с API на основе количества входящих запросов.
- **Cloud-базы данных**: Использование управляемых баз данных в облаке (например, Amazon RDS, [Google Cloud](../../technology/ci-cd/google.cloud.md) SQL), которые могут автоматически увеличивать или уменьшать ресурсы в зависимости от нагрузки.

### Пример архитектуры

1. **Балансировщик нагрузки (Nginx или AWS ELB)**: распределяет запросы на несколько экземпляров API.
2. **API-сервисы (REST/gRPC)**: проверяют наличие email-адресов, обращаясь к базе данных и кешу.
3. **Кеш (Redis)**: хранит часто запрашиваемые email-адреса.
4. **База данных (PostgreSQL/MySQL или Redis в качестве основного хранилища)**: хранит все зарегистрированные email-адреса.
5. **Мониторинг (Prometheus/Grafana)**: отслеживает производительность системы и генерирует алерты.

### Заключение

Такая архитектура с распределением нагрузки, кешированием и масштабируемыми API позволяет эффективно обрабатывать 25 000 запросов в день и легко масштабироваться в случае увеличения нагрузки.
