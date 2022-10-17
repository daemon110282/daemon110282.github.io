# ABP.IO Platform

- [ABP.IO Platform](#abpio-platform)
  - [Плюсы и минусы](#плюсы-и-минусы)
  - [Deployment](#deployment)
  - [Сквозная функциональность](#сквозная-функциональность)
    - [Authentication, Authorization](#authentication-authorization)
    - [Multi Tenant](#multi-tenant)
    - [Audit](#audit)
    - [Logging](#logging)
  - [Links](#links)

## Плюсы и минусы

[Критерии](../arch.criteria.md)

| + | - |
| - | - |
| лицензия LGPL + коммерческая при необх-ти | vue не из коробки, т.е. пишем на React |
| с 2012 года, много релизов | LDAP Auth платный модуль|
| [feature toggle by tenant](https://docs.abp.io/en/abp/latest/Modules/Tenant-Management#managing-the-tenant-features)
| DDD заявлен, по коду тут как ОР скажет)
| RMQ
| модульный монолит->микросервисы заявлено
| swagger
| [workflow](https://community.abp.io/posts/using-elsa-workflow-with-the-abp-framework-773siqi9)
| [CICD + docker + k8s](https://community.abp.io/posts/.net-core-microservice-application-with-abp-docker-and-cicd-part-10-8snm8lwy)
| [Identity Server4](http://docs.identityserver.io/), OpenID Connect protocol, Ouath

## Deployment

- [Структура(слои) приложения](https://docs.abp.io/en/abp/latest/Startup-Templates/Application)
  - ![Слои приложения](https://raw.githubusercontent.com/abpframework/abp/rel-5.3/docs/en/images/layered-project-dependencies.png)
  - ![Tiered structure](https://raw.githubusercontent.com/abpframework/abp/rel-5.3/docs/en/images/tiered-solution-servers.png)
  - ![With Identity Server](https://raw.githubusercontent.com/abpframework/abp/rel-5.3/docs/en/images/tiered-solution-applications.png)
- [Кластер приложения с балансировщиком](https://docs.abp.io/en/abp/latest/Deployment/Clustered-Environment)
  - ![clusterd](https://raw.githubusercontent.com/abpframework/abp/rel-5.3/docs/en/images/deployment-clustered.png)

## Сквозная функциональность

### Authentication, Authorization

- Authentication Identity
  - https://docs.abp.io/en/abp/latest/Modules/Identity
  - [IAM](../../arch/iam.md) [IdentityServer4](https://docs.abp.io/en/abp/latest/Modules/IdentityServer)
  - [SSO](../../arch/sso.md)
    - https://academy.hiretechteam.com/blog/how-to-implement-single-sign-with-abp-commercial-application
    - https://www.google.com/url?sa=t&source=web&rct=j&url=https://www.youtube.com/watch%3Fv%3Dth3IugJGQDA&ved=2ahUKEwiv1Z3VtuH6AhURCBAIHbxoC1I4ChC3AnoECBwQAg&usg=AOvVaw3LGyJwYvrPLvmjBpHgP-Jw
    - [OpenID Connect module](https://docs.abp.io/en/abp/latest/Modules/OpenIddict) on https://documentation.openiddict.com
- [Authorization](https://docs.abp.io/en/abp/latest/Authorization)
  - [Disable Concurent Login](https://support.abp.io/QA/Questions/3047/Disable-concurrent-user-login)
  - Под разные UI FE 
    - [Angular](https://docs.abp.io/en/abp/latest/UI/Angular/Authorization)
    - React
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
  - Request, [Change Entity](https://github.com/abpframework/abp/blob/dev/framework/src/Volo.Abp.Auditing/Volo/Abp/Auditing/AuditPropertySetter.cs), Errors, Comment
  - By Service (Controler\Action)
  - By Entity\Properties
- [Module](https://docs.abp.io/en/abp/latest/Modules/Audit-Logging)
  - Aggregate
  - EF Core
    - Tables
  - Mongo DB


### Logging

- SerialLog
  - [2graylog](https://medium.com/@paulius.juozelskis/centralized-logging-in-net-core-using-graylog-and-serilog-4de7739051a)

## Links

- [Blog](https://blog.abp.io/abp)
