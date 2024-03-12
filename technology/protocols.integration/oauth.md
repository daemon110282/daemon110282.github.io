# OAuth

- [OAuth](#oauth)
  - [Зачем](#зачем)
  - [Параметры Flow](#параметры-flow)
  - [Security](#security)
  - [Token validate](#token-validate)
  - [Token exchange](#token-exchange)

## Зачем

- [Нужен, чтобы получать](https://habr.com/ru/company/dataart/blog/311376/) токены доступа и с ними обращаться к ресурсам.
- Authorization framework, not an authentication protocol (например [OIDC](oidc.md)).
- RBAC\ABAC и тп
- [TODO](https://connect2id.com/learn/oauth-2)
- [Flow](https://habr.com/ru/company/nixys/blog/566910/) (also called __Grants__):
  - Public Client
    - [Authorization Code Flow with PKCE](oauth.flow.ACwithPKCE.md)      

## Параметры Flow

Основные [параметры Flow](https://identityserver4.readthedocs.io/en/latest/quickstarts/1_client_credentials.html)

- Authorization Code - обменивается в Authorization Code Flow на AccessToken
- Scope - получение данных Resource с учетом доступа Scope
- [__Access Token__](oauth.access.token.md) (формат [JWT](../jwt.md) не обязателен) - for accessing a resource. [A JWT token used in Oauth and OpenID connect scenarios and intended to be consumed by the resource](https://auth0.com/blog/id-token-access-token-what-is-the-difference/).
- [__Refresh Token__](oauth.refresh.token.md)

![процесс](https://habrastorage.org/r/w1560/getpro/habr/post_images/c13/afc/ee5/c13afcee5226ddb135df9836d3321b17.png)

[Песочница](https://openidconnect.net/)

## Security

- Время жизни ограничено:
  - [Access Token](oauth.access.token.md)
  - [Refresh Token](oauth.refresh.token.md)
- Валидация
  - [Token validate](oauth.validate.token.md)
  - [Token exchange](oauth.exchange.token.md)
