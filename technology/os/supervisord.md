# supervisord

Служба запуска [фоновых процессов](http://supervisord.org/introduction.html).
Реализация паттера [Background Job](../../arch/pattern/background.job.md).

## Функции

- Старт
- Перезапуск фоновых процессов 
	- по ошибке
		- Exit Code
- Остановка
	- по команде перезапуска службы SIGTERM 
	- по команде остановки SIGCHLD 
	- по команде принудительного завершения SIGKILL
- Возможность ограничения времени выполнения процесса?

## Observability

- logs by service, by process
- мониторинг
	- RAM, CPU utilization by process