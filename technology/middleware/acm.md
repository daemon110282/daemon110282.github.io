# Access Control mechanisms (ACMs)

- [Access Control mechanisms (ACMs)](#access-control-mechanisms-acms)
  - [Зачем](#зачем)
  - [Паттерны](#паттерны)
  - [Технологии](#технологии)

## Зачем

Middleware для реализации схем авторизации (Access Control Models):

- Role Based Access Control ([RBAC](acm/rbac.md))  
- [Relationship-Based Access Contro](https://www.permit.io/blog/what-is-rebac) (ReBAC)
- Attribute-based access Control ([ABAC](acm/abac.md))
  - [RBAC vs ABAC](https://habr.com/ru/companies/custis/articles/248649/)
- User-based access control (UBAC)
- Context-based access control (CBAC)
- Group-based access control (GBAC)
- Rule-based access control
- Time-based access control
- Access Control List [ACL](https://habr.com/ru/articles/539778/)

## Паттерны

- Язык описания метамодели [PERM](https://habr.com/ru/articles/539778/) (Policy, Effect, Request, Matchers)

Принципиальная схема авторизации:

- __Субъект__ доступа обращается к __Объекту__ доступа.
- Объект доступа обращается к __Авторизатору__, и запрашивает бинарный ответ, разрешен ли этому Субъекту доступ к данному Объекту или нет.
- __Авторизатор__ по заложенной в него логике __проверяет возможность доступа__ Субъекту к Объекту, и отвечает разрешен ли доступ или запрещен. Наиболее распространенная логическая модель по которой идет проверка доступа — это модель авторизации на базе ролей (RBAC).
- __Объект__ доступа на основании ответа Авторизатор разрешает, либо запрещает доступ к себе __Субъекта__.

## Технологии

- Open Source
  - [Auth0](https://auth0.com/docs/authorization/rbac/what-is-rbac): Service, RBAC, ABAC, GBAC, REST API
  - [Ory Keto](https://www.ory.sh/keto/docs/): Service, RBAC, ABAC, GBAC, REST API
  - [Casbin](https://casbin.org/): RBAC, ABAC, ACL, REST API
    - [Нагрузочное тестирование](https://habr.com/ru/companies/bimeister/articles/700144/)
  - NodeJS
    - [Permify](https://github.com/Permify/permify): Service, Docker, RBAC, ABAC, DSL, REST API, gRPC
      - [Пример](https://nuancesprog.ru/p/22727/)
    - [accesscontrol](https://www.npmjs.com/package/accesscontrol): RBAC, ABAC, read from DB settings
    - [CASL](https://github.com/stalniy/casl): ABAC, mongodb settin
  - [Open Policy Agent](https://www.openpolicyagent.org/): ABAC
  - [KeyCloak](iam/iam.keycloak.md#access-control): RBAC, GBAC
    - [Пример настройки RBAC by Policy, Resources, Permission in KeyCloak](https://htl-leonding-college.github.io/quarkus-security-lecture-notes/keycloak-rbac.html)
    - [Пример NodeJS RBAC](https://dev.to/haithamoumer/secure-your-rest-api-using-keycloak-role-based-access-control-3f96)
      - create Realm -> Client -> Roles
      - assign User -> Roles
      - [nest-keycloak-connect](https://www.npmjs.com/package/nest-keycloak-connect) разная логика в методе от Roles [ConditionalScopes](https://github.com/ferrerojosh/nest-keycloak-connect/blob/21f3901599e216f7f495942048c8f15ff2e4a12a/example/src/product/product/product.controller.ts)
    - [NGINX validate KeyCloak token and Role](https://dev.to/sergey-dudik/nginx-and-keycloak-a-perfect-pair-for-gateway-security-3ief)
- Commercial
  - [permit.io](https://www.permit.io/rbac): UI Admin Managment, Service, RBAC, ABAC
