# ABP.IO Platform

<https://blog.abp.io/abp>

* плюсы
  * лицензия LGPL + коммерческая при необх-ти
  * с 2012 года, много релизов
  * feature toggle by tenant <https://docs.abp.io/en/abp/latest/Modules/Tenant-Management#managing-the-tenant-features>
  * DDD заявлен, по коду тут как ОР скажет)
  * RMQ
  * модульный монолит->микросервисы заявлено
  * swagger
  * workflow <https://community.abp.io/posts/using-elsa-workflow-with-the-abp-framework-773siqi9>
  * docker + k8s
* минусы
  * vue не из коробки, т.е. пишем на React?
  * не нашел CI-CD из коробки

## Сквозная функциональность

### Auth, Authorization

- [User Account](https://docs.abp.io/en/abp/latest/CurrentUser)
- [External Logins](https://docs.abp.io/en/commercial/latest/modules/account#social-external-logins)
- [Tenant Permision](https://docs.abp.io/en/commercial/latest/modules/account/impersonation#tenant-user-impersonation-permissions)
 - [Доступ к функциям](https://docs.abp.io/en/abp/latest/Authorization#multi-tenancy)
- [Ролевой доступ](https://docs.abp.io/en/abp/latest/Modules/Permission-Management)

### Multi Tenant

- Доступ к функциям по [Host, Tenant, Both](https://docs.abp.io/en/abp/latest/Authorization#multi-tenancy)
- [Manage](https://docs.abp.io/en/abp/latest/Modules/Tenant-Management#user-interface)

### Audit

- [Function](https://docs.abp.io/en/abp/latest/Audit-Logging)
  - Request, Change Entity, Errors, Comment
  - By Service (Controler\Action)
  - By Entity\Properties
[Module](https://docs.abp.io/en/abp/latest/Modules/Audit-Logging)
  - Aggregate
  - EF Core
    - Tables
  - Mongo DB

### Logging

