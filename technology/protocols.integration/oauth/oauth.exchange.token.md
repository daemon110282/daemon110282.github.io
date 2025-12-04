# Token exchange

## Зачем

- [На основе Access token выдается 2й AT](https://www.keycloak.org/securing-apps/token-exchange#_standard-token-exchange) для __другого сервиса__ например
- ID token will not have granted scopes (I know, this is another pain point).
- JWTs contain claims, which are statements (such as name or email address) about an entity (typically, the user) and additional metadata. The OpenID Connect specification defines a set of standard claims.
- ![token exchange](https://lh3.googleusercontent.com/pw/AL9nZEWPOntqnB_XS-gCUQ42P-5NCg7Ageg9UtnKGcWYPwh2CAvrafKhHYxZq4xm7CnNCeVPJrThmWHDawnZDc6d15u-XvAfPywOdogmuMKUJ3ZX6PbHprwj0tUSFXnAYVqoQo_YpKbhr9IC38PzsjUPcTG2Pw=w754-h441-no)

## KeyCloak

### V2

Поддержка стандарта OAuth:

- Support only from [Keycloak 26.2](https://www.keycloak.org/2025/05/standard-token-exchange-kc-26-2)
- Token exchange never creates a __new user session__
- It is not supported for __public clients__
- [Enable token exchange](https://www.keycloak.org/securing-apps/token-exchange#_standard-token-exchange-enable) on REALM

### V1 Legacy

#### Impersonation

Инструкции:

- [Официальная](https://www.keycloak.org/securing-apps/token-exchange#_legacy-token-exchange)
  - [роль impersonation у админа](https://www.reddit.com/r/KeyCloak/comments/1m001z1/impersonation_with_token_exchange_v1/)

KeyCloak version 26.0.1:

1. KeyCloak 26.0.1: Включить в KeyCloak KC_FEATURES=token-exchange,admin-fine-grained-authz:v1
   1. Проверить в /admin/master/console/#/master/info "Enabled features"
      1. ADMIN_FINE_GRAINED_AUTHZ Preview
      2. TOKEN_EXCHANGE Preview
2. Настроить в realm="EFTR"
3. Добавить в "Users -> Add user" нового пользователя "admin_impersonation"
   1. Установить пароль в "Credentials" Temporary=Off
4. Добавить User="admin_impersonation" роль "Role mapping -> Assign role -> realm-management impersonation"
5. Добавить client="eftr-service-impersonation" в "Clients -> Create client"
   1. "Valid redirect URIs" = "/*"
   2. "Web origins = "/*"
   3. "Capability config -> Client authentication" = On
6. Добавить client="eftr-service" в "Clients -> Permissions"
   1. "Permissions enabled" = On
   2. Выбрать в "Permission list" "token-exchange"
   3. Выбрать в "Policies" "Create client policy"
      1. Указать Name = "client-exchange"
      2. Выбрать Clients = "eftr-service-impersonation"
   4. Перейти в client="eftr-service" в "Clients -> Permissions -> Permission list -> token-exchange"
      1. Указать в "Policies" "client-exchange"

#### Direct Naked Impersonation

Инструкции:

- [Официальная](https://www.keycloak.org/securing-apps/token-exchange#_direct_naked_impersonation)
  - С уточнениями [не официальная](https://stackoverflow.com/questions/75337152/how-to-solve-keycloak-client-not-allowed-to-exchange)