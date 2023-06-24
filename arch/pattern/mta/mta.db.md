# Database multi-tenancy

- На уровне субд экземпляр бд
- Экземпляр instance субд, на одном ПК несколько может быть

## multi-database tenancy

- one database per tenant - database based isolation
- one schema per tenant - table based isolation
- shared table with PK tenant (рекомендуется, большая гибкость в секционировании горизонтальном при необходимости) - row based isolation
  - CITUS
  
## Single-database tenancy

- Single-database tenancy comes with lower devops complexity, but larger code complexity than multi-database tenancy, since you have to scope things manually, and won't be able to integrate some third-party packages.
- It is preferable when you have too many shared resources between tenants, and don't want to make too many cross-database queries.
