# IAM Active Directory Federation Services (AD FS)

Реализация функции [Identity and Access Management (IAM)](../../arch/system.class/iam.md) решений.

[Web SSO](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/design/web-sso-design)

## Version

[Версии ADFS](https://en.wikipedia.org/wiki/Active_Directory_Federation_Services)
- WS 2012 R2 ADFS 3.0 **только SAML, ограничено OAuth2, OIDC**
	- SSO
		- [SSO SAML](https://help.yva.ai/ru/%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8-%D0%B0%D0%B2%D1%82%D0%BE%D1%80%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B8-%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D0%B5%D0%B9-%D1%87%D0%B5%D1%80%D0%B5%D0%B7-ADFS.1505624129.html)
			- [VueJS SSO SAML](https://www.miniorange.com/vue-js-adfs-single-sign-on(sso))
			- [SAML](https://habr.com/ru/post/466859/)		
		- [WS-Federation](https://learn.microsoft.com/en-us/aspnet/core/security/authentication/ws-federation?view=aspnetcore-6.0)
		- [ADFS as Identity Provider](https://help.aternity.com/bundle/console_admin_guide_10x_server_local/page/console/topics/console_admin_sso_adfs.html)
		- OIDC OAuth2
			- [не поддерживает](https://nicolgit.github.io/oauth-2-0-protocol-support-level-for-adfs-2012r2-vs-adfs-2016/) **Implicit Flow** OAuth2
			- [не поддерживает](https://learn.microsoft.com/ru-ru/archive/blogs/nicold/oauth-2-0-protocol-support-level-for-adfs-2012r2-vs-adfs-2016) **Client credential Flow (Grant)**
- WS 2016 **добавили Implicit Flow OAuth2**
	- SSO
		- [OAuth, OIDC](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/development/ad-fs-openid-connect-oauth-concepts)
		- [SSO OAuth SPA AngularJS ADAL.JS](https://learn.microsoft.com/ru-ru/windows-server/identity/ad-fs/development/single-page-application-with-ad-fs)
		- Support [Flows](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/overview/ad-fs-openid-connect-oauth-flows-scenarios)
			- [Client Credential Flow](https://medium.com/the-new-control-plane/implementing-a-client-credential-flow-in-adfs-4-0-a8ff23dc4b32)
- WS 2019
	- SSO
		- добавили [Authorization Code Grant with PKCE MSAL.JS 2.x](https://medium.com/the-new-control-plane/using-proof-key-for-code-exchange-pkce-in-adfs-for-windows-server-2019-a457172e28c3)		
		- [SPA Azure ADFS example MSAL.JS 2.x](https://learn.microsoft.com/en-us/azure/active-directory/develop/single-page-app-quickstart)
		- Custom UI Forms
			- [Windows PowerShell cmdlets](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/operations/advanced-customization-of-ad-fs-sign-in-pages)
			- [Redirect or Embedded](https://learn.microsoft.com/en-us/azure/active-directory/develop/scenario-spa-sign-in?tabs=javascript2)
		- [One Logout OIDC](https://learn.microsoft.com/ru-ru/windows-server/identity/ad-fs/development/ad-fs-logout-openid-connect)
		- [Test in Swagger](https://medium.com/the-new-control-plane/using-swagger-as-a-client-for-an-adfs-protected-api-49f9b4d773c)
		- [Validate Access Token JWT](https://medium.com/the-new-control-plane/validating-an-adfs-jwt-a47099b014b9)
		- [MFA](https://learn.microsoft.com/ru-ru/windows-server/identity/ad-fs/operations/configure-additional-authentication-methods-for-ad-fs)
			- [Custom Logic](https://learn.microsoft.com/ru-ru/windows-server/identity/ad-fs/development/ad-fs-build-custom-auth-method)
			- [Внешний провайдер - multifactor.ru](https://multifactor.ru/docs/adfs-2fa/)
	- [Audit](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/troubleshooting/ad-fs-tshoot-logging)