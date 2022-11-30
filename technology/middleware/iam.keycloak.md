# IAM KeyCloak

Реализация функции [Identity and Access Management (IAM)](../../arch/iam.md) решений.

- [X5Tech выбрали](https://habr.com/ru/company/X5Tech/blog/654115/)
- [Фичи](https://habr.com/ru/company/X5Tech/blog/486778/)	
	- [Custom UI forms](https://www.keycloak.org/docs/latest/server_admin/#features) Apache Freemaker + React?
		- [Themes](https://www.opcito.com/blogs/customizing-login-and-signup-pages-in-keycloak)
		- [keycloakify React отзывы не очень](https://t.me/keycloak_ru/25264)
	- ReCaptcha v3 Google
	- Custom Fields Token
	- [ACF with PKCE](https://www.keycloak.org/docs/latest/server_admin/#con-oidc-auth-flows_server_administration_guide)
	- Template Email
	- REST API
		- Создание пользователя
	- Custom Extension Plugin (2FA SMS)
		- [MFA OTP SMS](https://github.com/dasniko/keycloak-2fa-sms-authenticator)		
		- [demo](https://github.com/dasniko/keycloak-extensions-demo)
		- [Custom User provider](https://www.baeldung.com/java-keycloak-custom-user-providers)
	- 2FA
		- HMAC based OTP (HOTP)
		- Time based OTP (TOTP)
		- [ЕСИА](https://platform.digital.gov.ru/docs/security/platform-v-iam/esia-setup)
	- User Store (DB syns by User Federation?, AD, LDAP)
	- [Extenstion](https://www.youtube.com/watch?v=Aj0GAg4EkUA&t=4493s&ab_channel=%D0%A1%D0%BB%D1%91%D1%80%D0%BC)
- [Deploy HA](https://habr.com/ru/company/southbridge/blog/511380/)
- [VueJS](https://www.youtube.com/watch?app=desktop&v=sE02clzN_ok&ab_channel=hi5code)
- [Обучение СЛЁРМ](https://slurm.io/keycloak)
- [REST API Postman Collection](https://documenter.getpostman.com/view/7294517/SzmfZHnd)
- Starting with version 19, Keycloak supports sending logs using __GELF__ to centralized logging solutions like __ELK, EFK or Graylog out of the box__.

Термины:

- Realm - [необходимо ограничение по кол-ву, риски по НТ](https://highload.today/blogs/keycloak-i-oauth-2/)
	- Users входят в Realm
	- Clients входят в Realm
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
	- [Benchmarks](https://github.com/keycloak/keycloak-benchmark)
- [HA](https://habr.com/ru/company/southbridge/blog/658187/)
- Метрики мониторинга производительности
	- [k8s](https://www.keycloak.org/server/containers)
	- [Prometheus](https://github.com/aerogear/keycloak-metrics-spi)
- [health check](https://www.keycloak.org/server/health)

### Version

- [19.*](https://www.keycloak.org/archive/documentation-19.0.html)
- [20.*](todo)

## Compare

### VS Glue

- [Keyckoak win](https://kartikagarwal7.medium.com/keycloak-vs-gluu-server-iam-tools-comparison-c967cc819a95)
- [TODO](https://www.youtube.com/watch?v=Llvnq-n43k0&ab_channel=%D0%A1%D0%BB%D1%91%D1%80%D0%BC)
