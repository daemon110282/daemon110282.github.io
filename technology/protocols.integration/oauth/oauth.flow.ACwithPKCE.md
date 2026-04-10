# Authorization Code Flow (Grant) with PKCE

- [Authorization Code Flow (Grant) with PKCE](#authorization-code-flow-grant-with-pkce)
  - [Зачем](#зачем)
  - [Варианты решений](#варианты-решений)
    - [Процесс Вариант 2: Embedded Login](#процесс-вариант-2-embedded-login)
    - [Процесс Вариант 1: Hosted Login Page](#процесс-вариант-1-hosted-login-page)
  - [Необходимость перехода на Authorization Code Flow + PKCE в ЛК\\МП](#необходимость-перехода-на-authorization-code-flow--pkce-в-лкмп)
    - [Плюсы](#плюсы)
    - [Минусы](#минусы)

## Зачем

- [Flow review](https://youtu.be/zOy3-_Cdhn4)
  - [Описание](https://auth0.com/docs/get-started/authentication-and-authorization-flow/authorization-code-flow-with-pkce)
  - [На русском](https://habr.com/ru/companies/flant/articles/475942/)

## Варианты решений

1. Hosted Login Page (Recommended) - Рекомендуемый вариант, так как он обеспечивает более высокий уровень безопасности и соответствует лучшим практикам OAuth 2.0 с PKCE.
2. Embedded Login (Not Recommended) - Встроенный логин, который может быть реализован с помощью Direct Grant (Resource Owner Password Credentials), но не поддерживает PKCE и имеет риски безопасности, поэтому не рекомендуется использовать.

### Процесс Вариант 2: Embedded Login

React (login form)
  → Backend
    → POST /token (grant_type=password)
      → IAM (например Keycloak)

Минусы:

- PKCE тут не применяется
- пароль проходит через ваш backend
  - Ваше приложение становится "осведомленным" о паролях пользователей, что увеличивает поверхность атаки и исключает возможность использования социальных входов, MFA или функций саморегистрации Keycloak без написания сложного кода
- отключается SSO
- хуже безопасность (ROPC deprecated в OAuth 2.1)
  
### Процесс Вариант 1: Hosted Login Page

Как это выглядит
	React → редирект на /authorize
	IAM (например Keycloak) → показывает кастомизированную тему логина
	После логина → redirect обратно с code
	Backend → обменивает code + verifier на токены

Плюсы:

- PKCE работает нативно
- Нет хранения паролей на фронте
- Полное соответствие OIDC
- Поддержка SSO, MFA, brute force protection

Минусы:

- UX не нативный

Вариант реализации на [Keycloak](../../middleware/iam/keycloak/keycloak.oauth.flow.ACwithPKCE.md)

## Необходимость перехода на Authorization Code Flow + PKCE в ЛК\МП

Потребуется реализация как минимум:

- формы авторизации в Keycloak и дизайн темы в KeyCloak
  - Основное ограничение Authorization Code Flow + PKCE – авторизация на стороне KeyCloak
  - Сейчас в Keycloak поддерживается авторизация по договору-паролю
  - Доработки для поддержки авторизации по телефону\email\логину
- настройки KeyCloak
  - Возможно, доработки для поддержки авторизации по телефону\email\логину
- доработка CNETS
  - API для нового процесса авторизации
  - Изменение процессов 2FA SMS, Email
  - Для поддержки авторизации по телефону\email\логину
  - Изменение процесса выхода из ЛК\МП
- доработка ЛК
- доработка МП

### Плюсы

- Безопасность (ключевое) - соответствие OAuth 2.1 и требованиям ИБ
  - Пароль больше не проходит через CNETS
  - сейчас: client → backend → Keycloak
  - станет: client → Keycloak напрямую
  - PKCE защищает от interception attack
  - Нативная поддержка:
    - brute force protection
    - MFA
    - conditional auth flows
- Стандартизация (OIDC-compliant)
  - Полностью соответствие: OAuth 2.1, OIDC Core
  - Убирается анти паттерн (Resource Owner Password Credentials уже устаревший способ)
  - Упрощается аудит (ИБ, регуляторы)
- Single Sign One (единый вход) и расширяемость
  - Можно реализовать единый вход (т. е. авторизации достаточно на одном из устройств) между: ЛК\МП
  - Можно добавить авторизации:
    - Через соц. логины
    - Корпоративные провайдеры авторизации (LDAP) для сотрудников, например
- Упрощение Backend
  - перестаёт проксировать логин, работать с паролями

### Минусы

- Потеря полного контроля над UI-UX
  - UI теперь - Keycloak тема
  - Нет «чистой-нативной» формы авторизации на React\Android\IOS
  - особенно заметно в МП (при авторизации будет
  - открываться браузер с формой авторизации в KeyCloak)
- Усложнение интеграции
  - через редиректы в KeyCloak
  - Дополнительные переходы:  /authorize, /callback
- Доработка ЛК
  - Подключение библиотеки для поддержки Authorization Code Flow + PKCE
- Доработка МП
  - Подключение библиотеки для поддержки Authorization Code Flow + PKCE
  - WebView использовать нельзя
  - Открывается браузер / Custom Tab
  - Потеря «нативности» UX
- Поддержка темы в Keycloak
  - Freemarker вместо React
  - ограниченный runtime
  - сложнее CI/CD
- Полный регресс функционала авторизации
- Риск необходимости доработки стандартных процессов авторизации в KeyCloak под уникальные
  - Необходимы разработчики Java
