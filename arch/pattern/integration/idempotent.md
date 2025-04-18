# Идемпотентность

- [Идемпотентность](#идемпотентность)
  - [Зачем](#зачем)
  - [Паттерны](#паттерны)
    - [В ИС потребителе](#в-ис-потребителе)
    - [На сервере ИС источник](#на-сервере-ис-источник)
    - [REST HTTP методы](#rest-http-методы)
    - [Message Bus](#message-bus)
    - [Синхронизировать знание о списке ресурсов на клиенте и сервере через версионирование этого списка](#синхронизировать-знание-о-списке-ресурсов-на-клиенте-и-сервере-через-версионирование-этого-списка)
  - [Технологии](#технологии)

## Зачем

Обеспечить [Fault Tolerance](../../ability/fault.tolerance.md) и реализовать [паттерн Failure](../system.design/fault.tolerance/pattern.failure.md).

Проблема:

- [Гонки сообщений, запросов изменения, чтения](https://habr.com/ru/post/442762/)
- Типичны для распределенных систем: сетевые ошибки происходят регулярно, железо регулярно выходит из строя, таймауты, перезапросы, дубли
- Альтернатива использование техник __оптимистичного [управления параллелизмом](https://twirl.github.io/The-API-Book/API.ru.html#api-patterns-sync-strategies)__

Решение:

- Идемпотентным называют такой метод API, __повторный вызов которого не меняет состояние ресурса\сущности__. НО: __результат идемпотентного вызова может меняться__.
- Использования уникального ключа идемпотентности для каждой транзакции

## Паттерны

### В ИС потребителе

- __ключ идемпотентности__ генерится
- необходимо __отделить создание__ idempotency_key от области __передачи отправки__, [практика](https://codegenius.ru/articles/717073/): Добавить шаг подтверждения перед шагом отправки
- поле заголовка [HTTP Idempotency-Key](https://datatracker.ietf.org/doc/draft-ietf-httpapi-idempotency-key-header/)
- Ключ идемпотентности обязательно создавать в формате GUID. Рекомендуется [версия 4](https://www.uuidtools.com/v4).

### На сервере ИС источник

- Необходимо проверять, что параметры входящего запроса совпадают с параметрами существующего запроса с таким же ключом идемпотентности.
  - Варианты ответов (применение от необходимости обработки на клиенте)
    - AWS отдает ошибку [IdempotentParameterMismatch в таком случае](https://habr.com/ru/post/442762/)
    - 400 Bad Request, указывающее, что полезная нагрузка не соответствует полезной нагрузке исходного запроса
  - Чтобы детерминировано определить ключ идемпотентности как для изначального сообщения, так и для повторно обработанного, можно использовать хеш его содержимого или __хеш__ уникальных для сообщения полей.
  - __уникальность ключа__ должна проверяться не глобально, а только применительно к __конкретному пользователю и конкретной операции__
- необходимо хранить ключ идемпотентности
  - инсертится в базу в поле, на котором есть __ограничение базы данных по уникальности__. Если это ограничение не дало сделать инсерт, то отдавать ошибку ([HTTP status](../../../api/api-http-status.md) 409).
  - или [NOSQL](../../system.class/store.nosql.md) (Redis)
- необходимо определить __время жизни (TTL)__ ключа идемпотентности исходя из [бизнес логики бизнес операции](https://ieftimov.com/posts/understand-how-why-add-idempotent-requests-api/#expiring-the-keys)
- если ключ найден сервер\прокси\middleware может отдать __предыдущий ответ (response, header) из кэша__ с учетом TTL, [без выполнения запроса](https://ieftimov.com/posts/understand-how-why-add-idempotent-requests-api/#introducing-the-key)
- Когда приходит дублирующий запрос, в то время как исходный все еще обрабатывается (__параллельные запросы__). Ответы на идемпотентные операции различаются в зависимости [от состояния исходного запроса](https://digitrain.ru/articles/620208/):
  - Завершено успешно – исходный код состояния и текст ответа извлекаются из кэша, например Momento, и возвращаются вызывающему абоненту.
  - Завершено с ошибкой — повторная попытка операции, как если бы она была исходной.
  - Выполняется — возвратить успешное выполнение и не выполнять никаких операций.

### REST HTTP методы

- [идептоментны всегда](https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md#74-supported-methods): GET, PUT, DELETE
- необходимо реализовать [идептоментность](https://github.com/ikyriak/IdempotentAPI?tab=readme-ov-file#idempotency-in-http-web)
  - POST - клиент должен контролировать [повторные запросы](../../../arch/pattern/integration/), если не получил ответа
  - PATCH - если клиент не получил ответа на запрос, просто направляет повторно
- Прокси-серверы могут не повторять POST и PATCH запросы при ошибках, тогда как GET и PUT могут повторить.

### Message Bus

- Чтобы гарантировать [идемпотентность MQ](https://www.russianblogs.com/article/3133962710/), необходимо гарантировать, что потребители не будут повторно использовать одно и то же сообщение.

### Синхронизировать знание о списке ресурсов на клиенте и сервере через версионирование этого списка

При создании заказа приложение передает в отдельном поле или заголовке If-Match версию, о которой он знает.

  - [Сервер атомарно с изменением увеличивает версию](https://habr.com/ru/companies/yandex/articles/442762/) при любых изменениях заказов (создание, отмена, редактирование).
  - То есть приложение в запросе к серверу говорит ему, какое состояние заказов оно знает. И если это состояние заказов (версия) расходится с тем, что хранится на сервере, то сервер отдает ошибку «заказы были __изменены параллельно, перезагрузите информацию о заказах__».

## Технологии

- .NET MediatR (паттерн [медиатор](../development/mediator.md)) и PipelineBehavior (паттерн [chain of responsibility](../development/chainofresp.md) + decorator/proxy)
(<https://temofeev.ru/info/articles/borba-s-dublikatami-delaem-post-idempotentnym/>)
- [IdempotentAPI](https://github.com/ikyriak/IdempotentAPI) with Cache Store and support Cluster Environment
- [.net sample](https://mahedee.net/How-to-handle-Idempotentcy-in-distributed-system-using-aspnet-core/) with Cache Store Redis
