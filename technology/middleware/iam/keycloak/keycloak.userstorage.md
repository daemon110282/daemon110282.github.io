# KeyCloak User Storage

## Зачем

Реализация [User Storage](../../../../arch/system.class/iam.md#user-store) для Keycloak.

## Функции

User [Store\Provider](https://www.keycloak.org/docs/latest/server_development/#_user-storage-spi)		

- User Federation (Sync) - __password not import, keycloak delegate__
  - REST SPI [Custom User provider](https://www.baeldung.com/java-keycloak-custom-user-providers) реализация интерфейсов org.keycloak.storage.UserStorageProviderFactory - Allows Keycloak to access custom user stores.
	- [Интерфейсы пользовательских провайдеров](https://www.keycloak.org/docs/11.0/server_development/index.html#provider-capability-interfaces)
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
