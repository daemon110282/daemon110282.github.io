# System for Cross-domain Identity Management (SCIM)

## Зачем

- [SCIM](https://learn.microsoft.com/ru-ru/azure/active-directory/app-provisioning/use-scim-to-provision-users-and-groups)
- [Концепция](https://developer.okta.com/docs/concepts/scim/#lifecycle-management-using-profile-sourcing)
![scheme](https://developer.okta.com/img/oin/scim_lifecycle.png)

Термины:

- SCIM Client - [IAM IDP](../../arch/system.class/iam.md) (например IAM, но может быть и сервером)
- SCIM Server - User Directory (Store)

Фичи:

- [Use Case](https://datatracker.ietf.org/doc/html/draft-ietf-scim-use-cases-07)
	- MIRO user [add\update\delete (sync)](https://developers.miro.com/docs/scim-api-user-lifecycle-management) to SCIM Server [OKTA](https://help.miro.com/hc/en-us/articles/360036768134-Setting-up-automated-provisioning-with-OKTA)
- SCIM Client
	- Users
		- Импорт пользователей [из SCIM Server](https://developer.okta.com/docs/reference/scim/scim-11/#retrieve-users)
			- [постранично](https://datatracker.ietf.org/doc/html/rfc7644#section-3.4.2.4)
			- по [фильтрам](https://www.rfc-editor.org/rfc/rfc7644#section-3.4.2.2) (дельта по датавремя создания пользователя, например)
		- Provision users from External User Store to Keycloak
			- [Flow OKTA SCIM 1.1](https://developer.okta.com/docs/reference/scim/scim-11/)
			- [Flow OKTA SCIM 2.0](https://developer.okta.com/docs/reference/scim/scim-20/)
	- Groups
- SCIM Server
	- [REST API Endpoints](https://learn.microsoft.com/ru-ru/azure/active-directory/app-provisioning/use-scim-to-provision-users-and-groups)
		- [Swagger](https://is.docs.wso2.com/en/latest/apis/scim2-rest-apis/)
		- [Postman Collection](https://github.com/AzureAD/SCIMReferenceCode/wiki/Test-Your-SCIM-Endpoint)

## Технологии

[Варианты](https://www.simplecloud.info/#Implementations2)

- SCIM Client	
	- [SCIM 2.0](https://lab.libreho.st/libre.sh/scim/keycloak-scim) GNU Affero General Public License v3.0
- SCIM Server
	- [SCIM 1.1 Provisioning IDP Keycloak SPI](https://github.com/Captain-P-Goldfish/scim-for-keycloak)
	- [PHP 1.1 and SCIM 2.0 Okta](https://toolkit.okta.com/apps/scimify/)
	- [PHP Onelogin](https://github.com/onelogin/onelogin-scim-php)
	- [rocketchat SCIM 2.0 Example](https://lab.libreho.st/libre.sh/scim/rocketchat-scim)

## Версии 

- 2.0
	- [2.0 vs 1.1](https://gayanmadusanka-80721.medium.com/scim-2-0-vs-scim-1-1-part-01-2bcfe2534f95)
- 1.1 legacy
- 1.0 deprecated

