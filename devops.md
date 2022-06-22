# DevOps

## Зачем

- CI
- CD
- A\B test
- Blue Green Deployment
- Canary Deployment
- Auto Scaling
- Service Mesh
- Доступность, Отказоустойчивость, Надежность
- Производительность
- Infrastructure-as-Code automation
- Сквозная функциональность
  - Log management (storage and analysis) 
  - Security
  - Audit


## Паттерны

### Сколько сервисов(BC) в одной контейнере

todo

### Auto Scaling

- Limit 
  - CPU
  - MEM 

### Blue Green Deployment

- [Oracle](https://docs.oracle.com/en/solutions/mod-app-deploy-strategies-oci/index.html#GUID-2207DEDA-718D-4264-B851-144EBF0E57CF)

### Canary Deployment

- [Oracle](https://docs.oracle.com/en/solutions/mod-app-deploy-strategies-oci/index.html#GUID-2207DEDA-718D-4264-B851-144EBF0E57CF)

## Технологии

- [k8s](technology/k8s.md)
- Helm
- docker-compose.yml when building a 
multi-container Docker application
- load balance, edge
  - Traefik
  - haproxy
  - Nginx
  - envoy l4-l7 
    -  https://www.envoyproxy.io/docs/envoy/latest/intro/what_is_envoy
    -  https://habr.com/ru/post/482578/
- CD
  - Spinnaker 
- Distribure Trace
- API Managment
  - Kong
- Service Mesh, 
  - Istio
  
- Infrastructure-as-Code (IaC) automation 
  - Pulumi (Python, Go) 
- Сквозная функциональность
  - Log management 
    - Elastic
    - GrayLog
  - Security
    - TLS – cert-manager
    - Key Managment
    - Key Vault
      - HashiCorp
  - Performance monitoring and dashboards 
    - Prometheus and Grafana
    - PRTG

## Links
- [Модель оценки компании](http://agilemindset.ru/%d0%bc%d0%be%d0%b4%d0%b5%d0%bb%d1%8c-%d0%be%d1%86%d0%b5%d0%bd%d0%ba%d0%b8-%d0%ba%d0%be%d0%bc%d0%bf%d0%b5%d1%82%d0%b5%d0%bd%d1%86%d0%b8%d0%b9-devops-%d0%b2-miro/)
