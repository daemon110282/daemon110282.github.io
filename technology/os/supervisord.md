# supervisord

Служба запуска [фоновых процессов](http://supervisord.org/introduction.html).
Реализация паттера [Background Job](../../arch/pattern/background.job.md).

## Функции

- Старт
- [Сигналы процессам](http://supervisord.org/running.html#signals): SIGTERM, SIGINT, SIGQUIT, SIGHUP, SIGUSR2
- Перезапуск фоновых процессов (кол-во попыток перезапуска startretries)
	- по команде перезапуска службы - SIGHUP 
	- по ошибке
		- [Exit Status (Code)](https://blog.programster.org/supervisor-stop-subprocesses-entering-fatal-state)
			- 0 - success
			- <>0 - error
	- graceful shutdown, макс время на остановку stopwaitsecs
		- SIGTERM -> приложение отвечает SIGCHLD за не более stopwaitsecs
		- иначе [SIGTERM -> SIGKILL](https://medium.com/naukri-engineering/using-supervisor-to-manage-processes-in-linux-98ae4894e9c7)
- Остановка	
	- CRTL-C - SIGINT
	- по команде остановки - SIGTERM
	- по команде принудительного завершения SIGKILL
- Возможность ограничения времени выполнения процесса?? 
- [Subprocess State Transition Graph](http://supervisord.org/subprocess.html#id4)
- [Event для мониторинга](http://supervisord.org/events.html#event-types)
- Приоритизация фоновых процессов - [параметр priority](http://supervisord.org/configuration.html#program-x-section-settings)
- Параллельный запуск инстансов приложения (worker) - параметр numprocs (process_name нужно переопределить, если numprocs>1)

## Паттерны

- при изменении конф-и требуется __перезапуск__ службы
- при изменении кода процесса требуется __перезапуск__ [фонового процесса](https://blog-programmista.ru/post/75-php-kak-sozdat-programmu-demon-na-php-daemon.html)

## Observability

- logs by service, by process
- мониторинг
	- [superlance plugins](https://github.com/Supervisor/superlance/blob/main/docs/index.rst)
		- on crash send email
		- RAM use max size restart
	- supervisorctl [GUI](https://pro-prof.com/forums/topic/supervisord-инструмент-для-контроля-запущенны)
	- RAM, CPU utilization by process