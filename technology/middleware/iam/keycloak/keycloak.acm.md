# KeyCloak ACM

## Зачем

Реализация [Access Control mechanisms](../../../../technology/middleware/acm.md) (ACMs).

## Функции

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