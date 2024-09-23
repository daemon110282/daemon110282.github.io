# Kafka

## Зачем

Реализация [паттерна интеграции](../../../arch/pattern/integration/pattern.integration.md) [Message Broker](../../../arch/pattern/integration/pattern.messagebroker.md).

Фундаментальное [отличие Kafka от брокеров очередей](https://slurm.io/tpost/pnyjznpvr1-apache-kafka-osnovi-tehnologii) состоит в том, как сообщения хранятся на брокере и как потребляются консьюмерами.

Сообщения в Kafka организованы и хранятся в именованных __топиках (Topics)__, каждый топик состоит из одной и более __партиций (Partition)__, распределённых между брокерами внутри одного кластера.

- Log processing and analysis
- Data streaming in recommendations
- System monitoring and alerting
- CDC (Change data capture)
- System migration

## Плюсы и минусы

Плюсы:

- распределенный горизонтально масштабируемый отказоустойчивый журнал коммитов
- Поток событий
- Шардинг из коробки
- Strict __message ordering__
- Message retention for extended periods, including the possibility of __replaying past messages__
  - Сообщения в Kafka __не удаляются брокерами по мере их обработки консьюмерами__ — данные в Kafka могут храниться днями, неделями, годами.
  - Благодаря этому одно и то же __сообщение может быть обработано сколько угодно раз__ разными консьюмерами и в разных контекстах.s
- Агрегация в пачки

Минусы:

- Наиболее полно __API Kafka поддерживается только в языках Java и Scala__. В других языках поддержка не всегда полная, поэтому фреймворки Kafka Connect и Kafka Streams созданы.
- [Нет приоритета сообщений](https://blog.bytebytego.com/p/how-to-choose-a-message-queue-kafka)

## Модель

Каждое сообщение (event или message) в Kafka состоит из:

- ключа
- значения
- таймстампа
- и опционального набора метаданных (так называемых хедеров)

[TODO](https://slurm.io/tpost/pnyjznpvr1-apache-kafka-osnovi-tehnologii)