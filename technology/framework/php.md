# PHP

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
- __Redis, AMQP Interop drivers__ - Full support for [retryable jobs is implemented](https://github.com/yiisoft/yii2-queue/blob/master/docs/guide/retryable.md#restrictions)
- мониторинг 
	- выполнения задач
		- некоторые driver, которые поддерживают __статус задачи__ (Redis поддерживает, RMQ - нет)
			- support [queue/info](https://www.programmersought.com/article/76143923971/)
			- [GUI queue manager](https://fasthub.cc/ignatenkovnikita/yii2-queuemanager) 
				- необходима поддержка статуса задач на уровне driver
				- обрабатывает события [yii2-queue](https://github.com/yiisoft/yii2-queue/blob/master/docs/guide/usage.md#handling-events): startExec, afterExec, afterError
				- в БД хранит статистику
				- repeat, create, delete, find, worker status, duration task
		- [статус задач и workers](https://github.com/zhuravljov/yii2-queue-monitor)
			- обрабатывает события [yii2-queue](https://github.com/yiisoft/yii2-queue/blob/master/docs/guide/usage.md#handling-events): afterPush, beforeExec, afterExec, afterError, workerStart, workerStop, workerLoop
			- в БД хранит статистику отдельные таблицы: push, exec, worker
			- очистка таблиц статистики
		- failed task to [DB, file log](https://github.com/shmilyzxt/yii2-queue) for driver Redis, DB, Beanstalkd
	- процессов обработчиков очереди задач на уровне [supervisord](../os/supervisord.md)
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

- RMQ [AMQP 0.9.1](https://github.com/php-amqplib/php-amqplib)
