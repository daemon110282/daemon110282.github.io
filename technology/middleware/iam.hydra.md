# Ory Hydra

Реализация функции [Identity and Access Management (IAM)](../../arch/iam.md) решений.

Компоненты:
- Ory Hydra - OAuth2 & OpenID Connect Server
- Ory Kratos is an __API-first Identity and User Management system__
	- Self-service Login and Registration
	- Multi-Factor Authentication (MFA/2FA)
	- Account Recovery and Verification, Profile, and Account Management
- Ory Oathkeeper: __Identity & Access Proxy__
	- authentication, authorization, 
	- request mutation rules for your web services: Authenticate JWT, Access Tokens, API Keys, mTLS
- Ory Keto: __Access Control Policies__ as a Server

![arch](https://www.ory.sh/static/f8083850c9e5b19d51df6708d6fb696a/7464f/kong_hello.webp)

Фичи:
- [REST API](https://www.ory.sh/docs/hydra/reference/api)
	- [Postman](https://www.postman.com/ory-docs)
- CLI
- [SDK .NET PHP JS](https://www.ory.sh/docs/hydra/sdk/overview)
- [Docker](https://github.com/radekg/ory-reference-compose)
- MFA
	- [Email](https://github.com/epandurski/hydra_login2f)
	- [SMS](https://www.ory.sh/docs/kratos/emails-sms/sms-messages)
- SPA
	- [SPA ACF with PKCE](https://www.ory.sh/oauth2-for-mobile-app-spa-browser/)
	- [VueJS Vite](https://github.com/timalanfarrow/kratos-selfservice-ui-vue3-typescript)
	- [SPA Widget no redirect React](https://github.com/allancalix/kratos-ui)
- [OAuth Google example](https://yusufs.medium.com/practical-example-of-implementing-oauth-2-0-using-ory-hydra-fbaa2765d94f)


[TODO Examples](https://www.ory.sh/docs/ecosystem/community)
- [МТС Опыт](https://habr.com/ru/company/ru_mts/blog/645439/)
