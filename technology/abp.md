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

