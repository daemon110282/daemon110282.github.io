# Postgresql

RTO - [Recovery Time Objective](https://en.wikipedia.org/wiki/Disaster_recovery#Recovery_Time_Objective)

## Managment
- PgAdmin
- https://dbeaver.io/



## Replication
- https://www.postgresql.org/docs/current/runtime-config-replication.html

### Log Shipping
- Master (Primary) -> Slave (standby or secondary) 
  - accept connections and serves **read-only queries** is called a **Hot Standby Server**
- https://www.postgresql.org/docs/current/warm-standby.html
- [log shipping methodology](https://medium.com/@PinkOwl/postgresql-and-me-log-shipping-replication-6bc945757822)
  - File based log shipping - asynchronous in nature and logs are shipped after they have been written to disk and thus may increase the RTO
  - Record base log shipping (Streaming Replication) - data loss can be minimised

## Reporting Tools
- https://www.postgresql.org/download/products/5/
- BIRT https://eclipse.github.io/birt-website/

## Links
- https://assets.ctfassets.net/9n3x4rtjlya6/692exG1cv13VCVpBNqKXpD/55ff0f850c6cff66e60ba72269b1b75f/Migration_to_PostgreSql.pdf
- https://medium.com/@PinkOwl/postgresql-and-me-log-shipping-replication-6bc945757822
- https://www.postgresql.org/docs/current/runtime-config-replication.html
