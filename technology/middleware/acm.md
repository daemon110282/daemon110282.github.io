# Access Control mechanisms (ACMs)

- [Access Control mechanisms (ACMs)](#access-control-mechanisms-acms)
  - [Зачем](#зачем)
  - [RBAC](#rbac)
  - [ABAC](#abac)
  - [Паттерны](#паттерны)
    - [Backend-enforced RBAC](#backend-enforced-rbac)
    - [RBAC: Role → Permission](#rbac-role--permission)
    - [RBAC + Scope](#rbac--scope)
    - [Client-side RBAC](#client-side-rbac)
  - [Технологии](#технологии)

## Зачем

Middleware для реализации схем авторизации (Access Control Models):

- Role Based Access Control ([RBAC](#rbac))  
- [Relationship-Based Access Contro](https://www.permit.io/blog/what-is-rebac) (ReBAC)
- Attribute-based access Control (ABAC)
- User-based access control (UBAC)
- Context-based access control (CBAC)
- Group-based access control (GBAC)
- Rule-based access control
- Time-based access control

## RBAC

Role Based Access Control:

- Tenant managment
- Role assignment
	- Пример: USER, ADMIN, SUPPORT
- Role authorization
- Permission authorization
  - Пример по CRUD: CREATE_USER, READ_USER, UPDATE_USER, DELETE_USER
- User can have __multiple Roles__ and a role can have __multiple Permissions__
- __Role hierarchy__

## ABAC

Attribute-based access Control:

- TODO

## Паттерны

### Backend-enforced RBAC

1.GET /api/documents/123
Authorization: Bearer <JWT>
2.
authenticate()
      ↓
extract subject + roles
      ↓
check permission DOCUMENT_READ
      ↓
check document belongs to user's organization
      ↓
allow / deny

MANAGER
+ DOCUMENT_READ
+ document.organizationId == user.organizationId
→ ALLOW

### RBAC: Role → Permission

ROLE_ADMIN
    ↓
DOCUMENT_READ
DOCUMENT_CREATE
DOCUMENT_SIGN
DOCUMENT_DELETE
USER_READ
USER_MANAGE

### RBAC + Scope

Ограничение области действия роли.

ROLE_MANAGER
    ↓
permission = DOCUMENT_READ
scope.organization = 100500

### Client-side RBAC

{
  "user": {
    "id": "123"
  },
  "permissions": [
    "DOCUMENT_READ",
    "DOCUMENT_CREATE",
    "DOCUMENT_SIGN"
  ]
}

## Технологии

- Open Source
  - [Auth0](https://auth0.com/docs/authorization/rbac/what-is-rbac): Service, RBAC, ABAC, GBAC, REST API
  - [Ory Keto](https://www.ory.sh/keto/docs/): Service, RBAC, ABAC, GBAC, REST API
  - [Casbin](https://casbin.org/): RBAC, ABAC, ACL, REST API
  - NodeJS
    - [Permify](https://github.com/Permify/permify): Service, Docker, RBAC, ABAC, DSL, REST API, gRPC
      - [Пример](https://nuancesprog.ru/p/22727/)
    - [accesscontrol](https://www.npmjs.com/package/accesscontrol): RBAC, ABAC, read from DB settings
    - [CASL](https://github.com/stalniy/casl): ABAC, mongodb settings
    - [Casbin](https://github.com/casbin/node-casbin): RBAC, ABAC, ACL, file settings
  - [Open Policy Agent](https://www.openpolicyagent.org/): ABAC
  - [KeyCloak](iam/iam.keycloak.md#access-control): RBAC, GBAC
    - [Пример настройки RBAC by Policy, Resources, Permission in KeyCloak](https://htl-leonding-college.github.io/quarkus-security-lecture-notes/keycloak-rbac.html)
    - [Пример NodeJS RBAC](https://dev.to/haithamoumer/secure-your-rest-api-using-keycloak-role-based-access-control-3f96)
      - create Realm -> Client -> Roles
      - assign User -> Roles
      - [nest-keycloak-connect](https://www.npmjs.com/package/nest-keycloak-connect) разная логика в методе от Roles [ConditionalScopes](https://github.com/ferrerojosh/nest-keycloak-connect/blob/21f3901599e216f7f495942048c8f15ff2e4a12a/example/src/product/product/product.controller.ts)
    - [NGINX validate KeyCloak token and Role](https://dev.to/sergey-dudik/nginx-and-keycloak-a-perfect-pair-for-gateway-security-3ief)
- Commercial
  - [permit.io](https://www.permit.io/rbac): UI Admin Managment, Service, RBAC, ABAC
