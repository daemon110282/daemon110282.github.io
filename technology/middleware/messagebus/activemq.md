# Apache ActiveMQ Artemis

## Зачем

Реализация [паттерна интеграции](../../../arch/pattern/integration/pattern.integration.md) [Message Broker](../../../arch/pattern/integration/pattern.messagebroker.md).

[Критерии выбора](../../../arch/pattern/integration/pattern.messagebroker.md#критерии-выбора).

## Плюсы-минусы

Плюсы:

- Интегрируется просто с Apache Camel
- Протокол\API [JMS](../../protocols.integration/jms.md)
  - JMS-селекторы, которые позволяют из читаемой вами [очереди отфильтровывать сообщения](https://habr.com/ru/companies/usetech/articles/683022/)
- AMQP, STOMP, OpenWire и MQTT
- Веб-консоль администратора
  - API [jolokia](https://jolokia.org/)
- High Availability

Минусы:

- JMS только Java стек, но есть AMQP
- Значительно медленее Kafka

## Функции

- [сохранение сообщений](https://activemq.apache.org/components/artemis/documentation/)
- приоритеты
- группировка
  - Clustered Message Grouping
- транзакции
- Гарантированная доступность: Обеспечивает высокую доступность через общее хранилище или сетевую репликацию.
  - High Availability, [scalable and failover scenarios](https://blog.jromanmartin.io/cheat-sheets/activemq-artemis) are:
    - Symmetric cluster with Replicated journal
    - Symmetric cluster with Shared journal
- Простая и мощная адресация: Модель адресации, независимая от протокола, обеспечивает гибкость
    - Artemis реализует концепцию "адреса" для маршрутизации сообщений и поддерживает различные типы маршрутизации, [включая anycast и multicast](https://www.mastertheboss.com/rabbitmq/activemq-vs-rabbitmq-a-comparison/)
      - RMQ концепцию "обмена". Exchange в RabbitMQ - это компонент маршрутизации сообщений, который определяет, как сообщения распределяются по очередям.
- Эффективная кластеризация: Гибкая кластеризация для равномерного распределения нагрузки.
- Расширенные возможности журнала: Обеспечивает надежное сохранение данных с низкой задержкой, включая поддержку JDBC.
- Аварийное восстановление: Асинхронное зеркальное отображение для эффективного восстановления после сбоев.
- Баланс нагрузки на основе данных: Использует данные для оптимального распределения нагрузки.

## Deployment

- Setup
  - [docker-compose](https://www.mastertheboss.com/jboss-frameworks/activemq/how-to-run-artemis-mq-as-docker-image/)
  - [Spring Boot Test App on k8s ActiveMQ Cluster](https://piotrminkowski.com/2022/07/26/activemq-artemis-with-spring-boot-on-kubernetes/)
- Test
  - docker-compose [asp.net core](https://havret.io/activemq-artemis-net-core)
  - [get started](https://github.com/apache/activemq-artemis-examples/?tab=readme-ov-file)
  - over [90 examples](https://github.com/apache/activemq-artemis)

## Version

- 2.37
