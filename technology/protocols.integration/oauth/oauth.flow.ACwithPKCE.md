# Authorization Code Flow (Grant) with PKCE

- [Authorization Code Flow (Grant) with PKCE](#authorization-code-flow-grant-with-pkce)
  - [Зачем](#зачем)
  - [Варианты решений](#варианты-решений)
  - [Процесс Вариант 2: Embedded Login](#процесс-вариант-2-embedded-login)
  - [Процесс Вариант 1: Hosted Login Page](#процесс-вариант-1-hosted-login-page)
    - [1 Настройка Keycloak](#1-настройка-keycloak)
    - [2 Аутентификация](#2-аутентификация)
      - [2.1.1. Кастомизировать тему Keycloak](#211-кастомизировать-тему-keycloak)
      - [2.2.1. Встроить UI логина в Next.js и Direct Access Grant (ROPC)](#221-встроить-ui-логина-в-nextjs-и-direct-access-grant-ropc)
    - [2.2 Backend](#22-backend)
    - [2.3. Реализация на фронтенде](#23-реализация-на-фронтенде)
      - [2.3.1. Web (React/NextJS)](#231-web-reactnextjs)
      - [2.3.2. Mobile (Android/iOS)](#232-mobile-androidios)
        - [2.3.2.1. Android PKCE Flow with Keycloak](#2321-android-pkce-flow-with-keycloak)
        - [2.3.2.2. iOS PKCE Flow with Keycloak](#2322-ios-pkce-flow-with-keycloak)
    - [3 Авторизация](#3-авторизация)
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

## Процесс Вариант 2: Embedded Login

React (login form)
  → Backend
    → POST /token (grant_type=password)
      → Keycloak

Минусы:

- PKCE тут не применяется
- пароль проходит через ваш backend
  - Ваше приложение становится "осведомленным" о паролях пользователей, что увеличивает поверхность атаки и исключает возможность использования социальных входов, MFA или функций саморегистрации Keycloak без написания сложного кода
- отключается SSO
- хуже безопасность (ROPC deprecated в OAuth 2.1)
  
## Процесс Вариант 1: Hosted Login Page

Как это выглядит
	React → редирект на /authorize
	Keycloak → показывает кастомизированную тему логина
	После логина → redirect обратно с code
	Backend → обменивает code + verifier на токены

Плюсы:

- PKCE работает нативно
- Нет хранения паролей на фронте
- Полное соответствие OIDC
- Поддержка SSO, MFA, brute force protection

Минусы:

- UX не нативный

### 1 Настройка Keycloak

Для поддержки PKCE и работы с фронтендом (публичным клиентом) выполните следующие действия:

- Создайте клиент: В консоли администрирования Keycloak создайте новый клиент для вашего приложения.
- Тип доступа: Установите Client Authentication в положение Off (что сделает клиент публичным) и включите Standard Flow.
- Настройка PKCE: Вкладка Advanced -> Advanced Settings. Установите Proof Key for Code Exchange Code Challenge Method на S256 (рекомендуемый метод хеширования).
- Redirect URIs: Укажите точные URL вашего NextJS приложения (например, <http://localhost:3000/*>), куда Keycloak будет возвращать пользователя после авторизации.

### 2 Аутентификация

- Аутентификация всегда происходит на стороне Authorization Server (Keycloak)
- Пароли будут обрабатываться только сервером авторизации (Authorization Server)
- UI логина — часть этого процесса (Hosted Login Page)

#### 2.1.1. Кастомизировать тему Keycloak

Как кастомизировать UI
	Keycloak Themes (Freemarker + CSS)
	Можно сделать UI практически как в Next.js
	Что можно кастомизировать:
		HTML
		CSS
		JS
		Поля формы
		UX полностью

#### 2.2.1. Встроить UI логина в Next.js и Direct Access Grant (ROPC)

Deprecated, не рекомендуется использовать, так как ROPC не поддерживает PKCE и имеет риски безопасности.

### 2.2 Backend

- DEPRECATED [NodeJS KeyCloak Adapter](https://www.keycloak.org/securing-apps/nodejs-adapter)
  - [example](https://github.com/keycloak/keycloak-quickstarts/tree/main/nodejs/resource-server)
- [Passport TypeScript Node.js KeyCloak ACF with PKCE](https://blog.brakmic.com/pkce-with-keycloak-and-passport/) [passport-keycloak-oauth2-oidc-portable](https://github.com/brakmic/passport-keycloak-oauth2-oidc-portable/) на основе [passport-keycloak-oauth2-oidc](https://github.com/louie007/passport-keycloak-oauth2-oidc)
- express-openid-connect
- [openid-client](https://github.com/panva/openid-client)

### 2.3. Реализация на фронтенде

#### 2.3.1. Web (React/NextJS)

- [Using a browser only](https://auth0.com/docs/get-started/authentication-and-authorization-flow/authorization-code-flow-with-proof-key-for-code-exchange-pkce)
  - [JS library](https://github.com/auth0/auth0-spa-js)
- [SPA NextJS](https://auth0.com/blog/ultimate-guide-nextjs-authentication-auth0/)
  
Для работы с Keycloak в React-приложении рекомендуется использовать официальный пакет keycloak-js.
Инициализация с PKCE: При инициализации адаптера необходимо явно указать метод PKCE:
Процесс ACF с PKCE: Адаптер автоматически создаст code_verifier (секретную строку) и выведет из неё code_challenge (хеш), которые будут отправлены в запросе на авторизацию. После возврата кода авторизации адаптер отправит исходный верификатор на Token Endpoint для получения токена.

#### 2.3.2. Mobile (Android/iOS)

##### 2.3.2.1. Android PKCE Flow with Keycloak

- [Android KeyCloak AppAuth Adapter](https://levelup.gitconnected.com/integrating-keycloak-in-android-with-appauth-what-you-really-need-to-know-59fb56f26432)
- [AppAuth Android + Logout](https://habr.com/ru/companies/kts/articles/654029/)
- [AppAuth Android + Google API OAuth](https://habr.com/ru/articles/735982/)
- [Google Android manual](https://developers.google.com/identity/protocols/oauth2/native-app)

Реализация Authorization Code Flow (ACF) с PKCE на Android через Keycloak обычно выполняется с использованием библиотеки AppAuth, которая является стандартом для работы с OpenID Connect на мобильных платформах.

Ниже приведен пошаговый процесс реализации согласно источникам:

1.Настройка Keycloak для Android-клиента

В дополнении к основным [KeyCloak](#1-настройка-keycloak)
Redirect URIs: Укажите схему обратного вызова вашего приложения (например, com.myapp://oauth2callback).

2.Подготовка Android-проекта

Используйте библиотеку AppAuth для автоматизации создания запросов и обработки ответов:
Зависимости: Добавьте net.openid:appauth в ваш build.gradle.
Манифест: Настройте intent-filter для обработки редиректа от Keycloak. Это можно сделать через manifestPlaceholders в Gradle, чтобы библиотека AppAuth автоматически добавила нужные параметры в манифест.

3.Процесс авторизации (ACF + PKCE)

Процесс включает создание секретного верификатора и его хешированного аналога:
Генерация PKCE-параметров: Приложение создает случайную строку Code Verifier. На её основе вычисляется Code Challenge (хеш SHA-256).
Формирование запроса: Используйте AuthorizationRequest.Builder из AppAuth. В запрос передаются:
URL эндпоинтов (обычно загружаются из .../well-known/openid-configuration).
clientId и redirectUri.
code_challenge и code_challenge_method=S256.

Запуск через Custom Tabs: Запрос открывается не в WebView (из соображений безопасности), а в Chrome Custom Tabs.
Получение кода: После входа Keycloak перенаправляет пользователя обратно в приложение с Authorization Code.
Обмен кода на токен: Приложение отправляет запрос на Token Endpoint, передавая полученный код и исходный Code Verifier. Keycloak хеширует присланный верификатор и сравнивает его с тем челленджем, который был получен на первом этапе. Если они совпадают, выдается Access Token.

4.Хранение токенов

Для управления состоянием авторизации AppAuth предоставляет класс AuthState. Он позволяет хранить токены и информацию о конфигурации, а также легко сериализуется в JSON для сохранения в защищенном хранилище (например, EncryptedSharedPreferences).

Почему это важно для Android? Использование PKCE защищает от атак перехвата кода авторизации (MITM), так как даже если злоумышленник перехватит code в редиректе, он не сможет обменять его на токен без секретного code_verifier, который никогда не передавался через браузер на первом этапе.

##### 2.3.2.2. iOS PKCE Flow with Keycloak

Реализация ACF с PKCE на iOS также может быть выполнена с помощью библиотеки AppAuth для iOS, которая обеспечивает поддержку OpenID Connect и OAuth 2.0.
Процесс аналогичен Android-реализации.

### 3 Авторизация

Доступ к методам API будет осуществляться с помощью Access Token, полученного в процессе ACF с PKCE. На стороне сервера (Resource Server) необходимо настроить проверку токенов, чтобы обеспечить безопасность доступа к ресурсам. Keycloak предоставляет адаптеры для различных языков и фреймворков, которые облегчают интеграцию и проверку токенов.

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
