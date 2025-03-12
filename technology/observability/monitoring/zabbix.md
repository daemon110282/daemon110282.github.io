# Zabbix

[Network Monitoring](https://www.zabbix.com/ru/network_monitoring)

- Network bandwidth usage
- Packet loss rate
- Interface errorrate
- High CPU or memory utilization
- Number of tcp connections is anomaly high for this day of the week
- Aggregate throughput of core routers is low
- [Ping](https://www.zabbix.com/integrations/ping)
- [Hosts group](https://www.zabbix.com/documentation/6.2/en/manual/definitions)
  - Host
    - Items
    - Dashboard  
      - Widget  
        - Graph
          - Item
    - Problems
      - From Trigger
- Template (Items, Problems, Triggers) by система для мониторнга 
  - [RMQ](https://www.zabbix.com/integrations/rabbitmq)
- [Аудит изменений](https://www.youtube.com/watch?v=Uj0c1rN3T5M ) пороговых значений по тригерам
  - [Code Review](https://www.securitylab.ru/blog/company/pt/345360.php)
  - [5 Audit log](https://www.zabbix.com/documentation/6.4/en/manual/web_interface/frontend_sections/reports/audit_log?hl=Audit%2Caudit)

## Item

- Разные типы
  - [виртуальная метрика Trapper](https://www.zabbix.com/documentation/current/en/manual/config/items/itemtypes/trapper)
    - обновление значений через консоль [zabbix-sender](https://sbcode.net/zabbix/zabbix-sender/)

## Кейсы

- СУБД
  - MS SQL
    - [2019](https://dzen.ru/a/YciJa4I4YzUrCC76)
    - [счетчики производительности](https://habr.com/ru/articles/338498/)
