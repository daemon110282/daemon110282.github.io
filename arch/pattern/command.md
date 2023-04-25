# Command

## Зачем

- [Decoupled](https://barryvanveen.nl/articles/49-what-is-a-command-bus-and-why-should-you-use-it)
	- [Separates Intent from Interpretation](https://www.sitepoint.com/command-buses-demystified-a-look-at-the-tactician-package/)
	- Framework and Client Decoupling
	- Architectural Boundary
- Testable
- Extendable

## Patterns

- [__Command__](https://www.sitepoint.com/command-buses-demystified-a-look-at-the-tactician-package/)
- __Command Handler__
	- the command handler should [not perform secondary tasks](https://matthiasnoback.nl/2015/01/from-commands-to-events/) - use Events
		- Single responsibility principle (SRP)
		- Open/closed principle (OCP) 
- __Command Bus__
	- The Command bus matches commands to handlers. This matching can be done automatically by some kind of naming convention. Another option is to register the relationships on the command bus.
	- ensure the transport of a Command to its Handler. The Command Bus receives a Command, which is nothing more than a message describing intent, and passes this onto a Handler which is then responsible for performing the expected behavior.
	- The standard interface also makes it possible for additional functionality to be added by wrapping with ))__decorators__, or by adding __middleware__.
	![middleware](https://uploads.sitepoint.com/wp-content/uploads/2016/01/1453218734middleware-pipeline.png)
- TODO:
	- protecting the original order of commands??? pattern Chain Of Responsibility?

Differences Event Bus:

-  [While commands have exactly one corresponding command handler](https://matthiasnoback.nl/2015/01/some-questions-about-the-command-bus/), there is a one-to-many correspondence between an event and its handlers. There may even be zero handlers for a particular event.
- Events are not (supposed to be) handled in a separate database transaction, like commands are.



