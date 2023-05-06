# PHP

## Frameworks

- [YII2](yii2.md)
- Laravel

## Patterns

Реализации паттернов:

### Background Job

- [Background Job](../../arch/pattern/background.job.md)
	- Free
		- Cron Job not scalable, limit 1 min period check jobs
	  	- Task [Queue YII2](https://github.com/yiisoft/yii2-queue) persist to RMQ, Redis, DB
			- RabbitMQ and AWS SQS drivers [don't support job statuses](https://github.com/yiisoft/yii2-queue/blob/master/docs/guide/usage.md#job-status)
			- можно Task\Job по [разным очередям публиковать](https://github.com/yiisoft/yii2-queue/blob/master/docs/guide/usage.md#multiple-queues) (по умолчанию единая)
			- __Redis drivers__ - Full support for [retryable jobs is implemented](https://github.com/yiisoft/yii2-queue/blob/master/docs/guide/retryable.md#restrictions)
	  	- [Hermes 2.1.0 2019](https://github.com/tomaj/hermes) persist to Redis, RMQ, ZeroMQ
		- [SimpleBus 3.0 2022](https://github.com/SimpleBus/SimpleBus) persist to Doctrine ORM, DBAL, __RMQ?, Redis?__
		- [Tactician 1.0 2021](https://tactician.thephpleague.com/) persist by Doctrine to DB, [Bernand](https://bernardphp-com.readthedocs.io/projects/bernard/drivers.html) to RMQ, Redis, MongoDB и тд
		- Ruby
			- [Bill](https://optimalbits.github.io/bull/) and PHP workers persist Redis
			- [Sidekiq](https://sidekiq.org/)
		- [Laravel](https://laravel.com/docs/10.x/queues) persist to Redis, DB
		- [Bernard 0.13 2019](https://github.com/bernardphp/bernard) [example](https://medium.com/devcupboard/elegant-background-jobs-in-php-c61b91bf582b)
	- Commercial
		- [Ruby Sidekiq](https://sidekiq.org/) and PHP workers and GUI
			- Workflow, Batches, Statistics
			- How to use:
				- Ruby worker class
				- Jobs in PHP
				- Run Sidekiq
				- Enqueue job
				- Sidekiq process job

### DDD

- [DDD](../../arch/ref/ddd/php.md)

### Message Bus

- RMQ [AMQP 0.9.1](https://github.com/php-amqplib/php-amqplib)
