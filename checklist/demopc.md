# Демо ПК

## План

- [ ] Сервер
  - [x] VM VirtualBox 7.0.18
    - [x] Windows 8.1 Pro 64 RAM 2Gb Core I5-12400F 2.5Ghz
  - [ ] docker
  - [ ] k8s
- [x] Веб сервер
  - [x] IIS 8.5
- Store
  - СУБД
  - NoSQL
- [ ] Middleware
  - [ ] RMQ
  - [ ] Kafka
- Develop
  - [x] Visual Studio Ultimate 2012 11.0.50727.1
- [ ] Сервис  
  - [x] WCF .NET 4.5
    - [x] [HelloWorld WCF SOAP Service](https://www.codeproject.com/Articles/531332/Implementing-a-Basic-Hello-World-WCF-Service-v)
    - [x] [HelloWorld WCF REST Service JSON format](https://www.c-sharpcorner.com/article/wcf-restful-service/)
    - [ ] [WCF Load Test Demo Project](https://github.com/pflb/wcfLoadTest/blob/master/docs/description.md)
  - [ ] .NET Core 8.0
- [ ] Клиент
  - [x] WCF .NET 4.5
  - [ ] .NET Core
- [ ] Test
  - [x] WCF REST Postman
  - [x] WCF SOAP SOAPUI
- [ ] Observability
  - [ ] Мониторинг
    - [ ] Метрики
    - [ ] Tools
      - [x] PerfMon
    - [ ] Компоненты
      - [x] Сервер: CPU, RAM, IO, Network, Process
      - [x] IIS
      - [x] ASP.NET
      - [ ] Сервис
      - [ ] Клиент
  - [ ] Логирование
    - [ ] LogParser
- НТ
  - [ ] Настройки
    - [ ] IIS
      - [ ] [CPU Throttling](https://learn.microsoft.com/en-us/iis/get-started/whats-new-in-iis-8/iis-80-cpu-throttling-sand-boxing-sites-and-applications?source=recommendations)
    - [ ] ASP.NET
    - [ ] WCF
      - [ ] Прочитать текущие значения настроек
      - [ ] [maxConnections, openTimeout, closeTimeout, receiveTimeout, sendTimeout, timeToLive](https://weblogs.asp.net/paolopia/wcf-configuration-default-limits-concurrency-and-scalability)
      - [ ] [Throttling, processModel](https://www.codeproject.com/Articles/133738/Quick-Ways-to-Boost-Performance-and-Scalability-of)
  - [ ] Tools
    - [x] JMeter
      - [x] [Setup Test Plan](https://www.red-gate.com/simple-talk/devops/testing/load-stress-testing-net-apps-with-apache-jmeter/)
  - [ ] Use Case
    - [ ] High CPU
      - [x] Metric PerfMon
      - [ ] Dump Analyse
    - [ ] High Latency API (Timeout)
    - [ ] High RAM
    - [ ] Thread pool starvation
    - [ ] GC LOH
    - [ ] Session lock
- Troubleshoting
  - Tools
  - Компоненты
    - [ ] IIS
    - [ ] WCF
      - [ ] [Текущие параметры собрать](https://www.dotnetfunda.com/articles/show/3485/11-tips-to-improve-wcf-restful-services-performance)
    - Сервис
    - Клиент

## Docker Example

- install
	https://docs.docker.com/desktop/install/windows-install/
	D:\Distr\Docker
- rmq
	https://hub.docker.com/_/rabbitmq
	docker run -d -p 15672:15672 --hostname my-rabbit --name some-rabbit rabbitmq:3-management
	http://localhost:15672/
- opentelemetry+jaeger+Grafana
	https://github.com/open-telemetry/opentelemetry-demo/blob/main/docs/docker_deployment.md
- spa vuejs
	php yii2 backend
		https://www.twilio.com/blog/build-single-page-application-in-php-yii-2-0-vue-js
		docker https://github.com/yemiwebby/vue-yii-app
- graviteeio APIM Management
	https://medium.com/graviteeio/getting-gravitee-io-api-management-platform-up-and-running-on-a-local-machine-9408d07221e6
	vpn need Russia blocked
- keycloak 18.0.2 - акт-я 20.
	docker compose up --no-build
	docker compose start
	docker compose pause
	docker compose stop

