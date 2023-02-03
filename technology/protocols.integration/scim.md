# System for Cross-domain Identity Management (SCIM)

## Зачем

- [SCIM](https://learn.microsoft.com/ru-ru/azure/active-directory/app-provisioning/use-scim-to-provision-users-and-groups)
- [Концепция](https://developer.okta.com/docs/concepts/scim/#lifecycle-management-using-profile-sourcing)
![scheme](https://developer.okta.com/img/oin/scim_lifecycle.png)

Термины:

- SCIM Client - [IAM IDP](../../arch/system.class/iam.md) (например Keycloak)
- SCIM Server - User Directory (Store)

Фичи:

- SCIM Client
	- Users
		- [Sync Users](https://developer.okta.com/docs/reference/scim/scim-11/#retrieve-users)
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
	- [SCIM 1.1 Provisioning IDP Keycloak SPI](https://github.com/Captain-P-Goldfish/scim-for-keycloak)
	- [SCIM 2.0](https://lab.libreho.st/libre.sh/scim/keycloak-scim) GNU Affero General Public License v3.0
- SCIM Server
	- [PHP 1.1 and SCIM 2.0 Okta](https://toolkit.okta.com/apps/scimify/)
	- [PHP Onelogin](https://github.com/onelogin/onelogin-scim-php)
	- [rocketchat SCIM 2.0 Example](https://lab.libreho.st/libre.sh/scim/rocketchat-scim)

## Версии 

- 2.0
	- [2.0 vs 1.1](https://gayanmadusanka-80721.medium.com/scim-2-0-vs-scim-1-1-part-01-2bcfe2534f95)
- 1.1 legacy
- 1.0 deprecated

