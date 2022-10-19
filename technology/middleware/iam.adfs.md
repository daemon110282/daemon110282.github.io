# IAM Active Directory Federation Services (AD FS)

Реализация функции [Identity and Access Management (IAM)](../../arch/iam.md) решений.

[Web SSO](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/design/web-sso-design)

[Версии ADFS](https://en.wikipedia.org/wiki/Active_Directory_Federation_Services)
- WS 2012 R2 ADFS 3.0 **только SAML, ограничено OAuth2, OIDC**
	- [SSO SAML](https://help.yva.ai/ru/%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B8-%D0%B0%D0%B2%D1%82%D0%BE%D1%80%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B8-%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D0%B5%D0%B9-%D1%87%D0%B5%D1%80%D0%B5%D0%B7-ADFS.1505624129.html)
	- [VueJS SSO SAML](https://www.miniorange.com/vue-js-adfs-single-sign-on(sso))
	- https://help.aternity.com/bundle/console_admin_guide_10x_server_local/page/console/topics/console_admin_sso_adfs.html
	- https://habr.com/ru/post/466859/
	- https://learn.microsoft.com/en-us/aspnet/core/security/authentication/ws-federation?view=aspnetcore-6.0
	- [не поддерживает](https://nicolgit.github.io/oauth-2-0-protocol-support-level-for-adfs-2012r2-vs-adfs-2016/) **Implicit Flow** OAuth2
	- [не поддерживает](https://learn.microsoft.com/ru-ru/archive/blogs/nicold/oauth-2-0-protocol-support-level-for-adfs-2012r2-vs-adfs-2016) **Client credential grant**
- WS 2016 **добавили Implicit Flow OAuth2**
	- [OAuth, OIDC](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/development/ad-fs-openid-connect-oauth-concepts)
	- [SPA](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/development/single-page-application-with-ad-fs)
	- Support [Flows](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/overview/ad-fs-openid-connect-oauth-flows-scenarios)
- WS 2019
	- добавили [Authorization Code Grant with PKCE](https://medium.com/the-new-control-plane/using-proof-key-for-code-exchange-pkce-in-adfs-for-windows-server-2019-a457172e28c3)