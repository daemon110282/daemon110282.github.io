# ABP.IO Platform

* плюсы
  * лицензия LGPL + коммерческая при необх-ти
  * с 2012 года, много релизов
  * [feature toggle by tenant](https://docs.abp.io/en/abp/latest/Modules/Tenant-Management#managing-the-tenant-features)
  * DDD заявлен, по коду тут как ОР скажет)
  * RMQ
  * модульный монолит->микросервисы заявлено
  * swagger
  * [workflow](https://community.abp.io/posts/using-elsa-workflow-with-the-abp-framework-773siqi9)
  * docker + k8s
  * [Identity Server4](http://docs.identityserver.io/)
    * OpenID Connect protocol, Ouath
* минусы
  * vue не из коробки, т.е. пишем на React?
  * не нашел CI-CD из коробки

## Deployment

- [Структура(слои) приложения](https://docs.abp.io/en/abp/latest/Startup-Templates/Application)
  - ![Слои приложения](https://raw.githubusercontent.com/abpframework/abp/rel-5.3/docs/en/images/layered-project-dependencies.png)
  - ![Tiered structure](https://raw.githubusercontent.com/abpframework/abp/rel-5.3/docs/en/images/tiered-solution-servers.png)
  - ![With Identity Server](https://raw.githubusercontent.com/abpframework/abp/rel-5.3/docs/en/images/tiered-solution-applications.png)
- [Кластер приложения с балансировщиком](https://docs.abp.io/en/abp/latest/Deployment/Clustered-Environment)
  - ![clusterd](https://raw.githubusercontent.com/abpframework/abp/rel-5.3/docs/en/images/deployment-clustered.png) 

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

- SerialLog 
 - [2graylog](https://medium.com/@paulius.juozelskis/centralized-logging-in-net-core-using-graylog-and-serilog-4de7739051a)

## Links
- [Blog](https://blog.abp.io/abp)
