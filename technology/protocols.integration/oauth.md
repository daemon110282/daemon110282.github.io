# OAuth

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

- iss: "http://my-domain.auth0.com" - кто выпустил токен
- sub: "auth0|123456" - Уникальный идентификатор пользователя
- [aud](https://developers.sber.ru/docs/ru/sberbusinessapi/authorization/auth-sbbid/tokens): "1234abcdef" - равно client_id - ИС запращивающая доступ
- exp: 1311281970 - срок действия
- iat: 1311280970 - 
- scope - роли, права доступа (RBAC, ABAC) к ресурсу
- client_id - 
- Key ID — айдишник ключа, которым можно проверить подпись токена
