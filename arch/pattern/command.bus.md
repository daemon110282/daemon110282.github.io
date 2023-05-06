# Command Bus

Используется совместно с паттерном [Command](command.md)

- используется для выполнения команд (Command), таких как создание объекта, отправка электронной почты и т.д. В этом случае, компоненты системы выступают в роли отправителей команд, а другие компоненты - в роли получателей и исполнителей этих команд. Command Bus также может отслеживать состояние выполнения команды и сообщать об ошибке, если такая произошла.
- The Command bus __matches commands to handlers__. This matching can be done automatically by some kind of naming convention. Another option is to register the relationships on the command bus.
- Ensure the transport of a Command to its Handler. The Command Bus receives a Command, which is nothing more than a message describing intent, and passes this onto a Handler which is then responsible for performing the expected behavior.
- The standard interface also makes it possible for additional functionality to be added by wrapping with __decorators__, or by adding __middleware__.

![middleware](https://uploads.sitepoint.com/wp-content/uploads/2016/01/1453218734middleware-pipeline.png)

- TODO:
	- protecting the original order of commands??? pattern Chain Of Responsibility?

Differences Event Bus:

- [While commands have exactly one corresponding command handler](https://matthiasnoback.nl/2015/01/some-questions-about-the-command-bus/), there is a one-to-many correspondence between an event and its handlers. There may even be zero handlers for a particular event.
- Events are not (supposed to be) handled in a separate database transaction, like commands are.
- Event Bus используется для передачи событий (event) между компонентами системы. В этом случае, компоненты генерируют события, а другие компоненты слушают эти события и реагируют на них соответствующим образом.
- основное отличие между Event Bus и Command Bus заключается в типе сообщений, которые они передают
