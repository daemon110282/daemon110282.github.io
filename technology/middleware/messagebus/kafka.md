# Kafka

## Зачем

- Log processing and analysis
- Data streaming in recommendations
- System monitoring and alerting
- CDC (Change data capture)
- System migration

## VS MessageBus

Фундаментальное [отличие Kafka от брокеров очередей](https://slurm.io/tpost/pnyjznpvr1-apache-kafka-osnovi-tehnologii) состоит в том, как сообщения хранятся на брокере и как потребляются консьюмерами:

- Сообщения в Kafka __не удаляются брокерами по мере их обработки консьюмерами__ — данные в Kafka могут храниться днями, неделями, годами.
- Благодаря этому одно и то же __сообщение может быть обработано сколько угодно раз__ разными консьюмерами и в разных контекстах.

Каждое сообщение (event или message) в Kafka состоит из:

- ключа, 
- значения, 
- таймстампа 
- и опционального набора метаданных (так называемых хедеров).

Сообщения в Kafka организованы и хранятся в именованных __топиках (Topics)__, каждый топик состоит из одной и более __партиций (Partition)__, распределённых между брокерами внутри одного кластера.

TODO https://slurm.io/tpost/pnyjznpvr1-apache-kafka-osnovi-tehnologii