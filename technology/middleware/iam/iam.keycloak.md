# IAM KeyCloak

- [IAM KeyCloak](#iam-keycloak)
	- [Зачем](#зачем)
	- [Функции](#функции)
		- [Термины](#термины)
		- [Обновление Access Token используя Refresh Token](#обновление-access-token-используя-refresh-token)
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

- [Custom UI forms](keycloak/keycloak.theme.md)
- [ReCaptcha v3 Google](https://habr.com/ru/company/X5Tech/blog/486778/)
	- [SPI](https://github.com/dasniko/keycloak-extensions-demo/tree/main/captcha)
	- [Custom login form by Phone+Captcha+SMS OTP](https://github.com/FX-HAO/keycloak-phone-authenticator)
      - [Custom AuthenticationFactory by Phone](https://developers.redhat.com/blog/2020/10/23/use-mobile-numbers-for-user-authentication-in-keycloak#)
- Flow-Grants
  - [ACF](../../protocols.integration/oauth/oauth.flow.ACwithPKCE.md) with [PKCE](https://www.keycloak.org/docs/latest/server_admin/#con-oidc-auth-flows_server_administration_guide)
  - Implicit Flow
- [Tokens](https://www.janua.fr/understanding-token-usage-in-keycloak/)
  - [Custom Fields](https://datmt.com/backend/how-to-add-custom-claims-from-user-attributes-in-keycloak/) Token
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
	- Time based OTP (TOTP)
	- [ЕСИА](https://platform.digital.gov.ru/docs/security/platform-v-iam/esia-setup)
	- 2FA SMS
      - [MFA OTP SMS](https://github.com/dasniko/keycloak-2fa-sms-authenticator)
- User [Store\Provider](keycloak/keycloak.userstorage.md)		
- [Access Control mechanisms](keycloak/keycloak.acm.md) (ACM)
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

- Realm settings\Tokens\Access tokens
  - Access Token Lifespan - Максимальное время жизни __Access токена__, сек "accessTokenLifespan" - 10800с=3ч (5мин) | 60
  - Access Token Lifespan For Implicit Flow - Максимальное время жизни access токена для Implicit Flow, сек "accessTokenLifespanForImplicitFlow" -  10800 | 60
  - Client Login Timeout
- Realm settings\Sessions\SSO Session Settings
  - SSO Session Idle - Если пользователь неактивен дольше указанного времени, то сессия истекает., сек Касается __Refresh токенов__, и браузеров. "ssoSessionIdleTimeout" - 2592000с=30д | 120
    - __Можно продлить сессию__ через Refresh Token
  - SSO Session Max - Максимальное время жизни сессии, после чего сессия истекает. Касается Refresh токенов, и браузеров, сек. "ssoSessionMaxLifespan": 15552000=180д | 180
    - __Нельзя продлить сессию__ используя Refresh Token
    - Должно быть больше и включать SSO Session Idle
  - SSO Session Idle Remember Me - То же самое, что SSO Session Idle, но при нажатом "Запомнить меня" "ssoSessionIdleTimeoutRememberMe" - 0
  - SSO Session Max Remember Me - То же самое, что SSO Session Max, но при нажатом "Запомнить меня" "ssoSessionMaxLifespanRememberMe" - 0
- Realm settings\Sessions\Client session settings
  - Client Session Idle - То же самое, что SSO Session Idle, но для __Refresh токена__. Если на задано, то используется "ssoSessionIdleTimeout" "clientSessionIdleTimeout" - 0
  - Client Session Max - То же самое, что SSO Session Max, но для __Refresh токена__. Если на задано, то используется "ssoSessionMaxLifespan" "clientSessionMaxLifespan" - 0

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
