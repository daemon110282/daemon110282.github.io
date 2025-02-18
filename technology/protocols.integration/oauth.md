# OAuth

- [OAuth](#oauth)
  - [Зачем](#зачем)
  - [Параметры Flow](#параметры-flow)
  - [Security](#security)
  - [Виды атак](#виды-атак)
    - [MitM](#mitm)

## Зачем

- Authorization framework, not an authentication protocol (например [OIDC](oidc.md)) для обеспечения [информационной безопасности](../../arch/ability/security.md).
- [Нужен, чтобы получать](https://habr.com/ru/company/dataart/blog/311376/) токены доступа и с ними обращаться к ресурсам.
- RBAC\ABAC и тп
- [TODO](https://connect2id.com/learn/oauth-2)
- [Flow-Grants](oidc.md#flow-grant):
  - Public Client
    - [Authorization Code Flow with PKCE](oauth/oauth.flow.ACwithPKCE.md)

## Параметры Flow

Основные [параметры Flow](https://identityserver4.readthedocs.io/en/latest/quickstarts/1_client_credentials.html)

- Authorization Code - обменивается в Authorization Code Flow на AccessToken
- Scope - получение данных Resource с учетом доступа Scope
- [__Access Token__](oauth/oauth.access.token.md) (формат [JWT](../jwt.md) не обязателен) - for accessing a resource. [A JWT token used in Oauth and OpenID connect scenarios and intended to be consumed by the resource](https://auth0.com/blog/id-token-access-token-what-is-the-difference/).
- [__Refresh Token__](oauth/oauth.refresh.token.md)

![процесс](https://habrastorage.org/r/w1560/getpro/habr/post_images/c13/afc/ee5/c13afcee5226ddb135df9836d3321b17.png)

[Песочница](https://openidconnect.net/)

## Security

- Время жизни ограничено Expiration
  - [Access Token](oauth/oauth.access.token.md)
  - [Refresh Token](oauth/oauth.refresh.token.md)
- Валидация
  - [Token validate](oauth/oauth.validate.token.md)
  - [Token exchange](oauth/oauth.exchange.token.md)
- Подписание JSON Web Signature (JWS)
- Шифрование [JSON Web Encryption](https://www.rfc-editor.org/rfc/rfc7516) (JWE)
  - [Auth0 sample](https://auth0.com/docs/secure/tokens/access-tokens/json-web-encryption)

## Виды атак

[Варианты атак](https://habr.com/ru/company/alexhost/blog/536364/):

- Replay attack

### MitM

[MitM](../../arch/ability/mitm.md) Перехват токена

- [Решение HTTPS](https://cyberpolygon.com/ru/materials/security-of-json-web-tokens-jwt/)
- [Refresh Token](oauth/oauth.refresh.token.md)
- Закрепление сертификата X.509 [Certificate Pinning](https://approov.io/product/dynamic-cert-pinning) from [Android API 24](https://approov.io/blog/securing-https-with-certificate-pinning-on-android)
- шифрование токенов JWE assymetric RSA
- подписание токенов JWS assymetric RSA
