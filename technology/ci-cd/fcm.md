# Firebase Cloud Messaging (FCM)

Настройка МП:

- Добавить [Firebase в МП](https://firebase.google.com/docs/android/setup?hl=ru)
  - Создайте проект Firebase
  - Зарегистрируйте свое приложение в Firebase
  - Добавьте [файл конфигурации Firebase](https://firebase.google.com/docs/projects/learn-more?hl=ru#config-files-objects)
    - Android google-services.json
    - IOS GoogleService-Info.plist
  - Добавьте Firebase SDK в свое приложение
- При первом запуске вашего приложения пакет SDK FCM создает токен регистрации для экземпляра клиентского приложения
- Сохранить токен и временную метку на бэке МП
- [Каналы уведомлений](https://firebase.google.com/docs/cloud-messaging/android/client?hl=ru) настроить
- [Test send from Firebase console](https://github.com/firebase/quickstart-android/tree/master/messaging)