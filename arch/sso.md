# Single sign-on SSO

## Зачем

Возможность [Identity and Access Management (IAM)](system.class/iam.md) решений.

1. [Идентификация](https://habr.com/ru/company/nixys/blog/563244/) - логин пароль
2. Аутентификация - разрешен доступ checklogin
	- [OIDC](../technology/protocols.integration/oidc.md)
3. Авторизация - роли, доступ checkaccess
	- [OAuth 2.0](../technology/protocols.integration/oauth.md)

Типы [SSO](https://habr.com/ru/company/nixys/blog/563244/)
![scheme](https://habrastorage.org/r/w1560/webt/yg/wc/c0/ygwcc0udngt3kwnzjzlp6h4q_is.png)

Виды [SSO](https://www.securitylab.ru/analytics/530059.php):

- Корпоративный (Enterprise) Single Sign-on - данная технология подразумевает установку агента на рабочие станции пользователей.
- Web Single Sign-on - протоколы SAML, OAuth, OpenID Connect

[Варианты решений](https://www.g2.com/categories/single-sign-on-sso)

## Плюсы-минусы

Плюсы:

- **[Boost Productivity](https://www.drupal.org/docs/contributed-modules/saml-sp-single-sign-on-sso-saml-service-provider/drupal-sso)**: SSO allows employees to quickly access their corporate approved apps in one click. Eliminate the inconvenience of managing, remembering, and resetting multiple passwords which benefits in an increase in loyalty and higher conversion rates
- **Flexible IdP**: Enable Single Sign-On (SSO) for users without having to move users from their existing user store. We support a variety of user stores like Identity Provider, OAuth Provider, Active Directory (AD), Database etc
- **Security & Compliance**: Considering Compliance factor, organizations need to prove that adequate security measures are in place to protect sensitive Data. Here Single Sign-On helps with regulatory compliance to meet requirements around data access and antivirus protection
Reduced IT Costs: SSO helps lower IT costs by saving admin time on password resets thus reducing the number of help tickets. We also allow users to reset their passwords themselves, entirely eliminating the necessity for IT involvement so that they can specialize in more important tasks.
- **Improves security capabilities**: SSO security ensures that only authorized users get access to sensitive data. You can Implement password policies like required length, complexity, restrictions on password reuse, also as session timeout and password reset self-service policy to reinforce protection without hampering your users.

Минусы:

