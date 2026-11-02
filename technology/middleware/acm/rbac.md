# RBAC

- [RBAC](#rbac)
  - [Зачем](#зачем)
    - [Проблема RBAC](#проблема-rbac)
  - [Паттерны](#паттерны)
    - [Backend-enforced RBAC](#backend-enforced-rbac)
    - [RBAC: Role → Permission](#rbac-role--permission)
    - [RBAC + Scope](#rbac--scope)
    - [Client-side RBAC](#client-side-rbac)

## Зачем

Вариант реализации схемы авторизации [Access Control Models](../acm.md).

Role Based Access Control:

- Tenant managment
- Role assignment
	- Пример: USER, ADMIN, SUPPORT
- Role authorization
- Permission authorization
  - Пример по CRUD: CREATE_USER, READ_USER, UPDATE_USER, DELETE_USER
- User can have __multiple Roles__ and a role can have __multiple Permissions__
- __Role hierarchy__

### Проблема RBAC

- [Суть подхода](https://habr.com/ru/companies/custis/articles/248649/) заключается в создании ролей, __повторяющих бизнес-роли в компании__, и присваивание их пользователям. На основе этих ролей проверяется возможность выполнения пользователем того или иного действия.
  - Если __бизнес-правила одномерны__ и все действия можно разбить по ролям (бухгалтер, менеджер, администратор и т. п.), такого подхода будет достаточно. Тогда одному бизнес-правилу будет соответствовать одна роль.
- Но бизнес-правила неизбежно усложняются и становятся __многомерными__. Это приводит к тому, что одного атрибута (роли) для выражения бизнес-правил становится недостаточно и начинают __добавляться другие атрибуты__ (город, страна, филиал, день недели, владелец, лимит и т. п.).
  - Чтобы справиться с этой сложностью, необходимо создавать дополнительные роли, число которых равно числу различных комбинаций всех атрибутов.
  - Бизнес-правила, в которых используются атрибуты, значения которых заранее не известны и вычисляются в процессе работы, вообще невозможно выразить с помощью ролевой модели.
  - Придумали [ABAC](abac.md)

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