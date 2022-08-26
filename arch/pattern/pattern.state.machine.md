# Finite State Machines (FSM) Конечные автоматы

- множество состояний объекта
- множество допустимых переходов по бизнес правилам
- множество доступных операций для каждого состояния, в контексте каждой Роли
- триггеры событий перехода из состояния
- обработчик события "До перехода", "После перехода"

[workflow engine vs state machine](https://workflowengine.io/blog/workflow-engine-vs-state-machine/)

## Зачем

Необходима гибкая модель настройки состояний, условий и возможных переходов на уровне ИС

## Плюсы минусы

[+-](https://medium.datadriveninvestor.com/state-machine-design-pattern-why-how-example-through-spring-state-machine-part-1-f13872d68c2d)

## Технологии

- [stateless .net core](https://www.hanselman.com/blog/stateless-30-a-state-machine-library-for-net-core)
- [spring State Machine](https://spring.io/projects/spring-statemachine)
- bpms
	- [zeebe-io?](https://blog.bernd-ruecker.com/how-we-built-a-highly-scalable-distributed-state-machine-f2595e3c0422) 
	- camunda?
	- apache activiti?
	- Apache Airflow