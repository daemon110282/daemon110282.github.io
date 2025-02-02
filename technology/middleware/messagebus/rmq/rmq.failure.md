# RMQ Failure

- [RMQ Failure](#rmq-failure)
	- [Зачем](#зачем)
	- [Patterns](#patterns)
		- [Dead Letter eXchange (DLX)](#dead-letter-exchange-dlx)
		- [Exc=Direct Queue DLX](#excdirect-queue-dlx)
		- [Retry Policy](#retry-policy)
		- [Circuit Breakers](#circuit-breakers)
		- [Redilivery](#redilivery)
		- [Rate limit](#rate-limit)

## Зачем

Реализация [паттернов обработки сбоев](../../../../arch/pattern/system.design/fault.tolerance/pattern.failure.md) для обеспечения атрибута качества ИС [Отказоустойчивость Fault tolerance](../../../../arch/ability/fault.tolerance.md):

- Basic.Reject with __reueue = true__ - отклоненение сообщения и возврат __в начало очереди__
	- минусы: лишняя нагрузка на внешний сервис, т.к. сообщения без задержки будут возвращаться в очередь. Решение: Basic.Reject with reueue = false + DLX.
- Basic.Reject with __reueue = false__ - отклоненение сообщения и [возврат в __DLX, затем в DLQ__->как DLX используется Exchange для сервиса (consumer)](https://habr.com/ru/companies/slurm/articles/714358/)
	- [Очередь повторных попыток](https://habr.com/ru/companies/slurm/articles/714358/) Dead Letter eXchange с __временной задержкой на повторную отправку сообщения__
		- обычно у сервиса (consumer) нет БД (stateless)
		- такой же вариант от ДомКлик [DLX->DLQ->как DLX используется Exchange для сервиса (consumer)](https://habr.com/ru/companies/domclick/articles/500978/)
	- [Алгоритм](https://blog.rnds.pro/019-poison2) обработки "битого" сообщения [Poison Message](https://blog.rnds.pro/018-posion1)
- Basic.Nack
	- реализует __то же самое поведение__ что и метод отклика __Basic.Reject__, но при этом он __добавляет несколько отсутствующих аргументов__ к множественному поведению Basic.Ack.
	- Выступая в качестве частного дополнения RabbitMQ для протокола AMQP, Basic.Nack __не гарантирует его присутствия в прочих брокерах AMQP__, [таких как QPID или ActiveMQ](http://onreader.mdl.ru/RabbitMQInDepth/content/Ch05.html).

## Patterns

- [Transactional outbox](../../../../arch/pattern/system.design/fault.tolerance/transact.outbox.md)
- [Transactional Inbox](../../../../arch/pattern/system.design/fault.tolerance/transact.inbox.md)

### Dead Letter eXchange (DLX)

- x-mesage-ttl — превышение времени жизни;
- x-max-length — превышение длины очереди;
- reject with __reueue = false__ — явный реджект сообщений со стороны консьюмера.

### Exc=Direct Queue DLX

- must specify a [dead letter routing key](https://stackoverflow.com/questions/21742232/rabbitmq-dead-letter-exchange-never-getting-messages)
- <https://javascopes.com/spring-amqp-error-handling-8dbc1045/>

### Retry Policy

- [MassTransit](https://masstransit.io/documentation/concepts/exceptions)

### Circuit Breakers

- [MassTransit](https://masstransit.io/documentation/concepts/exceptions)

### Redilivery

- [MassTransit](https://masstransit.io/documentation/concepts/exceptions#redelivery)

### Rate limit

- [masstransit](https://www.gokhan-gokalp.com/en/messaging-yapilarinda-masstransit-ile-error-ve-redeliver-handling/)
