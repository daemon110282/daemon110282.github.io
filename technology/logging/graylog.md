# GrayLog

- Поисковый движок на базе Elasticsearch.
- GELF ([TCP, UDP, HTTP](https://www.programmersought.com/article/85357770876/), Kafka, AMQP)
- [k8s sidecar](https://habr.com/ru/post/557200/)
- Manage REST API
	- [Node JS Server fro GrayLog2 API v1.1.4](https://github.com/kolomiichenko/graylog-api)


- Graylog-сервер (пакет ElstaicSearch): Graylog получает журналы от различных внутренних приложений и предоставляет интерфейс веб-доступа
- Graylog Collector Sidecar: отвечает за сбор журналов приложений и отправку их на Graylog-сервер
- Elasticsearch: используется для индексации и сохранения полученных журналов, производительность зависит от памяти и ввода-вывода жесткого диска
- MongoDB: NoSQL DB отвечает за сохранение информации о конфигурации Graylog, нагрузка не высокая

![arch](https://russianblogs.com/images/450/09bb39e0719eed753f9714e60933bbca.png)

HA:
![arch HA](https://russianblogs.com/images/234/92c7723e145af2b440e601d8342ee94a.png)

## Плюсы-Минусы

Плюсы:

- OpenSource
- коммерческая поддержка GrayLog Enterprise (под капотом Elastisearch)
- Простота развертывания и обслуживания, простота в использовании и интегрированное решение
- По сравнению с синтаксисом json от ES синтаксис поиска относительно прост, и результаты поиска можно выделить
- Встроенное простое оповещение можно вспомнить через веб-API или по электронной почте
- Может напрямую экспортировать поисковый JSON-файл для облегчения разработки поисковых скриптов, которые вызывают остальные API

Минусы:

- API?
- Производительность

## Compare

- [GrayLog vs ELK](https://russianblogs.com/article/404130660/)