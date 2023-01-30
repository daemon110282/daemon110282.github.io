# Identity and Access Management (IAM)

- [Identity and Access Management (IAM)](#identity-and-access-management-iam)
	- [Зачем](#зачем)
		- [User store](#user-store)
		- [Access Control](#access-control)
	- [Протоколы](#протоколы)
		- [OAuth](#oauth)
		- [OpenID Connect (OIDC)](#openid-connect-oidc)
	- [Критерии выбора](#критерии-выбора)
	- [Технологии](#технологии)

## Зачем

Identity Provider (IDP) в IAM with industry standard supported protocols:

- SAML 2.0 XML (Security Assertion Markup Language)
- [OAuth](../../technology/protocols.integration/oauth.md)
- [OpenID Connect (OIDC)](../../technology/protocols.integration/oidc.md)
- Social Authentication (FB, Google и тп)

Функционал [IAM](https://digitalguardian.com/blog/what-identity-and-access-management-iam):

- [Single Sign On](../sso.md)
- Аутентификация
  - Multi-Factor Authentication (MFA)
  - [Passwordless Authentication](https://auth0.com/blog/debunking-common-misconceptions-about-passwordless-authentication/)
- Адаптивная аутентификация (применение более строгих форм проверки подлинности в зависимости от контекста пользователя — геолокации, устройства, с которого осуществляется вход, и т. д.)
- Access Control mechanisms (ACMs)
	- Role Based Access (RBAC)
	- Attribute-based access Control (ABAC)
	- User-based access control (UBAC)
	- Context-based access control (CBAC)
	- Rule-based access control
	- Time-based access control
- Custom Login Form
	- [Redirect or Embedded Widget or Embedded SDK](https://developer.okta.com/docs/guides/sign-in-overview/main/#choose-your-auth)
		- [Auth0](https://auth0.com/docs/authenticate/login)
		- [ADFS](https://learn.microsoft.com/en-us/azure/active-directory/develop/scenario-spa-sign-in?tabs=javascript2)
- Session Managment [Управление сессиями](https://www.securitylab.ru/analytics/530059.php)
	- One Logout
	- Timeout Session (Cookie, Token)

### User store

- Внутрення БД
- User Federation
  - встроенный LDAP
  - внешний LDAP
  - Microsoft Active Directory
  - [SCIM](../../technology/protocols.integration/scim.md)
- Apache Cassandra
- Identity Brokering подключение к External IDP
  - SAML
  - [OIDC](../../technology/protocols.integration/oidc.md)
  - Social (FB, Google..)
- User Provisioning
	- Inbound - IAM получает из ИС источника пользовательские данные
	- Outbound - ИС источник предоставляет IAM пользовательские данные

### Access Control

![schema](https://wso2.cachefly.net/wso2/sites/all/2021/images/access-control-with-wso2-identity-server.svg)

## Протоколы

![scheme](https://habrastorage.org/r/w1560/getpro/habr/post_images/bc9/ad8/618/bc9ad86182b31533cc26413abc67924f.png)

### OAuth

- [OAuth 2.0](../../technology/protocols.integration/oauth.md) [нужен, чтобы получать](https://habr.com/ru/company/dataart/blog/311376/) токены доступа и с ними обращаться к ресурсам. Authorization framework, not an authentication protocol.

### OpenID Connect (OIDC)

- [OpenID Сonnect](../../technology/protocols.integration/oidc.md) нужен, чтобы получить у пользователя его учетные данные и проверить их. Authentication protocol.

## Критерии выбора

Критерии [выбора](https://www.securitylab.ru/analytics/530059.php):

- Функционал
- Производительность
- Масштабируемость
- Отказоуйстойчивость
- Открытый исходный код
- Технологический стек

Сравнения

- [WSO2-Keycloack-Glue](../../technology/middleware/iam.wso2.md)
- [Keycloack-Glue](../../technology/middleware/iam.keycloak.md)
- Top [Okta-MS-Keycloak](https://www.saasworthy.com/list/identity-and-access-management-iam-software)
- Top [Okta-MS-WSO2](https://www.g2.com/categories/single-sign-on-sso)
- [keycloak-ory hydra](https://stackshare.io/stackups/keycloak-vs-ory-hydra)
	- <https://gruchalski.com/posts/2021-04-10-ory-reference-docker-compose-and-thoughts-on-the-platform/>
- [Keycloak лучше ADFS](https://trueengineering.ru/ru/cases/migrating-from-adfs-to-keycloak)

## Технологии

Варианты [решений](https://www.securitylab.ru/analytics/530059.php):

- [OIDC certified решения](https://openid.net/developers/certified/)
- in house (on premise)
	- Commercial
		- [ADFS](../../technology/middleware/iam.adfs.md)
		- Отечественное [UIDM](../../technology/middleware/iam.uidm.md)
		- [Identity Blitz](https://identityblitz.ru/products/blitz-identity-provider/documentation/?ref=main)
	- Open Source
		- [WSO2 Identity Server](../../technology/middleware/iam.wso2.md)
		- [IdentityServer (.NET Core)](../../technology/middleware/iam.is.md) 4я версия бесплатная, с 6й версии нет?
		- [Keycloak (Red Hat Java)](../../technology/middleware/iam.keycloak.md)
		- [Ory Hydra](../technology/middleware/iam.hydra.md)
		- [Blitz Identity Provider](../../technology/middleware/iam.blitz.md)
- online
	- Commercial
      - AWS Cognito
      - GCP Identity Platform
      - Okta [Auth0](https://auth0.com/)
        - [SDK Vue.JS](https://auth0.com/docs/libraries)
      - OneLogin
