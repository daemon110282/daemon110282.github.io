# Flutter

![Alt text](../../img/technology/mobile/flutter.jpg)

TODO

- Сдо ве - Composer фасад данных из бэк ИС компании
- api gateway BFF для ЛК, мп
- Native
  - Kotlin native
- Flutter+dart google+blos/redux 2018 start 12.2018 release
  - Можно писать нативные части, но нужны нативные разработчики
  - Beta web, desktop
  - Производительность, анимации плюс
  - Unit, widget tests
  - Проблемы: камера, шифрование aes gsm, документация мало/китайский, мало разработчиков 2019
  - Debug hot reload
  - Ui, Unit tests
  - Используют: АлиЭкспресс, Яндекс.такси, creatio
- Проблемы локализации

## Плюсы-Минусы

- Плюсы
  - Open Source
  - Простое обучение и развитие
  - Быстрая компиляция: максимум производительности
  - Приложения работают быстро
  - Кросплатформенность
  - Приложения выглядят нативно
  - Легко интегрировать с Google Services
  - Крутые инструменты
  - Удобный Debug and Profiling
- Минусы
  - Молодость проекта
  - Библиотек меньше
  - Необходимость изучать
  - Поддержка для WEB и DeskTop BETA
  - Нужен достаточно мощный ПК

## Архитектура

- Mvc - вариант
  - Stream не использовал?
- Mvvm не вариант
  - Binding view-viewmodel
  - Ui тред ухудшился
- Flux не вариант
  - +Stream
  - Dispatcher один, сложно расширять, несколько команд
- Stream/ bloc - типа mvc без controller - вариант
  - Лучший вариант https://youtu.be/rta3850mv4A