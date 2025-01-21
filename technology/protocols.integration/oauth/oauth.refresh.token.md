# Refresh Token

## Зачем

При аутентификация по протоколу [OAuth](../oauth.md) для обеспечения [информационной безопасности](../../../arch/ability/security.md).

## Паттерны

- SPA - public client
  - [Refresh Token rotation](https://stateful.com/blog/oauth-refresh-token-best-practices) for protect a Replay attack
    - Заданный долгий срок жизни Refresh token сокращается с помощью Refresh Token rotation. Обновление действительно только в течение времени жизни Access Token, который будет короткоживущим.
  - Can Store Refresh Token In __Local Storage or browser memory__
  - иные варианты to keep a session going can be
	- cookies
	- silent authentication
	- in iframe - legacy Google block
- Confidential Clients [Should Not Rotate Refresh Tokens](https://docs.duendesoftware.com/identityserver/v6/tokens/refresh/#confidential-clients-should-not-rotate-refresh-tokens)

## Security

Время жизни:

- Refresh Token
  - Храним исключительно в httpOnly куке, если refresh token rotation не используется.
  - If your application uses __refresh token rotation__, it [can now store](https://stateful.com/blog/oauth-refresh-token-best-practices) it in __local storage or browser memory__
- Revoke tokens on logout
