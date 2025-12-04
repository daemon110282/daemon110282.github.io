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

TODO
