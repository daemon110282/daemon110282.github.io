# OpenID Connect (OIDC)

- [OpenID Connect (OIDC)](#openid-connect-oidc)
	- [Flow Grant](#flow-grant)
	- [TODO](#todo)
	- [Параметры Flow](#параметры-flow)

![OpenID Сonnect процесс](https://habrastorage.org/r/w1560/getpro/habr/post_images/c13/afc/ee5/c13afcee5226ddb135df9836d3321b17.png)

Термины:

- OpenID Connect Provider (OP) - Identity Provider
- User 
- Client - ИС
	- [machine to machine communication](https://docs.duendesoftware.com/identityserver/v6/overview/terminology/#machine-to-machine-communication) - __Client Credentials Flow__
	- [GUI с участием User](https://docs.duendesoftware.com/identityserver/v6/overview/terminology/#interactive-applications) - Authorization Code Flow
- Claims
- Scope
- OAuth2
	- Authorization Server
	- Resource Server
	- Resource Owner

## Flow Grant

Client type — тип клиента, от которого зависит способ взаимодействия с ним. Тип клиента определяется его возможностью безопасно хранить свои учётные данные для авторизации — токен. Поэтому существует [всего 2 типа клиентов](https://habr.com/ru/company/dododev/blog/520046/):

- Confidential — клиент, который может безопасно хранить свои учётные данные. Например, к такому типу клиентов относят web-приложения, имеющие backend.
- Public — не может безопасно хранить свои учётные данные. Этот клиент работает на устройстве владельца ресурса, например, это браузерные или мобильные приложения.

[Flow](https://habr.com/ru/company/nixys/blog/566910/) also called Grants:

- Confidential
	- Authentication Flow=[Authorization Code Flow](url) - using a browser and server BackEnd
	- [Client Credentials Flow](https://habr.com/ru/company/dododev/blog/520046/)
	<!-- ![scheme](https://habrastorage.org/r/w1560/getpro/habr/post_images/110/fe3/d4a/110fe3d4a29efd1af72da67ab06515ba.png) -->
- Public
	- [Authorization Code Flow with PKCE](https://auth0.com/docs/get-started/authentication-and-authorization-flow/authorization-code-flow-with-proof-key-for-code-exchange-pkce) - using a browser only		
	- [Implicit Flow](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/overview/ad-fs-openid-connect-oauth-flows-scenarios) - redirection required SPA, JS __legacy__		
	- Device authorization

## Deployment models

[Deployment models](https://developer.okta.com/docs/concepts/redirect-vs-embedded/):

- Redirect
	- Client application requires centralized session management across applications.
	- SSO is implicit (if in IAM session is created, SSO is implemented for other resources).
	![flow](https://developer.okta.com/img/auth/OktaHosted.png)
	[VueJS SPA example](https://developer.okta.com/docs/guides/sign-into-spa-redirect/vue/main/)
- Embedded [Sign-In Widget, authentication SDK, or direct API calls](https://developer.okta.com/docs/guides/sign-in-overview/main/#choose-your-auth)
	- Full control over application customization is a key requirement.
	- There is a slightly increased risk in security due to IAM not being able to guarantee that the Sign-In Widget has been implemented correctly.
	![flow](https://developer.okta.com/img/auth/CustomerHosted.png)
	[VueJS SPA Okta Auth0 Auth.js example](https://developer.okta.com/docs/guides/sign-in-to-spa-authjs/vue/main/)
	[VueJS SPA Okta Widget example](https://developer.okta.com/docs/guides/sign-in-to-spa-embedded-widget/vue/main/)
		[BackEnd Spring](https://developer.okta.com/blog/2021/10/04/spring-boot-spa)
	[SPA Azure ADFS example](https://learn.microsoft.com/en-us/azure/active-directory/develop/single-page-app-quickstart)

TODO
- https://cyberpolygon.com/ru/materials/security-of-json-web-tokens-jwt/%7Cere
- [__TODO BFF нужен SPA CSRF attacks?__](https://docs.duendesoftware.com/identityserver/v5/bff/overview/)
- [JS OIDC Client](https://github.com/IdentityModel/oidc-client-js/wiki)
- Store AccessToken JWT [in Session Cookie](https://jcbaey.com/authentication-in-spa-reactjs-and-vuejs-the-right-way/)
  
## Параметры Flow

Основные [параметры Flow](https://identityserver4.readthedocs.io/en/latest/quickstarts/1_client_credentials.html)

- Аутентификация Client через OpenID Connect Provider (IDP)
	- IdToken - IdentityToken (формат JWT обязателен) (OIDC) - for authenticating a user. A JWT token used to represent the identity of the user.
	- TokenEndpoint - получаем IdentityToken
	- ClientId
	- ClientSecret
		- Хранится на BackEnd и передается в Authentication Flow
		- в Implicit Flow не хранится в SPA, JS и не передается
	- Scope
- Авторизация OAuth2
	- Authorization Code - обменивается в Authorization Code Flow на AccessToken
	- Получение данных Resource с учетом доступа Scope
		- AccessToken (формат JWT не обязателен) - for accessing a resource. A JWT token used in Oauth and OpenID connect scenarios and intended to be consumed by the resource.
	- RefreshToken

[Песочница](https://openidconnect.net/)