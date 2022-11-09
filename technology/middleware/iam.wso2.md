# IAM WSO2 Identity Server

Реализация функции [Identity and Access Management (IAM)](../../arch/iam.md) решений.

[Фичи](https://wso2.com/identity-server/)
- [Custom Flow](https://is.docs.wso2.com/en/latest/references/concepts/authentication/adaptive-authentication/
- [RBAC, ABAC](https://wso2.com/identity-server/access-control/)

![arch](https://is.docs.wso2.com/en/6.0.0/assets/img/guides/iam-functionality.png)
![arch](../../img/wso2is-architecture.png)

- [Docker](https://hub.docker.com/r/wso2/wso2is) https://github.com/wso2/docker-is
- [k8s](https://medium.com/wso2-learning/how-to-deploy-wso2-platform-on-docker-and-kubernetes-1d5beeb88c72)
![k8s arch](https://miro.medium.com/max/720/1*6EwhO93uz7ZVLNK2Std8QA.png)
- Вендор РФ [Emdev](https://www.emdev.ru/wso2/wso2is)
- [SDK](https://is.docs.wso2.com/en/latest/sdks/sdk-overview/)
	- [JavaScript](https://is.docs.wso2.com/en/6.0.0/sdks/start-integrating-apps/integrate-a-js-app)
	- [SPA](https://github.com/asgardeo/asgardeo-auth-spa-sdk)
	- [PHP?]()
	- [.NET](https://github.com/asgardeo/asgardeo-dotnet-oidc-sdk)

## Плюсы-Минусы

Плюсы
- Open Source

Минусы
- Зависимость от БД - узкое место
	- Остался только Redis, который хранит сессии аутентификации и выданные в них JWT и refresh-токены. 
	- [ВТБ опыт](https://habr.com/ru/company/vtb/blog/559774/)

## Compare 

### Vs Keycloak

- [WSO2 Identity Server allows](https://htamahc.medium.com/wso2-identity-server-vs-keycloak-a-comparison-of-the-two-leading-open-source-identity-servers-a4ef11a509d9) you to configure as __many data sources__ as you wish. Also it can mix and match various data sources such as JDBC, LDAP, Active Directory or even another WSO2 Identity Server instance for persistence. So, WSO2 Identity Server allows you to configure multiple data sources and multiple user stores (domains) whereas in __Keycloak, you are limited to a single data source and a single user store__.
- WSO2 Identity Server allows you to do that in a more flexible way. With WSO2 Identity Server, you can __configure external identity providers per-application__ whereas in __Keycloak, per-application IdP binding is not supported__.
- Multi Tenant App: WSO2 Identity Server calls them “tenants” and Keycloak calls them “realms”.
- WSO2 Identity Server allows you to generate OTPs and send them over on __e-mail or SMS__, which Keycloak does not support out of the box.
- Identity Federation
	- Identity federation is about relying on another identity provider for authenticating your users. This enables things like social log in, where users can log in to applications via Facebook or Twitter or from some other platform.
- Identity Provisioning
	- In simple terms, identity provisioning means creating users on-the-fly as they are authenticated. And it comes in two variations; 
		- inbound provisioning - means you create users locally while they are authenticated externally
		- and outbound provisioning - means you create users elsewhere while they are authenticated locally.
	__Keycloak only supports the first variation; inbound user provisioning__. With WSO2 Identity Server, you __get both inbound and outbound user provisioning__ capabilities. Also, per-application user provisioning is another feature that is supported only by WSO2 Identity Server.

### Vs Gluu

- [TODO](https://www.saasworthy.com/compare/wso2-identity-server-vs-keycloak-vs-gluu)
