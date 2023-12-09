# DDD in PHP

Паттерн проектирования [DDD](../../pattern/system.design/ddd.md).

Примеры:

- [Монолит доменные события](https://habr.com/ru/companies/ispring/articles/569648/)
- [CQRS+Event Store use Prooph+Broadway](https://tsh.io/blog/cqrs-event-sourcing-php/)
- [PHP Russia 2019](https://phprussia.ru/2019/abstracts/5137)


## Framework

[PHP](../../../technology/framework/php.md)

- Event
	- https://event.thephpleague.com/3.0/usage/
	- [Event Sourcing](../../pattern/integration/event.sourcing.md)
		- [Broadway](https://broadway.github.io/broadway/)
	- Event Bus 
		- is an important element in communication between Write and Read models. Event Bus is a mechanism which enables communication between different components, which not necessarily know about each other. 		
	- Event Store (MongoDB, [Doctrine DBAL](https://www.doctrine-project.org/projects/doctrine-dbal/en/latest/reference/introduction.html#introduction) - Doctrine Database Abstraction Layer - MySQL, PgSQL..)
		- [Broadway](https://broadway.github.io/broadway/)
- [CQRS](../../pattern/performance/pattern.cqrs.md)
	- https://tsh.io/blog/cqrs-event-sourcing-php/
	- [prooph 2019](https://getprooph.org/)
	- [Broadway](https://github.com/broadway/broadway)
	- Command
		- Command Bus
			- [Tactician](https://tactician.thephpleague.com/) persist 
				- by Doctrine to DB
				- [Bernand](https://bernardphp-com.readthedocs.io/projects/bernard/drivers.html) to RMQ, Redis, MongoDB и тд
	- Read Model
		- [Broadway](https://broadway.github.io/broadway/)

	