# API Managment (APIM)

- [API Managment (APIM)](#api-managment-apim)
  - [Зачем](#зачем)
    - [Development Portal База знаний API](#development-portal-база-знаний-api)
  - [Плюсы-минусы](#плюсы-минусы)
  - [Технологии](#технологии)

Расширяет возможности [API Gateway](api.gateway.md).

## Зачем

- [Development portal](https://cloud.google.com/blog/products/api-management/top-5-trends-for-api-powered-digital-transformation-in-2021)
- API observability platform
  - Мониторинг производительности, быстродействия
  - статистика использования
- [Безопасность (контроль доступа, защита)](https://aws.amazon.com/ru/api-gateway/api-management/?pg=wianapi&cta=apimgtprcs)
- Монетизация
- Policy management
- Service discovery

### Development Portal База знаний API

Часть API Managment:

- [Документация по всем АПИ](api.md) компании: для поиска решений, изучения существующих возможностей (понимания AS-IS), хороших практик, опыта, т.е. обмена знаниями (База знаний)
  - [Типы API](https://neiros.ru/blog/business/api-kak-primenyaetsya-programmnyy-interfeys-na-primerakh-6-populyarnykh-servisov/): внутренние, публичные, партнерские
- [Автодокументация](api.md) по OpenAPI, AsyncAPI, WSDL, GraphQL, gRPC
- Примеры кода клиента
- История изменений АПИ
- GIT integration
  
## Плюсы-минусы

Плюсы

- Мониторинг API
- позволяет [преобразовать запросы/ответы API](https://habr.com/ru/companies/X5Tech/articles/543324/)

Минусы

- Единая точка отказа
- Latency увеличивается
- Сопровождение, стоимость ТСО
- Усложнение интеграции

## Технологии

- [Apigee](https://cloud.google.com/apigee)
  - [On-premise?](https://docs.apigee.com/private-cloud/versions)
  - [Drupal + Nginx](https://cloud.google.com/apigee/docs/api-platform/publish/intro-portals)
- Cloud
  - Postman
- On premise
  - Redocfly
  - [Kong](../technology/middleware/api.gateway/gw.kong.md)
  - [WSO2 Api Manager](https://wso2.com/api-manager/)
  - [Gravitee](../technology/middleware/api.gateway/gw.gravitee.md)
- ?
  - AxWay
  - MuleSoft
  - [Pronovix](https://pronovix.com/blog/one-developer-portal-document-them-all)
  - [Tyk](https://tyk.io/)
  - [moesif](https://www.moesif.com/)