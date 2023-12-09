# Command

## Зачем

- [Decoupled](https://barryvanveen.nl/articles/49-what-is-a-command-bus-and-why-should-you-use-it)
	- [Separates Intent from Interpretation](https://www.sitepoint.com/command-buses-demystified-a-look-at-the-tactician-package/)
	- Framework and Client Decoupling
	- Architectural Boundary
	- Используется в паттерне [CQRS](../performance/pattern.cqrs.md)
- Testable
- Extendable
- Сущности
  - Client
  - Invoker
  - Command
  - Receiver

## Patterns

- [__Command__](https://www.sitepoint.com/command-buses-demystified-a-look-at-the-tactician-package/)
- __Command Handler__
	- the command handler should [not perform secondary tasks](https://matthiasnoback.nl/2015/01/from-commands-to-events/) - use Events
		- Single responsibility principle (SRP)
		- Open/closed principle (OCP)
- Связь __Command__ и __Comman Handler__ реализуется
  - паттерном [Command Bus](../command.bus.md)
  - [медиатор](../mediator.md)
