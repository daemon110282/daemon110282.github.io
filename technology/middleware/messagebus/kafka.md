# Kafka

## Зачем

Реализация [паттерна интеграции](../../../arch/pattern/integration/pattern.integration.md) [Message Broker](../../../arch/pattern/integration/pattern.messagebroker.md).

Фундаментальное [отличие Kafka от брокеров очередей](https://slurm.io/tpost/pnyjznpvr1-apache-kafka-osnovi-tehnologii) состоит в том:

- как __сообщения хранятся__ на брокере
  - Сообщения в Kafka организованы и хранятся в именованных __топиках (Topics)__, каждый топик состоит из одной и более __партиций (Partition)__, распределённых между брокерами внутри одного кластера.
- как __потребляются консьюмерами__
  - используется __подход pull__ (в RMQ push по умолчанию): консьюмеры сами отправляют запросы в брокер раз в n миллисекунд для получения новой порции сообщений
    - позволяет __группировать сообщения в пакеты__, достигая лучшей пропускной способности
  - Консьюмеры отмечают обработанные сообщения с помощью оффсетов. __Оффсет__ – это номер сообщения в партиции.

UC:

- Log processing and analysis
- Data streaming in recommendations
- System monitoring and alerting
- CDC (Change data capture)
- System migration

![mindmap](http://www.plantuml.com/plantuml/proxy?cache=no&src=https://raw.githubusercontent.com/daemon110282/daemon110282.github.io/daemon110282-patch-1/technology/middleware/messagebus/kafka.puml)

## Плюсы и минусы

Плюсы:

- распределенный горизонтально масштабируемый, отказоустойчивый журнал коммитов
- кластер серверов
- Поток событий
- Шардинг из коробки
- Strict __message ordering__
- Message retention for extended periods, including the possibility of __replaying past messages__
  - Сообщения в Kafka __не удаляются брокерами по мере их обработки консьюмерами__ — данные в Kafka могут храниться днями, неделями, годами.
  - Благодаря этому одно и то же __сообщение может быть обработано сколько угодно раз__ разными консьюмерами и в разных контекстах.s
- Группировка сообщений в пачки

Минусы:

- Наиболее полно __API Kafka поддерживается только в языках Java и Scala__. В других языках поддержка не всегда полная, поэтому фреймворки Kafka Connect и Kafka Streams созданы.
- [Нет приоритета сообщений](https://blog.bytebytego.com/p/how-to-choose-a-message-queue-kafka)
- к минусам модели Pull можно отнести потенциальную __разбалансированность нагрузки__ между разными консьюмерами и __более высокую задержку__ [обработки данных](https://vc.ru/dev/869548-kafka-vs-rabbitmq-chto-nuzhno-znat-analitiku-pro-brokery-soobshenii)

## Модель

Каждое сообщение (event или message) в Kafka состоит из:

- ключа
- значения
- таймстампа
- и опционального набора метаданных (так называемых хедеров)

[TODO](https://slurm.io/tpost/pnyjznpvr1-apache-kafka-osnovi-tehnologii)