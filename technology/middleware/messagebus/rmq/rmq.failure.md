# RMQ Failure 

Реализация [паттернов обработки сбоев](../../../../arch/pattern/fault.tolerance/pattern.failure.md):

- [Очередь повторных попыток](https://habr.com/ru/companies/slurm/articles/714358/) Dead Letter eXchange  
	- сервиса (consumer) нет БД (stateless).
	- [Алгоритм](https://blog.rnds.pro/019-poison2) обработки "битого" сообщения [Poison Message](https://blog.rnds.pro/018-posion1) 

## Exc=Direct Queue DLX

must specify a [dead letter routing key](https://stackoverflow.com/questions/21742232/rabbitmq-dead-letter-exchange-never-getting-messages)

# Links

- https://javascopes.com/spring-amqp-error-handling-8dbc1045/
