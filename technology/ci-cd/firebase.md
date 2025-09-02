# Firebase

- [Firebase](#firebase)
  - [Зачем](#зачем)
  - [Функции](#функции)
  - [Плюсы-минусы](#плюсы-минусы)
    - [Проект](#проект)

## Зачем

Платформа сборки и хостинга приложений, релиза мобильных приложений в Store - PaaS-решение без [хлопот по управлению базовой инфраструктурой](https://stfalcon.com/ru/blog/post/hosting-options-for-your-flutter-web-app).

Альтернативы:

- Heroku
  - удобен для пользователя благодаря простым процессам развертывания и позволяет выполнять простое развертывание непосредственно из вашего репозитория git
  - вариант для стартапов и предприятий, которые хотят сосредоточиться на разработке, не беспокоясь об управлении серверами
- Google App Engine
  - обеспечивает простое масштабирование, управление версиями и полностью управляемую среду
  - хороший вариант для разработчиков, которые предпочитают оставаться в экосистеме Google

## Функции

- Управление и настройка Management
  - [Console](https://console.firebase.google.com/)
  - [API REST](https://firebase.google.com/docs/reference/firebase-management/rest)
  - [CLI](https://firebase.google.com/docs/cli)
- [Проект](#проект) [Project](https://firebase.google.com/docs/projects/learn-more)
  - Приложения App (веб, Android, IOS, Unity, c++, Flutter)
  - Базируется на Проекте [Google Cloud](google.cloud.md) - Виртуальный контейнер для данных, кода, конфигурации и сервисов
например
  - Google Cloud Logging
- Продукты Products
  - [Build](https://firebase.google.com/products-build)
    - App Hosting
    - Hosting
    - App Check
    - Cloud Firestore
    - Realtime Database
    - Cloud Storage
    - Functions
    - ML
  - [Run](https://firebase.google.com/products-run)
    - A/B Testing
    - Crashlytics (SDK)
    - Release Monitoring
    - Performance Monitoring (SDK)
    - Remote Config
    - App Distribution
- Google Analytics
- Встроенный CDN и SSL
- [Firebase Cloud Messaging](fcm.md) (FCM)

## Плюсы-минусы

Минусы:

- vendor lock Google

### Проект

- Под __разные контура__ (Prod, Staging, Test, Development, Demo..) - __отдельные проекты__, [чтобы ресурсы не шарились](https://firebase.google.com/docs/projects/dev-workflows/overview-environments?hl=ru) между [Prod, Test версией](https://firebase.google.com/docs/projects/multiprojects?hl=ru)
- __Исключить multi-tenancy__ в одном проекте, каждое __ЮЛ - отдельный проект__ со своими ресурсами
