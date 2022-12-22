# Single Page Application SPA

## Зачем

[Identity](https://docs.microsoft.com/en-us/azure/active-directory/develop/scenario-spa-overview)

![arch](https://learn.microsoft.com/ru-ru/azure/architecture/reference-architectures/serverless/_images/serverless-web-app.png)

## Плюсы и минусы

[Критерии](../arch.criteria.md)

| + | - |
| - | - |
| Скорость работы и отзывчивость приложения. | Более длительное время начальной загрузки |
| Возможность переиспользовать код. | Безопасность данных. |
| Улучшенный пользовательский опыт | Плохая SEO-оптимизация (решение SSR) |
| Поддержка работы оффлайн, без подключения к Интернету и серверу | Кнопка «Назад». |
| the presentation logic resides in the client, and server transactions can be data-only, depending on your preference for data rendering |  |

SSR (Server Side Rendering, серверный рендеринг) — способ рендеринга одностраничного приложения на стороне сервера, когда в браузер пользователя отправляется уже полностью отрисованная страница.

Если вести разработку в соответствии со [стандартами прогрессивных приложений (PWA)](https://webcase.com.ua/blog/razrabotka-odnostranichnyh-prilozhenij-spa-webcase/#f5), то открываются и другие возможности. Например – добавление значка приложения на домашний экран смартфона.
При традиционном подходе к SPA на фронтенде находится не только UI, но и логика.

## Паттерны

TODO

- Separated Presentation
- Стратегия логирования (исключений), аудита на клиенте?
	- Передача через АПИ на сервер постоянно?
	- Мерж логов на сервере+с Х клиентов-браузеров 1 юзера-сеанса
- Состояние (vuex) клиента между браузерами, нодами backend?
	- Один клиент с разных браузеров (параллельные экземпляры) как шарится, балансируется состояние между браузерами, нодами?
- Безопасность
	- ГОСТ шифр-е ПДН?
	- Критичная логика на сервере, риски взлома на клиенте.
- Бизнес правила с сервера обновления?
- Масштабирование?
- Кеширование, lazy load component UI?
- Валидация - дублирование клиент+сервер из за уязвимости браузера? Разные языки двойная кодовая база?
- Сквозная аутентификация: [Single Sign-on](../sso.md), [Identity Service](../system.class/iam.md)
- Мониторинг
	- [Sematext](https://sematext.com/blog/tracking-and-monitoring-spa-apps/)
	- [Raygun](https://raygun.com/blog/spa-performance/)
	- Sentry
	- [Rollbar](https://rollbar.com/blog/error-tracking-with-vue-js/)
- Логирование
	[Errbit SaaS (Loggly, New Relic)](https://www.sitepoint.com/logging-errors-client-side-apps/)

См ms arch

https://www.purrweb.com/ru/blog/odnostranichnye-prilozheniya-polnyj-gid-po-razrabotke/

## Технологии

- [Vue.JS](../../technology/framework/vuejs.md)
- React

## Reference Architecture

- [AWS](https://docs.aws.amazon.com/whitepapers/latest/serverless-multi-tier-architectures-api-gateway-lambda/single-page-application.HTML)
- https://medium.com/hackernoon/architecting-single-page-applications-b842ea633c2e
- [Azure SPA](https://learn.microsoft.com/ru-ru/azure/architecture/reference-architectures/serverless/web-app)
