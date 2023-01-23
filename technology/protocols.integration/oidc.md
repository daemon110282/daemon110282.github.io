# OpenID Connect (OIDC)

- [OpenID Connect (OIDC)](#openid-connect-oidc)
	- [Технологии](#технологии)
	- [Flow Grant](#flow-grant)	
		- [Параметры Flow](#параметры-flow)
	- [Deployment models](#deployment-models)
	

![OpenID Сonnect процесс](https://habrastorage.org/r/w1560/getpro/habr/post_images/c13/afc/ee5/c13afcee5226ddb135df9836d3321b17.png)

Термины:

- OpenID Connect Provider (OP) - Identity Provider
- User 
- Client - ИС
	- Confidential  
	- Public  
- Claims - 
- Scope - права Client
- OAuth2
	- Authorization Server
	- Resource Server
	- Resource Owner

## Технологии

- [OIDC certified решения](https://openid.net/developers/certified/)
- [PHP OIDC Server](https://github.com/bshaffer/oauth2-server-php)

## Flow Grant

Client type — тип клиента, от которого зависит способ взаимодействия с ним. Тип клиента определяется его возможностью безопасно хранить свои учётные данные для авторизации — токен. Поэтому существует [всего 2 типа клиентов](https://habr.com/ru/company/dododev/blog/520046/):

- Confidential — клиент, который может безопасно хранить свои учётные данные. Например, к такому типу клиентов относят web-приложения, имеющие backend.
- Public — не может безопасно хранить свои учётные данные. Этот клиент работает на устройстве владельца ресурса, например, это браузерные или мобильные приложения.

[Flow](https://habr.com/ru/company/nixys/blog/566910/) also called __Grants__:

- Confidential - [machine to machine communication](https://docs.duendesoftware.com/identityserver/v6/overview/terminology/#machine-to-machine-communication)
	- Authentication Flow=[Authorization Code Flow](url) - using a browser and server BackEnd
	- [Client Credentials Flow](https://habr.com/ru/company/dododev/blog/520046/)
	<!-- ![scheme](https://habrastorage.org/r/w1560/getpro/habr/post_images/110/fe3/d4a/110fe3d4a29efd1af72da67ab06515ba.png) -->
- Public - [GUI с участием User](https://docs.duendesoftware.com/identityserver/v6/overview/terminology/#interactive-applications)
	- [Authorization Code Flow with PKCE](https://auth0.com/docs/get-started/authentication-and-authorization-flow/authorization-code-flow-with-proof-key-for-code-exchange-pkce) - using a browser only		
	- [Implicit Flow](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/overview/ad-fs-openid-connect-oauth-flows-scenarios) - redirection required SPA, JS __legacy__		
	- Device authorization

### Параметры Flow

Основные [параметры Flow](https://identityserver4.readthedocs.io/en/latest/quickstarts/1_client_credentials.html)

- Аутентификация Client через OpenID Connect Provider (IDP)
	- IdToken - IdentityToken (формат [JWT](../jwt.md) обязателен) (OIDC) - for authenticating a user. A JWT token used to represent the identity of the user.
	- TokenEndpoint - получаем IdentityToken
	- ClientId
	- ClientSecret
		- Хранится на BackEnd и передается в Authentication Flow
		- в Implicit Flow не хранится в SPA, JS и не передается
	
![tokens id, acccess](https://images.ctfassets.net/23aumh6u8s0i/2y2MCTq87UqQ1uzCJsl4M/c6f127f738f0d13017ff47544958d880/id-token-vs-access-token.jpg)

[Песочница](https://openidconnect.net/)

### Identity Token структура Payload

- [iss](https://openid.net/specs/openid-connect-core-1_0.html#IDToken): "http://my-domain.auth0.com" - кто выпустил токен
- sub: "auth0|123456" - Уникальный идентификатор пользователя
- aud: "1234abcdef" - равно client_id - ИС запращивающая доступ
- exp: 1311281970 - срок действия (UNIX format)
- iat: 1311280970 - дата время выдачи токена (UNIX format)
- scope: openid - These are the scopes that bind to user attributes(claims). You can use OIDC scopes to limit access user’s attributes.
- Custom User Claims optional

## Deployment models

[Deployment models](https://developer.okta.com/docs/concepts/redirect-vs-embedded/):

- Redirect
	- Client application requires centralized session management across applications.
	- SSO is implicit (if in IAM session is created, SSO is implemented for other resources).
	![flow](https://developer.okta.com/img/auth/OktaHosted.png)
	- [VueJS SPA example](https://developer.okta.com/docs/guides/sign-into-spa-redirect/vue/main/)
		- [VueJS](https://www.youtube.com/watch?app=desktop&v=sE02clzN_ok&ab_channel=hi5code)
	- [PHP keycloak JS](https://github.com/des1roer/sso-keycloak-php)
- Embedded [Sign-In Widget, authentication SDK, or direct API calls](https://developer.okta.com/docs/guides/sign-in-overview/main/#choose-your-auth)
	- Full control over application customization is a key requirement.
	- There is a slightly increased risk in security due to IAM not being able to guarantee that the Sign-In Widget has been implemented correctly.
	![flow](https://developer.okta.com/img/auth/CustomerHosted.png)
	[VueJS SPA Okta Auth0 Auth.js example](https://developer.okta.com/docs/guides/sign-in-to-spa-authjs/vue/main/)
	[VueJS SPA Okta Widget example](https://developer.okta.com/docs/guides/sign-in-to-spa-embedded-widget/vue/main/)
		[BackEnd Spring](https://developer.okta.com/blog/2021/10/04/spring-boot-spa)
	[SPA Azure ADFS example](https://learn.microsoft.com/en-us/azure/active-directory/develop/single-page-app-quickstart)


## TODO

- https://cyberpolygon.com/ru/materials/security-of-json-web-tokens-jwt/%7Cere
- [__TODO BFF нужен SPA CSRF attacks?__](https://docs.duendesoftware.com/identityserver/v5/bff/overview/)
- [JS OIDC Client](https://github.com/IdentityModel/oidc-client-js/wiki)
- Store AccessToken JWT [in Session Cookie](https://jcbaey.com/authentication-in-spa-reactjs-and-vuejs-the-right-way/)
- When the SPA calls only an API that is served from a domain that can share cookies with the domain of the SPA, no tokens are needed. 
- When the SPA calls multiple APIs that reside in a different domain, access, and optionally, refresh tokens are needed.
- If you are using cookie-based authentication, they are stored in a cookie and sent to the server in every request. 
- If you are using token-based authentication, they are sent by the client in every request, typically in the HyperText Transfer Protocol (HTTP) header.
- CORS provides a way for JavaScript to make requests to servers on a different domain as long as the destination allows it. This opens up the possibility of using the Authorization Code flow in JavaScript on browser-side with the PKCE extension instead.
