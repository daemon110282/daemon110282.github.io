# OAuth

- [OAuth](#oauth)
	- [Зачем](#зачем)
	- [Параметры Flow](#параметры-flow)
		- [Access Token](#access-token)
		- [Refresh Token](#refresh-token)
	- [Security](#security)
	- [Token validate](#token-validate)
	- [Token exchange](#token-exchange)

## Зачем

- [Нужен, чтобы получать](https://habr.com/ru/company/dataart/blog/311376/) токены доступа и с ними обращаться к ресурсам.
- Authorization framework, not an authentication protocol (например [OIDC](oidc.md)).
- RBAC\ABAC и тп
- [TODO](https://connect2id.com/learn/oauth-2)
- [Flow](https://habr.com/ru/company/nixys/blog/566910/) also called __Grants__:
  - Public Client
    - [Authorization Code Flow with PKCE](oauth.flow.ACwithPKCE.md)

## Параметры Flow

Основные [параметры Flow](https://identityserver4.readthedocs.io/en/latest/quickstarts/1_client_credentials.html)

- Authorization Code - обменивается в Authorization Code Flow на AccessToken
- Scope - получение данных Resource с учетом доступа Scope
- __Access Token__ (формат [JWT](../jwt.md) не обязателен) - for accessing a resource. [A JWT token used in Oauth and OpenID connect scenarios and intended to be consumed by the resource](https://auth0.com/blog/id-token-access-token-what-is-the-difference/).
- __Refresh Token__

![процесс](https://habrastorage.org/r/w1560/getpro/habr/post_images/c13/afc/ee5/c13afcee5226ddb135df9836d3321b17.png)

[Песочница](https://openidconnect.net/)

### Access Token

[Структура Payload](https://datatracker.ietf.org/doc/html/rfc9068)

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

### Refresh Token

- SPA - public client
	- [Refresh token rotation](https://stateful.com/blog/oauth-refresh-token-best-practices) for protect a replay attack
	- иные варианты to keep a session going can be
		- cookies
		- silent authentication
			- in iframe - legacy Google block
- [Confidential Clients Should Not Rotate Refresh Tokens](https://docs.duendesoftware.com/identityserver/v6/tokens/refresh/#confidential-clients-should-not-rotate-refresh-tokens)

## Security

Время жизни:

- Access Token
  - Секретный ключ длинный и менять периодически
  - На стороне приложения ограничить алгоритм подписи
  - Сам access токен [храним не в localStorage](https://climbtheladder.com/10-spa-authentication-best-practices/) как это обычно делают, а [в памяти](https://auth0.com/docs/secure/security-guidance/data-security/token-storage) клиентского приложения.
  - Store AccessToken JWT [in Session Cookie](https://jcbaey.com/authentication-in-spa-reactjs-and-vuejs-the-right-way/)
    - When the SPA calls only an API that is served from a __domain that can share cookies__ with the domain of the SPA, __no tokens__ are needed. If you are using cookie-based authentication, they are stored in a cookie and sent to the server in every request.
    - When the SPA calls multiple APIs that reside in a __different domain__, __access, refresh tokens are needed__. If you are using token-based authentication, they are sent by the client in every request, typically in the HyperText Transfer Protocol (HTTP) header.
- Refresh Token
	- Храним исключительно в httpOnly куке, если refresh token rotation не используется.
	- If your application uses __refresh token rotation__, it [can now store](https://stateful.com/blog/oauth-refresh-token-best-practices) it in __local storage or browser memory__.
- Revoke tokens on logout
- [Варианты атак](https://habr.com/ru/company/alexhost/blog/536364/)
  - [Перехват токена - решение HTTPS, Refresh Token](https://cyberpolygon.com/ru/materials/security-of-json-web-tokens-jwt/)

## Token validate

Варианты Access token:

- identifier-based or opaque access token - /token/introspect return active status token
  - плюсы
    - быстро можно заблокировать
  - минусы
    - доп запросы, нагрузка на IAM
    - риски масштабирования при нагрузке
- self-contained (jwt format) - проверка подписи через JWKS endpoint IAM и затем параметров токена
  - плюсы
    - простота масштабирование под рост нагрузки
  - минусы
    - блокировка возможна только по истечении exp токена

![token validate](https://lh3.googleusercontent.com/pw/AL9nZEU8W4c59UO_qgfALxBDsUQUmOdeKq2qW3XSiD72WbrqQ2m2xnolziO0UgNlcqktm4XYdhJ93r4D4oqa3KPpzSBXU5O8DcB__HHZJ5Picah6BNKczaiiAGULHYMRhI9GAoFutEEhVFIDdH_Q71jxuZnfYQ=w656-h374-no)

## Token exchange

- На основе access token выдается 2й для другого сервиса например.
- ID token will not have granted scopes (I know, this is another pain point).
- JWTs contain claims, which are statements (such as name or email address) about an entity (typically, the user) and additional metadata. The OpenID Connect specification defines a set of standard claims.
- ![token exchange](https://lh3.googleusercontent.com/pw/AL9nZEWPOntqnB_XS-gCUQ42P-5NCg7Ageg9UtnKGcWYPwh2CAvrafKhHYxZq4xm7CnNCeVPJrThmWHDawnZDc6d15u-XvAfPywOdogmuMKUJ3ZX6PbHprwj0tUSFXnAYVqoQo_YpKbhr9IC38PzsjUPcTG2Pw=w754-h441-no)