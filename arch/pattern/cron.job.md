# Cron Job

## Зачем

Периодические, повторяющиеся задания по расписанию.

## Паттерны

- хранилище требуется - БД, key-value
	- Using [Task Scheduler available on windows to invoke an execution](https://giangpham.io/blog/building-a-scheduled-job-with-net-core-and-quartz/)
	- Using a trigger web job built with WebJob SDK
	- Using a SQL agent to trigger a SSIS package	
	- Library
- хранилище НЕ требуется
	- Using a job pod running inside k8s

## Технологии

- not k8s - хранилище требуется
	- Library [Quartz.Net](../../technology/middleware/job/quartz.md)
- __хранилище НЕ требуется__ сервис stateless		
	- Using a job pod running inside [k8s](../../technology/ci-cd/k8s.md)
		- CronJob
		- Job
