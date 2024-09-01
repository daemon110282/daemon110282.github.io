# Camunda

## Зачем

- Зачем BPMS давай State Machine? Не подходят т.к. распределен по времени BPM и может быть несколько состояний в один момент времени.
- Зачем BPMS давай Сеть Петри? Нет готовых решений, сложно реализовать
- Camunda bpm engine. Such an engine is a set of libraries, making it possible to execute predefined processes. This approach enabled us to create a flexible and scalable architecture, which includes the following advantages:
	- A capability to restore the process from the point of any recent tech failure; on top of that, such a capability is available right 'from the box'
	- Integration of GUI enables __real-time monitoring__ capabilities
	- A capability to write __unit tests__ focused not only on the logic and integration but also on the process itself

## Плюсы-минусы

Минусы:

- Сложность
- Без программистов не работает
- Маркетинг врет)
- Механизм компенсации - отмены БП

## Паттерны

- Метрики BPM SLA
	- Prometeus - Grafana
	- Prometeus - DWH
- RetryPolicy есть если внешний сервис вызывается