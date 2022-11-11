# Identity and Access Management (IAM)

- [Identity and Access Management (IAM)](#identity-and-access-management-iam)
	- [Зачем](#зачем)
	- [Критерии выбора](#критерии-выбора)
	- [User store](#user-store)
	- [Протоколы](#протоколы)
		- [OAuth, OpenID Connect (OIDC)](#oauth-openid-connect-oidc)
	- [Технологии](#технологии)

## Зачем

Identity Provider (IAM) with industry standard supported protocols:

- SAML 2.0 XML (Security Assertion Markup Language)
- [OAuth](../technology/protocols.integration/oauth.md)
- [OpenID Connect (OIDC)](../technology/protocols.integration/oidc.md)
- Social Authentication (FB, Google и тп)

Функционал [IAM](https://digitalguardian.com/blog/what-identity-and-access-management-iam):

- [Single Sign On](sso.md)
- Аутентификация
  - Multi-Factor Authentication (MFA)
- Адаптивная аутентификация (применение более строгих форм проверки подлинности в зависимости от контекста пользователя — геолокации, устройства, с которого осуществляется вход, и т. д.)
- [Управление сессиями](https://www.securitylab.ru/analytics/530059.php)
- Role Based Access (RBAC)
- Custom Login Form
	- [Redirect or Embedded Widget or Embedded SDK](https://developer.okta.com/docs/guides/sign-in-overview/main/#choose-your-auth)
		- https://auth0.com/docs/authenticate/login
		- [ADFS](https://learn.microsoft.com/en-us/azure/active-directory/develop/scenario-spa-sign-in?tabs=javascript2)
- Session Managment

## Критерии выбора

Критерии [выбора](https://www.securitylab.ru/analytics/530059.php):

- Функционал
- Производительность
- Масштабируемость
- Отказоуйстойчивость
- Открытый исходный код
- Технологический стек

Сравнения
- [WSO2-Keycloack-Glue](../technology/middleware/iam.wso2.md)
- [Keycloack-Glue](../technology/middleware/iam.keycloak.md)
- Top [Okta-MS-Keycloak](https://www.saasworthy.com/list/identity-and-access-management-iam-software)
- Top [Okta-MS-WSO2](https://www.g2.com/categories/single-sign-on-sso)

## User store

- Внутрення БД
- User Federation
  - встроенный LDAP
  - внешний LDAP
  - Microsoft Active Directory
- Apache Cassandra
- Identity Provider
  - SAML
  - OIDC
  - Social (FB, Google..)

## Протоколы

### OAuth, OpenID Connect (OIDC)

![scheme](https://habrastorage.org/r/w1560/getpro/habr/post_images/bc9/ad8/618/bc9ad86182b31533cc26413abc67924f.png)

[OpenID Сonnect](../technology/protocols.integration/oidc.md) нужен, чтобы получить у пользователя его учетные данные и проверить их. Authentication protocol.

[OAuth 2.0](../technology/protocols.integration/oauth.md) [нужен, чтобы получать](https://habr.com/ru/company/dataart/blog/311376/) токены доступа и с ними обращаться к ресурсам. Authorization framework, not an authentication protocol.

## Технологии

Варианты [решений](https://www.securitylab.ru/analytics/530059.php):

- in house (on premise)
	- Commercial
		- [ADFS](../technology/middleware/iam.adfs.md)
		- Отечественное [UIDM](../technology/middleware/iam.uidm.md)
		- [Identity Blitz](https://identityblitz.ru/products/blitz-identity-provider/documentation/?ref=main)
	- Open Source
		- [WSO2 Identity Server](../technology/middleware/iam.wso2.md)
		- [IdentityServer4 (.NET Core)](../technology/middleware/iam.is4.md)
		- [Keycloak (Red Hat Java)](../technology/middleware/iam.keycloak.md)
- online
	- Commercial
    	- AWS Cognito
    	- GCP Identity Platform
		- Okta [Auth0](https://auth0.com/)
			- [SDK Vue.JS](https://auth0.com/docs/libraries)
		- OneLogin
