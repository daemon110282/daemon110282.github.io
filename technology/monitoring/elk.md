# ELK 

[ELK](https://gitinsky.com/elkstack)
- Logstash 
	- конвейер по парсингу данных (логов событий) 
	- Input-[Filter](https://logz.io/blog/5-logstash-filter-plugins/)-Output трансформация данных 
- Elasticsearch
	- распределенная [API](https://www.elastic.co/guide/en/elasticsearch/reference/6.1/api-conventions.html) RESTful-система на основе JSON
	- хранилище данных - NoSQL-база данных (сохраняет все собранные данные), масштабируемое нереляционное 
	- поисковой системы
	- аналитической системы
- Kibana
	- GUI, dashboards, ![charts](https://dytvr9ot2sszz.cloudfront.net/wp-content/uploads/2021/04/fourth-elk-guide-edited.jpg)
	- Logs
	- ![Visualization](https://dytvr9ot2sszz.cloudfront.net/wp-content/uploads/2021/04/image15-edited.png)

[Use Cases](https://logz.io/learn/complete-guide-elk-stack/?utm_source=pocket_saves#common-pitfalls:~:text=guide%40logz.io-,Use%20Cases,-The%20ELK%20Stack)
- APM
- Security and compliance
	- SIEM
- BI
- SEO

Минусы:
- в Elasticsearch [нет встроенной системы авторизации и управления правами доступа](https://gitinsky.com/elkstack), что может привести к проблемам с ИБ
- масштабирование может оказаться затратным 
- JVM стек потребляет много ресурсов CPU и RAM
- установка и запуск стека ELK — далеко не простой процесс

![arch](https://dytvr9ot2sszz.cloudfront.net/wp-content/uploads/2021/04/Group-1207.jpg)

Beats — a family of log shippers for different use cases containing 
	- Filebeat
	- Metricbeat
	- Packetbeat
	- Auditbeat
	- Heartbeat
	- Winlogbeat

## Elasticsearch

- [Basic Elasticsearch Concepts](https://logz.io/learn/complete-guide-elk-stack/)
- [Elasticsearch Plugins](https://logz.io/learn/complete-guide-elk-stack/)

## Aplication Performance Monitoring (APM) 

JS Client
- Под фреймворки агенты [React, Angular, Vue.js](https://www.elastic.co/guide/en/apm/agent/rum-js/master/framework-integrations.html)
- На вход может принимать из [opentracing](https://www.elastic.co/guide/en/apm/agent/rum-js/master/opentracing.html)

## Deployment

- [CPU RAM](https://gitinsky.com/elkstack?utm_source=pocket_saves#:~:text=%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5%20%D1%82%D1%80%D0%B5%D0%B1%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)
- [docker](https://logz.io/blog/elk-stack-on-docker/)