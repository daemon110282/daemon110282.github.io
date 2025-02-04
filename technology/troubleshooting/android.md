# Troubleshooting Android

- [Troubleshooting Android](#troubleshooting-android)
  - [Зачем](#зачем)
  - [Варианты](#варианты)

## Зачем

Решение задач [Troubleshooting](../troubleshooting.md).

## Варианты

- [Android Remote Debugger](https://habr.com/ru/articles/488514/) __через Браузер__ просмотр: Logs, Database, Network, SharedPreferences
- Эмулятор Android на ПК
  - [x86](https://www.android-x86.org/installhowto.html)
- Анализ трафика
  - подключить приложение к прокси
    - free community [burp](https://portswigger.net/burp/communitydownload)
    - free trial [charles](https://www.charlesproxy.com/)
    - [proxyman](https://docs.proxyman.io/debug-devices/android-device)
    - [postman](https://learning.postman.com/docs/sending-requests/capturing-request-data/capturing-https-traffic/)
  - установить на телефон пользовательский сертификат сниффера
    - дать разрешение использования [пользовательских сертификатов для отладочных сборок](https://www.performance-lab.ru/blog/traffik-mobilnogo-prilozheniya) начиная с версии Android 7 (API 24)
  - включить чтение SSL-прокси
