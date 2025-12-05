# Авторизация по QR-коду

- [Авторизация по QR-коду](#авторизация-по-qr-коду)
	- [Зачем](#зачем)
	- [Паттерны](#паттерны)
	- [Технологии](#технологии)
		- [KeyCloak](#keycloak)

## Зачем

Относится к [Беспарольным методам](security.2fa.md) авторизации.
Для создания новой сессии после подтерждения в МП входа в ЛК по QR коду.

## Паттерны

TODO

## Технологии

### KeyCloak

Варианты:

- [Token exchange V1](../../../technology/protocols.integration/oauth/oauth.exchange.token.md#impersonation) Impersonate
	- Но client должен быть confidential, те для бэк2бэк вариант (пользовать не указывает сам пароль)
- KeyCloak Custom SPI
- Адаптация OAuth Device Flow (не заработал вариант, нужно разбираться как эмулировать отправку кода)
