# Identity and Access Management (IAM)

Identity Provider (IAM) with industry standard supported protocols:

- SAML 2.0 XML
- [OAuth](../technology/protocols.integration/oauth.md)
- [OpenID Connect (OIDC)](../technology/protocols.integration/oidc.md)
- Social Authentication (FB, Google и тп)

Функционал [IAM](https://digitalguardian.com/blog/what-identity-and-access-management-iam):

- Аутентификация, в том числе многофакторная
- Адаптивная аутентификация (применение более строгих форм проверки подлинности в зависимости от контекста пользователя — геолокации, устройства, с которого осуществляется вход, и т. д.)
- [Управление сессиями](https://www.securitylab.ru/analytics/530059.php)
- RBAC
- Multi-Factor Authentication

Критерии [выбора](https://www.securitylab.ru/analytics/530059.php):

- Функционал
- Производительность
- Масштабируемость
- Отказоуйстойчивость
- Открытый исходный код

User store:
- встроенный LDAP
- внешний LDAP
- Microsoft Active Directory
- Apache Cassandra 

## Протоколы

### OAuth, OpenID Connect (OIDC)

![scheme](https://habrastorage.org/r/w1560/getpro/habr/post_images/bc9/ad8/618/bc9ad86182b31533cc26413abc67924f.png)

[OpenID Сonnect](../technology/protocols.integration/oidc.md) нужен, чтобы получить у пользователя его учетные данные и проверить их. 

[OAuth 2.0](../technology/protocols.integration/oidc.md) [нужен, чтобы получать](https://habr.com/ru/company/dataart/blog/311376/) токены доступа и с ними обращаться к ресурсам.

## Технологии

Варианты [решений](https://www.securitylab.ru/analytics/530059.php):

- in house
	- Commercial
		- ADFS
	- Open Source
		- [WSO2 Identity Server](../technology/middleware/iam.wso2.md)
		- [IdentityServer4 (.NET Core)](../technology/middleware/iam.is4.md)
		- [KEYCLOAK (Red Hat Java)](../technology/middleware/iam.keycloak.md)	
- online
	- Commercial
		- [auth0](https://auth0.com/)
			- [SDK Vue.JS](https://auth0.com/docs/libraries)


## TODO

https://jcbaey.com/oauth2-oidc-best-practices-in-spa/

MS AD: Adds adfs
https://habr.com/ru/company/nixys/blog/563244/
https://help.aternity.com/bundle/console_admin_guide_10x_server_local/page/console/topics/console_admin_sso_adfs.html

https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/development/single-page-application-with-ad-fs
https://docs.microsoft.com/en-us/azure/active-directory/develop/scenario-spa-overview

https://learn.microsoft.com/en-us/aspnet/core/security/authentication/ws-federation?view=aspnetcore-6.0

https://www.miniorange.com/vue-js-adfs-single-sign-on(sso)


Net abp.io
https://academy.hiretechteam.com/blog/how-to-implement-single-sign-with-abp-commercial-application
https://docs.abp.io/en/abp/latest/Modules/IdentityServer

https://docs.abp.io/en/abp/latest/Modules/OpenIddict

https://documentation.openiddict.com

https://www.google.com/url?sa=t&source=web&rct=j&url=https://www.youtube.com/watch%3Fv%3Dth3IugJGQDA&ved=2ahUKEwiv1Z3VtuH6AhURCBAIHbxoC1I4ChC3AnoECBwQAg&usg=AOvVaw3LGyJwYvrPLvmjBpHgP-Jw
