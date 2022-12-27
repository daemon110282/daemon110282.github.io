# IAM KeyCloak

Реализация функции [Identity and Access Management (IAM)](../../arch/system.class/iam.md) решений.

- [X5Tech выбрали](https://habr.com/ru/company/X5Tech/blog/654115/)
- [Фичи](https://habr.com/ru/company/X5Tech/blog/486778/)	
	- [Custom UI forms](https://www.keycloak.org/docs/latest/server_admin/#features) Apache Freemaker + React?
		- [Themes](https://www.opcito.com/blogs/customizing-login-and-signup-pages-in-keycloak)
		- [keycloakify React отзывы не очень](https://t.me/keycloak_ru/25264)
	- ReCaptcha v3 Google
		- [SPI](https://github.com/dasniko/keycloak-extensions-demo/tree/main/captcha)
	- Custom Fields Token
	- [ACF with PKCE](https://www.keycloak.org/docs/latest/server_admin/#con-oidc-auth-flows_server_administration_guide)
	- Template Email
	- REST API
		- Управление пользователями
	- Custom [Extension](https://www.keycloak.org/extensions.html) Plugin (2FA SMS)
		- [MFA OTP SMS](https://github.com/dasniko/keycloak-2fa-sms-authenticator)		
		- [demo](https://github.com/dasniko/keycloak-extensions-demo)
		- [Custom User provider](https://www.baeldung.com/java-keycloak-custom-user-providers)
		- [Init SSO browser session cookie by API REST](https://github.com/contabo/keycloak-spi-browser-session-api)
		- [Extenstion](https://www.youtube.com/watch?v=Aj0GAg4EkUA&t=4493s&ab_channel=%D0%A1%D0%BB%D1%91%D1%80%D0%BC)
		- [Custom login form by Phone+Captcha+SMS OTP](https://github.com/FX-HAO/keycloak-phone-authenticator)
			- [Custom AuthenticationFactory by Phone](https://developers.redhat.com/blog/2020/10/23/use-mobile-numbers-for-user-authentication-in-keycloak#)			
	- 2FA
		- HMAC based OTP (HOTP)
		- Time based OTP (TOTP)
		- [ЕСИА](https://platform.digital.gov.ru/docs/security/platform-v-iam/esia-setup)
	- User [Store\Provider](https://www.keycloak.org/docs/latest/server_development/#_user-storage-spi)		
		- User Federation (Sync)
			- AD, LDAP, Kerberos
			- [DB sync](https://www.tune-it.ru/web/adpashnin/blog/-/blogs/3723343), [PSQL with password](https://github.com/opensingular/singular-keycloak-database-federation)
			- [API](https://tech.smartling.com/migrate-to-keycloak-with-zero-downtime-8dcab9e7cb2c)
				- REST SPI user-storage [Custom User provider](https://www.baeldung.com/java-keycloak-custom-user-providers)
			- REST API System for Cross-domain Identity Management ([SCIM](../protocols.integration/scim.md))
				- SCIM Client - IDP Keycloak
					- [SCIM Provisioning SPI](https://github.com/Captain-P-Goldfish/scim-for-keycloak)			
					- [SCIM 2.0](https://lab.libreho.st/libre.sh/scim/keycloak-scim) GNU Affero General Public License v3.0
		- [On demand migration](https://github.com/Smartling/keycloak-user-migration-provider)
		- [External Identity broker OIDC](https://medium.com/keycloak/keycloak-as-an-identity-broker-an-identity-provider-af1b150ea94)
		
- [REST API Postman Collection](https://documenter.getpostman.com/view/7294517/SzmfZHnd)
- Starting with version 19, Keycloak supports sending logs using __GELF__ to centralized logging solutions like __ELK, EFK or Graylog out of the box__.
- [Обучение СЛЁРМ](https://slurm.io/keycloak)

Термины:

- Realm - [необходимо ограничение по кол-ву, риски по НТ](https://highload.today/blogs/keycloak-i-oauth-2/)
	- Users входят в Realm
	- Clients входят в Realm
	- [MTA](../../arch/mta.md) подход можно реализовать 
- Groups
- Roles
- Cross-Origin Resource Sharing (CORS) - [механизм, использующий дополнительные HTTP-заголовки](https://developer.mozilla.org/ru/docs/Web/HTTP/CORS), чтобы дать возможность агенту пользователя получать разрешения на доступ к выбранным ресурсам с сервера на источнике (домене), отличном от того, что сайт использует в данный момент. Говорят, что агент пользователя делает запрос с другого источника (cross-origin HTTP request), если источник текущего документа отличается от запрашиваемого ресурса доменом, протоколом или портом. Пример: http://domain-a.com, запрашивает <img> src по адресу http://domain-b.com/image.jpg
	- Origin - Web content's origin is defined by the scheme (protocol), hostname (domain), and port of the URL used to access it. Two objects have the __same origin__ only when the __scheme, hostname, and port all match__.

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
- Метрики мониторинга производительности
	- [k8s](https://www.keycloak.org/server/containers)
	- [Prometheus](https://github.com/aerogear/keycloak-metrics-spi)
- [health check](https://www.keycloak.org/server/health)
- Режим разворачивания в ПРОДе в отказоустойчивом (HA) кластере на [СУБД postgresql](https://www.keycloak.org/server/db) с распределенным [кешем Infinispan](https://www.keycloak.org/server/caching), вариант [«Обычный кластер»](https://habr.com/ru/company/southbridge/blog/511380/)

## User Storage

User Provisioning
- Inbound - Keycloak получает из ИС источника пользовательские данные
- Outbound - ИС источник предоставляет Keycloak пользовательские данные

REST SPI [Custom User provider](https://www.baeldung.com/java-keycloak-custom-user-providers) реализация интерфейсов org.keycloak.storage.UserStorageProviderFactory - Allows Keycloak to access custom user stores.
	- [Интерфейсы пользовательских провайдеров](https://www.keycloak.org/docs/11.0/server_development/index.html#provider-capability-interfaces)

### Version

[Releases](https://www.keycloak.org/2022/03/releases.html)

- 18.* замена сервера приложений Java WildFly на Quarkus
- [19.*](https://www.keycloak.org/archive/documentation-19.0.html)
- [20.*](todo)

## Compare

### VS Glue

- [Keyckoak win](https://kartikagarwal7.medium.com/keycloak-vs-gluu-server-iam-tools-comparison-c967cc819a95)
- [TODO](https://www.youtube.com/watch?v=Llvnq-n43k0&ab_channel=%D0%A1%D0%BB%D1%91%D1%80%D0%BC)
