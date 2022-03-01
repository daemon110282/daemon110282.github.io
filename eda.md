# активных паттернов:
1. Task Queue (циклическое распределение задач по консьюмерам)  Round-robin dispatching
2. Task Queue (распределение по загрузке QoS = 11, ack=1, autoack=0) Fair dispatching
3. Pub-Sub (fanout - без фильтрации)
4. Pub-Sub (headers - с фильтрацией)
5. RPC

# Exc=Direct Queue DLX
must specify a dead letter routing key https://stackoverflow.com/questions/21742232/rabbitmq-dead-letter-exchange-never-getting-messages

# Продажа 
Производительность https://habr.com/ru/company/oleg-bunin/blog/310418/

# Links
* https://habr.com/ru/company/itsumma/blog/416629/
* https://habr.com/ru/post/422151/
* https://habr.com/ru/post/150134/
