# Back For Frontend BFF

## Зачем

- [reverse proxy for SPA?](https://docs.duendesoftware.com/identityserver/v6/bff/overview/)
  - Storing tokens on the server-side and using encrypted/signed HTTP-only cookies for session management makes that threat model considerably easier.
- __“backend for frontend”__ [BFF](https://samnewman.io/patterns/architectural/bff/) разные [типы клиентов](https://habr.com/ru/articles/557406/) (интернет веб приложение, мобильное приложение, интранет веб приложение и тп) могут иметь разные требования по интеграции для
  - сокращения трафика
  - снижения числа запросов, т.к. влияет на заряд мобильного приложения
  - Фасад до продуктовых сервисов __facade__ especially [made for mobile apps](https://microservices.io/patterns/apigateway)
- функции
  - Работать с микросервисами продукта и получать от них данные
  - Форматировать эти данные, чтобы они корректно обрабатывались на фронтенде
  - Отправлять данные фронтенду
