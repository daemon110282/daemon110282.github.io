# OpenID Connect (OIDC)

![OpenID Сonnect процесс](https://habrastorage.org/r/w1560/getpro/habr/post_images/c13/afc/ee5/c13afcee5226ddb135df9836d3321b17.png)

Термины:
- OpenID Connect Provider (OP)
- Client
	- [machine to machine communication](https://docs.duendesoftware.com/identityserver/v6/overview/terminology/#machine-to-machine-communication) - __Client Credentials Flow=Authentication Flow?__
	- [GUI с участием User](https://docs.duendesoftware.com/identityserver/v6/overview/terminology/#interactive-applications)  - Authorization Code Flow
- User
- Scope
- Resource

## Flow Grant

Client type — тип клиента, от которого зависит способ взаимодействия с ним. Тип клиента определяется его возможностью безопасно хранить свои учётные данные для авторизации — токен. Поэтому существует [всего 2 типа клиентов](https://habr.com/ru/company/dododev/blog/520046/):
- Confidential — клиент, который может безопасно хранить свои учётные данные. Например, к такому типу клиентов относят web-приложения, имеющие backend.
- Public — не может безопасно хранить свои учётные данные. Этот клиент работает на устройстве владельца ресурса, например, это браузерные или мобильные приложения.

[Flow](https://habr.com/ru/company/nixys/blog/566910/) also called Grants:

- Confidential
	- Authentication Flow=[Authorization Code Flow](url) - using a browser and server BackEnd
	- [Authorization Code Flow with PKCE](https://auth0.com/docs/get-started/authentication-and-authorization-flow/authorization-code-flow-with-proof-key-for-code-exchange-pkce) - using a browser only
		- https://auth0.com/docs/get-started/authentication-and-authorization-flow/authorization-code-flow-with-proof-key-for-code-exchange-pkce
	- [Client credentials](https://habr.com/ru/company/dododev/blog/520046/)
	![scheme](https://habrastorage.org/r/w1560/getpro/habr/post_images/110/fe3/d4a/110fe3d4a29efd1af72da67ab06515ba.png)
- Public
	- [Implicit Flow](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/overview/ad-fs-openid-connect-oauth-flows-scenarios) - redirection required SPA, JS **legacy**
		- [IS4 example](https://identityserver4.readthedocs.io/en/latest/quickstarts/4_javascript_client.html)
		- [CORS между доменами](https://identityserver4.readthedocs.io/en/latest/quickstarts/4_javascript_client.html#allowing-ajax-calls-to-the-web-api-with-cors)
		- **[TODO BFF нужен SPA CSRF attacks?](https://docs.duendesoftware.com/identityserver/v5/bff/overview/)** 
		- [JS OIDC Client](https://github.com/IdentityModel/oidc-client-js/wiki)
		- Store AccessToken JWT [in Session Cookie](https://jcbaey.com/authentication-in-spa-reactjs-and-vuejs-the-right-way/)
		- TODO устарело? https://jcbaey.com/oauth2-oidc-best-practices-in-spa/
	- Device authorization

TODO
https://cyberpolygon.com/ru/materials/security-of-json-web-tokens-jwt/%7Cere

## Параметры

Основные [параметры Flow](https://identityserver4.readthedocs.io/en/latest/quickstarts/1_client_credentials.html)
- Идентификация Client через OpenID Connect Provider
	- IdToken - IdentityToken (used for Implicit, Hybrid Flow) - for authenticating a user. A JWT token used to represent the identity of the user. 
	- TokenEndpoint - получаем IdentityToken
	- ClientId 
	- ClientSecret 
		- Хранится на BackEnd и передается в Authentication Flow
		- в Implicit Flow не хранится в SPA, JS и не передается
	- Scope 
- Authorization Code (Token?) 
- Получение данных Resource с учетом доступа Scope
	- AccessToken JWT (used for Implicit Flow) - for accessing a resource. A JWT token used in Oauth and OpenID connect scenarios and intended to be consumed by the resource.
- RefreshToken

[Песочница](https://openidconnect.net/)