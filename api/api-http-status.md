# API HTTP Status

- Отдавать ошибки внутри 200 нельзя.
- 400 Bad Request для ситуаций, когда часть параметров отсутствует или имеет недопустимое значение
  - [Для персистентных ошибок](https://habr.com/ru/post/533606/), если просто повторить запрос — ошибка никуда не денется
- [По умолчанию все 4xx коды не кэшируются, за исключением: 404, 405, 410, 414](https://restapitutorial.ru/httpstatuscodes.html)
- [403 Forbidden](https://wp-kama.ru/handbook/rest/basic/http-status-codes) для ошибок аутентификации и/или авторизации
- [404 для статуса неопределённости](https://developer.mozilla.org/ru/docs/Web/HTTP/Status) (повтор запроса может дать другой результат)
- 409 Запрос нельзя обработать из-за конфликта в текущем состоянии ресурса. 
- 500 для проблем на стороне сервера плюс заголовок Retry-After, чтобы дать понять клиенту, когда прийти снова
- [503 Service Unavailable](https://docs.apigee.com/api-platform/troubleshoot/runtime/503-service-unavailable)
  - [Apache PHP](https://www.inmotionhosting.com/support/website/create-503-status/)
