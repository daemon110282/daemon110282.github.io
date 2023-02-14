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
		- __Access Token__ (формат [JWT](../jwt.md) не обязателен) - for accessing a resource. [A JWT token used in Oauth and OpenID connect scenarios and intended to be consumed by the resource](https://auth0.com/blog/id-token-access-token-what-is-the-difference/).
	- __Refresh Token__

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

## Refresh Token

- SPA - public client
	- [Refresh token rotation](https://stateful.com/blog/oauth-refresh-token-best-practices) for protect a replay attack
	- иные варианты to keep a session going can be 
		- cookies 
		- silent authentication 
			- in iframe - legacy Google block
- [Confidential Clients Should Not Rotate Refresh Tokens](https://docs.duendesoftware.com/identityserver/v6/tokens/refresh/#confidential-clients-should-not-rotate-refresh-tokens)

## Security 

Время жизни
- Access Token
	- Секретный ключ длинный и менять периодически
	- На стороне приложения ограничить алгоритм подписи
	- Сам access токен [храним не в localStorage](https://climbtheladder.com/10-spa-authentication-best-practices/) как это обычно делают, а в памяти клиентского приложения.
- Refresh Token
	- Храним исключительно в httpOnly куке, если refresh token rotation не используется.
	- If your application uses __refresh token rotation__, it [can now store](https://stateful.com/blog/oauth-refresh-token-best-practices) it in __local storage or browser memory__.
- Revoke tokens on logout
- [Варианты атак](https://habr.com/ru/company/alexhost/blog/536364/)

## Token exchange

- На основе access token выдается 2й для другого сервиса например.
- ID token will not have granted scopes (I know, this is another pain point).
- JWTs contain claims, which are statements (such as name or email address) about an entity (typically, the user) and additional metadata. The OpenID Connect specification defines a set of standard claims.