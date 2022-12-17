# ELK

- [ELK](#elk)
	- [Use Cases](#use-cases)
	- [Elasticsearch](#elasticsearch)
	- [Aplication Performance Monitoring (APM)](#aplication-performance-monitoring-apm)
	- [Kibana](#kibana)
	- [Deployment](#deployment)

![arch](https://dytvr9ot2sszz.cloudfront.net/wp-content/uploads/2021/04/Group-1207.jpg)

[ELK](https://gitinsky.com/elkstack) стек:

- Beats — a family of log shippers for different use cases containing
  - Filebeat
  - Metricbeat
  - Packetbeat
  - Auditbeat
  - Heartbeat
  - Winlogbeat
- Logstash
	- конвейер по парсингу данных (логов событий) 
	- Input-[Filter](https://logz.io/blog/5-logstash-filter-plugins/)-Output трансформация данных
- Elasticsearch
	- распределенная [API](https://www.elastic.co/guide/en/elasticsearch/reference/6.1/api-conventions.html) RESTful-система на основе JSON
	- хранилище данных - NoSQL-база данных (сохраняет все собранные данные), масштабируемое нереляционное
	- поисковой системы
	- аналитической системы
- Kibana
	- GUI, dashboards, charts
	- Logs
	- Visualization

## Use Cases

- [APM](../../arch/system.class/apm.md)
- [Security and compliance](https://logz.io/learn/complete-guide-elk-stack/?utm_source=pocket_saves#common-pitfalls:~:text=guide%40logz.io-,Use%20Cases,-The%20ELK%20Stack)
	- SIEM
- BI
- SEO

## Elasticsearch

- [Basic Elasticsearch Concepts](https://logz.io/learn/complete-guide-elk-stack/)
- [Elasticsearch Plugins](https://logz.io/learn/complete-guide-elk-stack/)

Минусы:

- в Elasticsearch [нет встроенной системы авторизации и управления правами доступа](https://gitinsky.com/elkstack), что может привести к проблемам с ИБ
- масштабирование может оказаться затратным
- JVM стек потребляет много ресурсов CPU и RAM
- установка и запуск стека ELK — далеко не простой процесс

![scheme](https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fac3c8a9f-2148-4a29-bc72-6898445d1b85_1357x1536.jpeg)

## Aplication Performance Monitoring (APM)

JS Client

- Под фреймворки агенты [React, Angular, Vue.js](https://www.elastic.co/guide/en/apm/agent/rum-js/master/framework-integrations.html)
- [Vue.JS APM client](https://www.elastic.co/guide/en/apm/agent/rum-js/master/vue-integration.html)
- На вход может принимать из [opentracing](https://www.elastic.co/guide/en/apm/agent/rum-js/master/opentracing.html)

## Kibana

- GUI, dashboards, ![charts](https://dytvr9ot2sszz.cloudfront.net/wp-content/uploads/2021/04/fourth-elk-guide-edited.jpg)
- Logs
- ![Visualization](https://dytvr9ot2sszz.cloudfront.net/wp-content/uploads/2021/04/image15-edited.png)
  
## Deployment

- [CPU RAM](https://gitinsky.com/elkstack?utm_source=pocket_saves#:~:text=%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B5%20%D1%82%D1%80%D0%B5%D0%B1%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)
- [docker](https://logz.io/blog/elk-stack-on-docker/)