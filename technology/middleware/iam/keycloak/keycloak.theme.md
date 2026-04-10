# Keycloak Theme

Варианты:

- Keycloakify - более современный, с поддержкой React и TypeScript, но менее гибкий в плане кастомизации
- Apache Freemaker - более традиционный, с поддержкой шаблонов Freemaker, но требует больше усилий для создания современного UI

## Вариант 1: Keycloakify

[Инструмент](https://www.keycloakify.dev/) для создания кастомных тем Keycloak с использованием React и TypeScript. Он позволяет разработчикам создавать современные и адаптивные пользовательские интерфейсы для страниц входа, регистрации и других форм, предоставляемых Keycloak.

[Банки РУ SSO](https://habr.com/ru/companies/banki/articles/949360/)

### Keycloakify Deploying Custom Themes

TODO

## Вариант 2: Apache Freemaker

- [Custom UI forms](https://www.keycloak.org/ui-customization/themes)
- Шаблон формата [Apache Freemaker](https://freemarker.apache.org/) HTML + CSS + JS
- [Поля формы](https://www.keycloak.org/docs/26.6.0/server_development/#adding-an-authenticator-form)
- [Добавить темную тему](https://www.keycloak.org/ui-customization/themes#_dark_mode)
- [Определить локализацию](https://www.keycloak.org/ui-customization/themes#_locale_selector)
- [VueJS](https://habr.com/ru/articles/841550/)

### Freemaker Deploying Custom Themes

- [Установить тему Login](https://www.keycloak.org/docs/latest/server_admin/#_themes)
- [Deploy](https://www.keycloak.org/ui-customization/themes#_deploying_themes)
- [Настроить параметры логина](https://www.keycloak.org/docs/latest/server_admin/#controlling-login-options)

## Структура каталога темы

themes/
└── my-theme/
    ├── theme.properties
    ├── login/
    │   ├── theme.properties
    │   ├── resources/
    │   │   ├── css/
    │   │   │   └── styles.css
    │   │   ├── js/
    │   │   │   └── script.js
    │   │   └── img/
    │   │       └── logo.svg
    │   ├── messages/
    │   │   └── messages_en.properties
    │   └── templates/
    │       ├── login.ftl
    │       ├── register.ftl
    │       ├── login-reset-password.ftl
    │       ├── login-otp.ftl
    │       └── login-update-password.ftl