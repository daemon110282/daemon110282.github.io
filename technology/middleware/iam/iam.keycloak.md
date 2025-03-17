# IAM KeyCloak

- [IAM KeyCloak](#iam-keycloak)
	- [Зачем](#зачем)
	- [Функции](#функции)
		- [Термины](#термины)
		- [Обновление Access Token используя Refresh Token](#обновление-access-token-используя-refresh-token)
		- [User Storage](#user-storage)
		- [Access Control](#access-control)
	- [Технологии](#технологии)
	- [Deployment](#deployment)
	- [Observability](#observability)
		- [Metric](#metric)
		- [Version](#version)
	- [Compare](#compare)
		- [VS Glue](#vs-glue)

## Зачем

Реализация функции [Identity and Access Management (IAM)](../../../arch/system.class/iam.md) решений.

## Функции

- [Custom UI forms](https://www.keycloak.org/docs/latest/server_admin/#features) Apache Freemaker + React?
	- [Themes](https://www.opcito.com/blogs/customizing-login-and-signup-pages-in-keycloak)
	- [keycloakify React отзывы не очень](https://t.me/keycloak_ru/25264)
- [ReCaptcha v3 Google](https://habr.com/ru/company/X5Tech/blog/486778/)
	- [SPI](https://github.com/dasniko/keycloak-extensions-demo/tree/main/captcha)
	- [Custom login form by Phone+Captcha+SMS OTP](https://github.com/FX-HAO/keycloak-phone-authenticator)
      - [Custom AuthenticationFactory by Phone](https://developers.redhat.com/blog/2020/10/23/use-mobile-numbers-for-user-authentication-in-keycloak#)
- Flow-Grants
  - [ACF](../../protocols.integration/oauth/oauth.flow.ACwithPKCE.md) with [PKCE](https://www.keycloak.org/docs/latest/server_admin/#con-oidc-auth-flows_server_administration_guide)
  - Implicit Flow
- [Tokens](https://www.janua.fr/understanding-token-usage-in-keycloak/)
  - Custom Fields Token
  - Refresh token rotation
  - [Revoke Refresh Token](https://www.keycloak.org/docs/latest/server_admin/#_timeouts)
  - [Token Expiration](https://blog.elest.io/keycloak-token-management-expiration-revocation-and-renewal/)
  - Шифрование [JSON Web Encryption](https://www.rfc-editor.org/rfc/rfc7516) (JWE) RSA
    - only support [ID Token](https://www.keycloak.org/docs/latest/server_admin/index.html#con-advanced-settings_server_administration_guide)
    - [JSON Web Key (JWK)](../../protocols.integration/jwk.md) – это структура данных в формате JSON, представляющая криптографический ключ.
    - [JWT RSA algorithm](https://connect2id.com/products/nimbus-jose-jwt/examples/jwt-with-rsa-encryption)
      - RSA_OAEP_256 - RSAES using Optimal Asymmetric Encryption Padding (OAEP) (RFC 3447), with the SHA-256 hash function and the MGF1 with SHA-256 mask generation function.
      - RSA_OAEP - __DEPRECATED__ - RSAES using Optimal Asymmetric Encryption Padding (OAEP) (RFC 3447), with __the default parameters specified by RFC 3447 in section A.2.1__. Use of this encryption algorithm is no longer recommended, use RSA_OAEP_256 instead.
- Template Email
- [REST API](https://www.keycloak.org/docs-api/19.0.3/rest-api/index.html)
	- Управление пользователями
	- [REST API Postman Collection](https://documenter.getpostman.com/view/7294517/SzmfZHnd)
- Custom [Extension](https://www.keycloak.org/extensions.html) Plugin
	- [demo](https://github.com/dasniko/keycloak-extensions-demo)
	- [Custom User provider](https://www.baeldung.com/java-keycloak-custom-user-providers)
	- [Init SSO browser session cookie by API REST](https://github.com/contabo/keycloak-spi-browser-session-api)
	- [Extenstion](https://www.youtube.com/watch?v=Aj0GAg4EkUA&t=4493s&ab_channel=%D0%A1%D0%BB%D1%91%D1%80%D0%BC)
- 2FA
	- HMAC based OTP (HOTP)
	- Time based OTP (TOTP) ![schema](https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fb885be28-b049-48fc-ad76-7416314dd4c3_3096x3603.jpeg)
	- [ЕСИА](https://platform.digital.gov.ru/docs/security/platform-v-iam/esia-setup)
	- 2FA SMS
      - [MFA OTP SMS](https://github.com/dasniko/keycloak-2fa-sms-authenticator)
- User [Store\Provider](https://www.keycloak.org/docs/latest/server_development/#_user-storage-spi)		
	- User Federation (Sync) - __password not import, keycloak delegate__
		- AD, LDAP, Kerberos  
		- [DB sync](https://www.tune-it.ru/web/adpashnin/blog/-/blogs/3723343), [PSQL with password](https://github.com/opensingular/singular-keycloak-database-federation)
		- [API](https://tech.smartling.com/migrate-to-keycloak-with-zero-downtime-8dcab9e7cb2c)
			- REST SPI user-storage [Custom User provider](https://www.baeldung.com/java-keycloak-custom-user-providers)
		- REST API System for Cross-domain Identity Management ([SCIM](../../protocols.integration/scim.md))
			- SCIM Client - IDP Keycloak
				- [SCIM 1.0 Provisioning SPI](https://github.com/Captain-P-Goldfish/scim-for-keycloak)
				- [SCIM 2.0](https://lab.libreho.st/libre.sh/scim/keycloak-scim) GNU Affero General Public License v3.0
	- [On demand migration](https://github.com/Smartling/keycloak-user-migration-provider)
	- [External Identity broker OIDC](https://medium.com/keycloak/keycloak-as-an-identity-broker-an-identity-provider-af1b150ea94)
- Message Queue Intgegration
	- Keycloak SPI plugin that [publishes events to a RabbitMq server](https://github.com/aznamier/keycloak-event-listener-rabbitmq)
	- Keycloak SPI plugin [Kafka](https://github.com/SnuK87/keycloak-kafka)
- Keycloak v19 sending logs using __GELF__ to centralized logging solutions like __ELK, EFK or Graylog out of the box__.
- Session State
	- обмен cookie через [iframe механизм](https://github.com/keycloak/keycloak-documentation/blob/main/securing_apps/topics/oidc/javascript-adapter.adoc#session-status-iframe) не все [браузеры будут поддерживать в дальнейшем](https://www.keycloak.org/docs/latest/securing_apps/#_modern_browsers)
- [JavaScript Adapter for Client App](https://www.keycloak.org/docs/latest/securing_apps/#_javascript_adapter)

### Термины

- Realm - [необходимо ограничение по кол-ву, риски по НТ](https://highload.today/blogs/keycloak-i-oauth-2/)
	- Users входят в Realm
	- Clients входят в Realm
	- [MTA](../../../arch/pattern/system.design/mta/mta.md) подход можно реализовать
- Groups
- Roles
- [Cross-Origin Resource Sharing (CORS)](../../protocols.integration/cors.md)
  - CORS allow using the Authorization Code flow in JavaScript on browser-side with the PKCE extension instead.

[Обучение СЛЁРМ](https://slurm.io/keycloak)

### Обновление Access Token используя Refresh Token

Параметры KeyCloak

- Максимальное время жизни __Access токена__, сек "accessTokenLifespan" - 10800с=3ч (5мин) | 60
- Максимальное время жизни access токена для Implicit Flow, сек "accessTokenLifespanForImplicitFlow" -  10800 | 60
- Если пользователь неактивен дольше указанного времени, то сессия истекает., сек Касается __Refresh токенов__, и браузеров. "ssoSessionIdleTimeout" - 2592000с=30д | 120
  - __Можно продлить сессию__ через Refresh Token
- Максимальное время жизни сессии, после чего сессия истекает. Касается Refresh токенов, и браузеров, сек. "ssoSessionMaxLifespan": 15552000=180д | 180
  - __Нельзя продлить сессию__ используя Refresh Token
- То же самое, что SSO Session Idle, но для __Refresh токена__. Если на задано, то используется "ssoSessionIdleTimeout" "clientSessionIdleTimeout" - 0
- То же самое, что SSO Session Max, но для __Refresh токена__. Если на задано, то используется "ssoSessionMaxLifespan" "clientSessionMaxLifespan" - 0
- То же самое, что SSO Session Idle, но при нажатом "Запомнить меня" "ssoSessionIdleTimeoutRememberMe" - 0
- То же самое, что SSO Session Max, но при нажатом "Запомнить меня" "ssoSessionMaxLifespanRememberMe" - 0

### User Storage

User Federation

- REST SPI [Custom User provider](https://www.baeldung.com/java-keycloak-custom-user-providers) реализация интерфейсов org.keycloak.storage.UserStorageProviderFactory - Allows Keycloak to access custom user stores.
  - [Интерфейсы пользовательских провайдеров](https://www.keycloak.org/docs/11.0/server_development/index.html#provider-capability-interfaces)

### Access Control

![schema](https://www.keycloak.org/docs/latest/authorization_services/images/authz-arch-overview.png)

- Policy Administration Point (PAP)
- Policy Decision Point (PDP)
- Policy Enforcement Point (PEP)
- Policy Information Point (PIP)

Термины:

- resource - метод API, например
- scopes - usually indicates what can be done with a given resource. Example of scopes are view, edit, delete, and so on.
![scope](https://www.keycloak.org/docs/latest/authorization_services/images/rs-r-scopes.png)
- permission - X CAN DO Y ON RESOURCE Z
	- protect resource or scope
- policy
![policy](https://www.keycloak.org/docs/latest/authorization_services/images/policy-mgmt-process.png)
	- Policy provider custom

Проверка через [Policy Evaluation Tool](https://www.keycloak.org/docs/latest/authorization_services/#_policy_evaluation_overview)

Управление resource, scopes, permission, policy:

- [В ручную в Keycloak](https://www.keycloak.org/docs/latest/authorization_services/)
- API [protection-api](https://www.keycloak.org/docs/latest/authorization_services/#protection-api)
	- [resource](https://www.keycloak.org/docs/latest/authorization_services/#_service_protection_resources_api)
	- [permission](https://www.keycloak.org/docs/latest/authorization_services/#_service_protection_permission_api_papi)
- [Open Policy Agent](https://www.openpolicyagent.org/)

[User-Managed Access](https://www.keycloak.org/docs/latest/authorization_services/#_service_user_managed_access) (UMA) 2.0. UMA is a specification that enhances OAuth2 capabilities in the following ways:

- Privacy - Nowadays, user privacy is becoming a huge concern, as more and more data and devices are available and connected to the cloud. With UMA and Keycloak, resource servers can enhance their capabilities in order to improve how their resources are protected in respect to user privacy where permissions are granted based on policies defined by the user.
- Party-to-Party Authorization - Resource owners (e.g.: regular end-users) can manage access to their resources and authorize other parties (e.g: regular end-users) to access these resources. This is different than OAuth2 where consent is given to a client application acting on behalf of a user, with UMA resource owners are allowed to consent access to other users, in a completely asynchronous manner.
- Resource Sharing - Resource owners are allowed to manage permissions to their resources and decide who can access a particular resource and how. Keycloak can then act as a sharing management service from which resource owners can manage their resources.

Example

- [RBAC](https://www.opcito.com/blogs/rbac-for-frontend-and-backend-using-keycloak)
- ответственность за менеджмент ролей перекладываем из Keycloak на этот кастомный продукт. Затем при взаимодействии сервисов друг с другом они обращаются в этот permission-сервис и получают тот или иной набор разрешений. А уже на стороне сервиса валидируется, может ли пользователь в соответствии с разрешением выполнять операцию.

## Технологии

- Java
- PostgreSQL
- k8s
	- GoGatekeeper

## Deployment

- CPU RAM
	- [Минимальные системные требования](https://wjw465150.gitbooks.io/keycloak-documentation/content/server_installation/topics/installation/system-requirements.html) под keycloak (под 19ю версию не нашел).
	- Требуемые ресурсы CPU RAM уточнить по итогу [Benchmarks keycloak](https://github.com/keycloak/keycloak-benchmark) под НФТ.
- [HA](https://habr.com/ru/company/southbridge/blog/658187/)
	- [Deploy HA](https://habr.com/ru/company/southbridge/blog/511380/)
- [k8s](https://www.keycloak.org/server/containers)
- Режим разворачивания в ПРОДе в отказоустойчивом (HA) кластере на [СУБД postgresql](https://www.keycloak.org/server/db) с распределенным [кешем Infinispan](https://www.keycloak.org/server/caching), вариант [«Обычный кластер»](https://habr.com/ru/company/southbridge/blog/511380/)
- [docker](../../../docker/keycloak/docker-compose.yml)
- [https TLS 1.3](https://www.keycloak.org/server/enabletls)
  - [ssl modes](https://www.keycloak.org/docs/latest/server_admin/index.html#_ssl_modes)
  - [how to](https://www.mastertheboss.com/keycloak/secure-keycloak-with-https/)
  - [with proxy Envoy](https://gruchalski.com/posts/2022-02-20-keycloak-1700-with-tls-behind-envoy/)

## Observability

- Метрики мониторинга производительности		
	- [Prometheus Keycloak Metric SPI](https://github.com/aerogear/keycloak-metrics-spi)
	- [TODO](https://www.youtube.com/watch?v=ppPWqj8kRa0&feature=emb_imp_woyt)
	- [Prometheus HELM chart keycloak-metrics](https://dev.to/arvindsharma18/monitoring-keycloak-using-prometheus-operator-kubernetes-helm-charts-14f6)
- [health check](https://www.keycloak.org/server/health)
- [logs](https://www.keycloak.org/server/logging)
  
### Metric

- keycloak_response_errors
- keycloak_login_attempts
- keycloak_failed_login_attempts
- keycloak_failed_client_login_attempts
- keycloak_refresh_tokens

### Version

[Releases](https://www.keycloak.org/2022/03/releases.html)

- 26.*
- [20.*](https://www.keycloak.org/archive/documentation-20.0.html)
- [19.*](https://www.keycloak.org/archive/documentation-19.0.html)
- 18.* замена сервера приложений Java WildFly на Quarkus

## Compare

### VS Glue

- [Keyckoak win](https://kartikagarwal7.medium.com/keycloak-vs-gluu-server-iam-tools-comparison-c967cc819a95)
- [TODO](https://www.youtube.com/watch?v=Llvnq-n43k0&ab_channel=%D0%A1%D0%BB%D1%91%D1%80%D0%BC)
