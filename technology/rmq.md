# Паттерны:

1. Task Queue (циклическое распределение задач по консьюмерам ) Round-robin dispatching
  - сервисы между собой делят Очередь задач 
  - паттерн EIP Competing Consumers https://www.enterpriseintegrationpatterns.com/patterns/messaging/CompetingConsumers.html
3. Task Queue (распределение задач по загрузке ) Fair dispatching
  - QoS = 1, ack=1, autoack=0 если не подтверждена 1-е сообщение, 2-е пойдёт другому подписчику
5. Routing (fanout - без фильтрации) - события
  - TODO везде PubSub уточнить название 
  - Очередь ответов - даёт широковешательную рассылку ответов по всем ИС потребителям
6. Routing (headers - с фильтрацией) - события
  - даёт возможность делать фильтрацию трафика на уровне RMQ. подписчик создаёт и связывает очередь к обменнику, указывает фильтрация на основе заголовков -это решает задачу фильтрации лишнего трафика, но не решает задачу изоляции. подписчик может не указать фильтры и получит весь трафик: и свой и чужой.
7. RPC (команды)
  - паттерн EIP Request-Reply https://www.enterpriseintegrationpatterns.com/patterns/messaging/RequestReply.html

# Режимы доставки сообщений:

1.basic.get Доставка единичного сообщения по запросу polling;
2.Basic.Consume (Push) Подписка на очередь (постоянный мониторинг очереди с доставкой всех сообщений). Паттерн Pub-Sub 

# Рекомендации

## headers vs topic для событий 

- более гибко т.к. key-value инвариантов может быть больше?
  - топик - фильтрация на основе строковой маски - поиска подстроки
  - headers - на основе полного равенства значения ключа
-минусы
- функционально разницы нет, по производительности topic в 3 раза медленнее headers

# версионирование сообщений
* https://masstransit-project.com/architecture/versioning.html

# Links
- [Типы Exchange](https://habr.com/ru/post/489086/)
  - [Headers exchange](https://codedestine.com/rabbitmq-headers-exchange/)

