# PHP

- [PHP](#php)
	- [Frameworks](#frameworks)
	- [Patterns](#patterns)
		- [Background Job](#background-job)
			- [YII2 queue](#yii2-queue)
				- [мониторинг](#мониторинг)
			- [Laravel](#laravel)
		- [DDD](#ddd)
		- [Message Bus](#message-bus)
		- [Observability](#observability)
		- [Configuration](#configuration)

## Frameworks

- [YII2](yii2.md)
- Laravel

## Patterns

Реализации паттернов:

### Background Job

- [Background Job](../../arch/pattern/background.job.md): выполнить (handle) X Task of Job by X Worker process
  - Free
    - Cron Job __not scalable, limit 1 min period check jobs__
    - daemon supervisord
		- Task [Queue YII2](https://github.com/yiisoft/yii2-queue) persist to RMQ, Redis, DB on [supervisord](../os/supervisord.md)
		- [Hermes 2.1.0 2019](https://github.com/tomaj/hermes) persist to Redis, RMQ, ZeroMQ
		- [SimpleBus 3.0 2022](https://github.com/SimpleBus/SimpleBus) persist to Doctrine ORM, DBAL, __RMQ?, Redis?__
		- [Tactician 1.0 2021](https://tactician.thephpleague.com/) persist by Doctrine to DB, [Bernand](https://bernardphp-com.readthedocs.io/projects/bernard/drivers.html) to RMQ, Redis, MongoDB и тд
		- [Laravel](https://laravel.com/docs/10.x/queues) persist to Redis, DB
		- [Bernard 0.13 2019](https://github.com/bernardphp/bernard) [example](https://medium.com/devcupboard/elegant-background-jobs-in-php-c61b91bf582b)
		- Ruby
			- [Bill](https://optimalbits.github.io/bull/) and PHP workers persist Redis
			- [Sidekiq](https://sidekiq.org/)
  - Commercial
    - [Ruby Sidekiq](https://sidekiq.org/) and PHP workers and GUI
    	- Workflow, Batches, Statistics
    	- How to use:
    		- Ruby worker class
    		- Jobs in PHP
    		- Run Sidekiq
    		- Enqueue job
    		- Sidekiq process job

#### YII2 queue

- RabbitMQ and AWS SQS drivers [don't support статус задач](https://github.com/yiisoft/yii2-queue/blob/master/docs/guide/usage.md#job-status)
- можно Job по [разным очередям публиковать](https://github.com/yiisoft/yii2-queue/blob/master/docs/guide/usage.md#multiple-queues) (по умолчанию единая)
	- отдельно [запускаются через supervisord фоновые процессы](https://github.com/yiisoft/yii2-queue/issues/32)
- __Redis, AMQP Interop drivers__ - Full support for [retryable jobs is implemented](https://github.com/yiisoft/yii2-queue/blob/master/docs/guide/retryable.md#restrictions)
- логирование по событиям [add task, exec before start\after stop\after error, worker start\stop](https://github.com/yiisoft/yii2-queue/blob/master/src/LogBehavior.php)

##### мониторинг

выполнения задач

  - некоторые driver, которые поддерживают __статус задачи__ (Redis поддерживает, RMQ - нет)
	- support [queue/info](https://www.programmersought.com/article/76143923971/)
	- [GUI queue manager](https://fasthub.cc/ignatenkovnikita/yii2-queuemanager)
      - необходима поддержка статуса задач на уровне driver
      - обрабатывает события [yii2-queue](https://github.com/yiisoft/yii2-queue/blob/master/docs/guide/usage.md#handling-events): startExec, afterExec, afterError
        - в БД хранит статистику
        - repeat, create, delete, find, worker status, duration task
    - [статус задач и workers](https://github.com/zhuravljov/yii2-queue-monitor), длительность ожидания в очереди, выполнения задач, кол-во попыток выполнения
      - __worker не поддерживаются AMQP driver__ (Redis поддерживает __при запуске в режиме run через cron__ и периодическом получении задач)
      - обрабатывает события [yii2-queue](https://github.com/yiisoft/yii2-queue/blob/master/docs/guide/usage.md#handling-events): afterPush, beforeExec, afterExec, afterError, workerStart, workerStop, workerLoop
    	- в БД хранит статистику отдельные таблицы: push, exec, worker
    	- очистка таблиц статистики
    - failed task handle
      - to [DB, file log](https://github.com/shmilyzxt/yii2-queue) for driver Redis, DB, Beanstalkd
      - to [DB](https://github.com/silverslice/yii2-queue-failed)
      	- for Any driver?
    	- no GUI
    	- CLI list, run all\byID, delete

процессов обработчиков очереди задач на уровне [supervisord](../os/supervisord.md)

  - обработка сигналов от supervisord перезапуска, остановки через [pcntl](https://www.php.net/manual/en/function.pcntl-signal.php)
  - [exit code в приложении](https://github.com/sergej-kurakin/supervisord-demo) для supervisord

#### Laravel

- job execute by [Number, All and exit process, Number Of Seconds](https://laravel.com/docs/10.x/queues#processing-a-specified-number-of-jobs)
- [мониторинг](https://laravel.com/docs/10.x/queues#monitoring-your-queues)
- [failed task handle](https://laravel.com/docs/10.x/queues#max-job-attempts-and-timeout) save [to table DB](https://laravel.com/docs/10.x/queues#dealing-with-failed-jobs), NoSQL [DynamoDB](https://laravel.com/docs/10.x/queues#storing-failed-jobs-in-dynamodb)
	- max count attempts
	- Time Based Attempts
	- count exception
	- timeout task
		- pcntl PHP extension need
- [retry failed job](https://laravel.com/docs/10.x/queues#retrying-failed-jobs)
	- delete failed job
	- [prune by time create failed job](https://laravel.com/docs/10.x/queues#pruning-failed-jobs)

### DDD

- [DDD](../../arch/ref/ddd/php.md)

### Message Bus

Паттерн арх-го стиля [EDA](../../arch/style/eda.md)

- RMQ [AMQP 0.9.1](https://github.com/php-amqplib/php-amqplib)
- [prooph](https://github.com/prooph/service-bus)
- [Symfony Messenger](https://symfony.com/doc/current/messenger.html)
- [Laravel Queues](https://laravel.com/docs/9.x/queues)
- [Ecotone Framework](https://github.com/ecotoneFramework/ecotone)
- [Symfony Messenger vs Laravel Queue vs Ecotone Framework](https://blog.devgenius.io/message-processing-in-php-symfony-messenger-laravel-queues-and-ecotone-8ca17102c5b2)
- [php-enqueue](https://github.com/php-enqueue/) поддержка Laravel, Magento2
- [simplebus](http://docs.simplebus.io/en/latest/index.html)

### Observability

[Prometheus](../store/prometheus.md) format metric:

- registry metric and type: counter, gauge set
- [collector registry](https://github.com/promphp/prometheus_client_php)
- [storage Redis](https://itnan.ru/post.php?c=1&p=544582), InMemory, APC
- exporter in format Prometheus for Prometheus\VM

### Configuration

- Variables (Env) not in Code [phpdotenv](https://github.com/vlucas/phpdotenv)
