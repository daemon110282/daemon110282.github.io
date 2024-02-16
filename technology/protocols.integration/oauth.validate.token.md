# Token validate

Варианты Access token:

- __identifier-based or opaque access token__ - [/token/introspect](https://dzone.com/articles/oauth2-tips-token-validation) return active status token
  - плюсы
    - быстро можно заблокировать доступ по времени истечения\не действительности
  - минусы
    - доп-е запросы, нагрузка на IAM
    - риски масштабирования при нагрузке
- __self-contained__ (jwt format only) - проверка подписи через JWKS endpoint IAM и затем параметров токена
  - плюсы
    - простота масштабирование под рост нагрузки
  - минусы
    - блокировка возможна только по истечении exp токена

[Процесс валидации](https://www.krakend.io/docs/authorization/jwt-validation/#validation-process)

![token validate](https://lh3.googleusercontent.com/pw/AL9nZEU8W4c59UO_qgfALxBDsUQUmOdeKq2qW3XSiD72WbrqQ2m2xnolziO0UgNlcqktm4XYdhJ93r4D4oqa3KPpzSBXU5O8DcB__HHZJ5Picah6BNKczaiiAGULHYMRhI9GAoFutEEhVFIDdH_Q71jxuZnfYQ=w656-h374-no)

API Gateway [validate token](https://medium.com/geekculture/how-jwt-is-implemented-in-api-gateway-on-microservice-architecture-5dce8f5b89aa):

- [NGINX Example](https://disk.yandex.ru/i/yX5AmLxdpW4XJg)
- [Citrix](../middleware/proxy.netscaler.md)
- [KrakenD](https://www.krakend.io/docs/authorization/jwt-validation/)
- [Kong](https://konghq.com/blog/engineering/jwt-kong-gateway) после успешной валидации токен [передается в приложение](https://docs.konghq.com/hub/kong-inc/jwt/?_ga=2.122174283.1712042409.1685099853-2056534719.1685099853#upstream-headers)
