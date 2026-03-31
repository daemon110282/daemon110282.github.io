# Mobile Мобильные приложения

- [Mobile Мобильные приложения](#mobile-мобильные-приложения)
	- [Зачем](#зачем)
	- [Плюсы-минусы](#плюсы-минусы)
	- [Паттерны](#паттерны)
		- [IOS](#ios)
	- [Технологии](#технологии)
		- [Deeplink](#deeplink)
	- [TODO](#todo)

## Зачем

## Плюсы-минусы

## Паттерны

Влияет на архитектуру:

- тип мобильной платформы
- тип устройства
- скорость интернет-соединения
- потенциальные характеристики мобильного гаджета — нагрузка на процессор, размер и разрешение экрана

Основные типы приложений:

- нативные приложения: Swift, Kotlin
- гибридные приложения: ionic, cordova, flutter
- мобильные веб-приложения: PWA, SPA/MPA - multi page app

### IOS

- [MVC, MVP, MVVM, VIPER](https://github.com/puncsky/system-design-and-architecture/blob/master/en/123-ios-architecture-patterns-revisited.md)

## Технологии

[Тренды Google](https://trends.google.ru/trends/explore?q=flutter,xamarin,cordova,kotlin,react%20native)

- Native
  - IOS (Swift или Objective-C)
  - Android (Kotlin, Java)
- [PWA](../style/pwa.md)
	- [Ionic](../../technology/mobile/ionic.md)
	- Vue JS
- Cross Platform
	- [Flutter](../../technology/mobile/flutter.md)
	- [Ionic](../../technology/mobile/ionic.md)
	- [React Native](../../technology/mobile/react.native.md)
	- [Kotlin multiplatform](https://kotlinlang.org/docs/multiplatform.html)
		- <https://habr.com/ru/companies/otus/articles/751192/>

### Deeplink

Например deeplink =<https://lk/products/forwards/170?qr=true>
Если добавить ?qr=true диплинки в МП тоже надо "кодить"?

Такой алгоритм как вариант:

1. Пользователь сканирует QR‑код (через камеру или приложение)
2. Устройство распознаёт URL в коде
3. Браузер/система открывает ссылку
4. ЛК-BE определяет ОС по UserAgent и перенаправляет
   1. на App Store (для iOS)
   2. на Google Play (для Android)
5. Пользователь видит страницу приложения в магазине и может нажать «Установить»

## TODO

Тренды
<https://insights.stackoverflow.com/survey/2019>
<https://trends.google.ru/trends/explore?q=flutter,xamarin,cordova,kotlin,react%20native>

<https://habr.com/ru/post/491926/> Кроссплатформенная разработка 2020
<https://tproger.ru/articles/creating-an-app-for-kotlin-multiplatform/> Kotlin 2020
