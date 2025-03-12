# Refresh Token

## Зачем

При аутентификация по протоколу [OAuth](../oauth.md) для обеспечения [информационной безопасности](../../../arch/ability/security.md).

## Паттерны

- SPA - public client
  - [Refresh Token rotation](https://stateful.com/blog/oauth-refresh-token-best-practices) for protect a __Replay attack__ - rotation mechanism implies that a refresh token __can be used only once__
    - Заданный долгий срок жизни Refresh token сокращается с помощью Refresh Token rotation. Обновление действительно __только в течение времени жизни сессии пользователя__
  - Can Store Refresh Token In __Local Storage or browser memory__
- иные варианты to __keep a session going__ can be
	- cookies
	- __silent authentication__
	- in iframe - legacy Google block
- Confidential Clients [Should Not Rotate Refresh Tokens](https://docs.duendesoftware.com/identityserver/v6/tokens/refresh/#confidential-clients-should-not-rotate-refresh-tokens)

## Security

- Хранение
  - Храним исключительно в __httpOnly куке__, если refresh token rotation не используется
    - If your application uses __refresh token rotation__, it [can now store](https://stateful.com/blog/oauth-refresh-token-best-practices) it in __local storage or browser memory__
- Время жизни  
  - These tokens have a __longer lifespan__, typically set to __30 minutes by default__. They are used to refresh the access token after it expires. If the refresh token itself expires, the user __must log in again__ to obtain new tokens.
- Revoke tokens Отзыв токенов
  - on logout
  - Рекомендуется включить эту функцию и установить значение «Максимальное количество повторных использований токена обновления» (Refresh Token Max Reuse) равным 0.
