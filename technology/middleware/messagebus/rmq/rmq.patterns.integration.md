# RMQ Паттерны Интеграции

- [RMQ Паттерны Интеграции](#rmq-паттерны-интеграции)
  - [Task (Worker) Queue](#task-worker-queue)
  - [Simple one-way messaging](#simple-one-way-messaging)
  - [Publish-subscribe Издатель-Подписчик](#publish-subscribe-издатель-подписчик)
    - [headers vs topic для событий](#headers-vs-topic-для-событий)
  - [RPC (команды)](#rpc-команды)
  - [Direct Reply-To](#direct-reply-to)

## Task (Worker) Queue

- Round-robin dispatching - __циклическое распределение задач__ по консьюмерам
  - сервисы между собой делят Очередь задач
  - паттерн EIP [Competing Consumers](https://www.enterpriseintegrationpatterns.com/patterns/messaging/CompetingConsumers.html)
  - Exchange type: direct
  - Several consumer listening to the same queue, reading the messages in a round-robin fashion if all are waiting
- Task Queue - распределение __задач по загрузке__ [Fair dispatching](https://habr.com/ru/post/150134/)
  - QoS = 1, ack=1, autoack=0 если не подтверждено 1-е сообщение, 2-е пойдёт другому подписчику

## Simple one-way messaging

- Exchange type: direct
- message sent to __unnamed (default queue)__

## Publish-subscribe Издатель-Подписчик

- __Exchange type: fanout - без фильтрации__ - события
  - Очередь ответов - даёт широковешательную рассылку ответов по всем ИС потребителям
- __Exchange type: headers - с фильтрацией__ - события
  - даёт возможность делать фильтрацию трафика на уровне RMQ
  - подписчик
    - создаёт и связывает очередь к обменнику
    - указывает фильтрацию на основе заголовков - это решает задачу __фильтрации__ лишнего трафика
    - Но __не решает задачу изоляции__: Подписчик может не указать фильтры и получит весь трафик: и свой и чужой

Минусы:

- единый контракт для подписчиков
- Не безопасно, кто угодно подписывается
- с ростом числа подписчиков, Брокер масштабировать необходимо

### headers vs topic для событий

- headers более гибко т.к. key-value инвариантов может быть больше?
  - топик - фильтрация на основе строковой маски - поиска подстроки
  - headers - на основе полного равенства значения ключа (логическое И) или один из ключей (логическое ИЛИ)

Минусы:

- функционально разницы нет, по производительности topic в 3 раза медленнее headers

## RPC (команды)

[паттерн EIP](../../../../arch/pattern/integration/app/pattern.rpc.md)

- [Exchange type: direct](https://www.rabbitmq.com/tutorials/tutorial-six-dotnet.html)
- message can be sent to default exchange with a specified __routing key__
- response is received on a specified __unique response queue, owned by the client__
- message Header [correlation_id](https://habr.com/ru/post/236221/)
- message Header __reply_to__ куда отправить результат (ответ) команды

Пример реализации в EasyNetQ [RPC](https://github.com/EasyNetQ/EasyNetQ/wiki/Request-Response)

## Direct Reply-To

- Consumer подписывается на специальную псевдоочередь amqp.rabbitmq.reply-to
- Producer отправляет сообщение с указанием этой очереди в качестве __reply-to заголовка__
- RMQ генерирует для нас __уникальный routing_key__, по которому будет должно быть опубликовано ответное сообщение в default exchange
- сервер получает наше сообщение и [отправляет ответ по этому routing_key](https://habr.com/ru/articles/747644/)
