# Celery - Distributed task queue

## Зачем

- [Celery is a task queue implementation for Python](https://www.caktusgroup.com/blog/2014/09/29/celery-production/) web applications used to asynchronously execute work outside the HTTP request-response cycle.
  - помогает запускать отложенный или выделенный код в отдельном процессе или даже на отдельном компьютере или сервере
- task chains цепочка задач
- [task routing](http://celery.readthedocs.org/en/latest/userguide/routing.html)
  - auto-scaling
  - Пример Task queue - фоновые задачи, отправка email

## Технологии

- [work on Django](https://webdevblog.ru/python-celery/amp/):
- RMQ
  - [AMQP Basic Properties support](https://docs.celeryq.dev/en/v5.2.7/userguide/tasks.html#:~:text=to%20(queue%20name).-,correlation_id,-Usually%20the%20same)
- [Redis](../redis.md)
- Azure
- Celery позволяет запускать задачи с помощью планировщиков, таких как crontab в Linux
- В производственной среде вы захотите запускать worker в фоновом режиме в качестве демона службы
- Celery может быть распределен, когда у вас есть несколько worker на разных серверах, которые используют одну очередь сообщений для планирования задач.
  - 1 App - X worker
- Worker обработчик задач из task queue в отдельном рабочем процессе
  - 1 task queue - X worker
- Мониторинг Celery с помощью Flower
