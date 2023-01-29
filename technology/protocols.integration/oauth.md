# OAuth

- [OAuth](#oauth)
	- [Зачем](#зачем)
	- [Параметры Flow](#параметры-flow)
	- [Access Token структура Payload](#access-token-структура-payload)
	- [Token exchange](#token-exchange)

## Зачем

- [Нужен, чтобы получать](https://habr.com/ru/company/dataart/blog/311376/) токены доступа и с ними обращаться к ресурсам. 
- Authorization framework, not an authentication protocol (например [OIDC](oidc.md)).
- RBAC\ABAC и тп

https://connect2id.com/learn/oauth-2

## Параметры Flow

Основные [параметры Flow](https://identityserver4.readthedocs.io/en/latest/quickstarts/1_client_credentials.html)
	
- Авторизация OAuth2
	- Authorization Code - обменивается в Authorization Code Flow на AccessToken
	- Scope
	- Получение данных Resource с учетом доступа Scope
		- AccessToken (формат [JWT](../jwt.md) не обязателен) - for accessing a resource. [A JWT token used in Oauth and OpenID connect scenarios and intended to be consumed by the resource](https://auth0.com/blog/id-token-access-token-what-is-the-difference/).
	- RefreshToken

[Песочница](https://openidconnect.net/)

## Access Token структура Payload

[Структура](https://datatracker.ietf.org/doc/html/rfc9068)

Required:

- iss: "http://authorization-server.example.com/" - кто выпустил токен
- sub: "auth0|123456" - Уникальный идентификатор пользователя в IAM
- [aud](https://developers.sber.ru/docs/ru/sberbusinessapi/authorization/auth-sbbid/tokens): "1234abcdef" - равно client_id - ИС запращивающая доступ
- exp: 1311281970 - срок действия
- iat: 1311280970 - 
- jti: dbe39bf3a3ba4238a513f51d6e1691c4 - ИД jwt tokena
- scope: openid profile reademail - роли, права доступа (RBAC, ABAC) к ресурсу

Optional:

- Key ID — ИД ключа, которым можно проверить подпись токена
- typ: Bearer

## Token exchange

- На основе access token выдается 2й для другого сервиса например.
- ID token will not have granted scopes (I know, this is another pain point).
- JWTs contain claims, which are statements (such as name or email address) about an entity (typically, the user) and additional metadata. The OpenID Connect specification defines a set of standard claims.