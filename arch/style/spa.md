# Single Page Application (SPA) Одностраничное веб приложение

- [Single Page Application (SPA) Одностраничное веб приложение](#single-page-application-spa-одностраничное-веб-приложение)
  - [Зачем](#зачем)
  - [Плюсы и минусы](#плюсы-и-минусы)
  - [Паттерны](#паттерны)
  - [Технологии](#технологии)
  - [Reference Architecture](#reference-architecture)

## Зачем

- В приложении [требуется полнофункциональный пользовательский интерфейс](https://learn.microsoft.com/ru-ru/dotnet/architecture/modern-web-apps-azure/choose-between-traditional-web-and-single-page-apps).
![arch](https://learn.microsoft.com/ru-ru/azure/architecture/reference-architectures/serverless/_images/serverless-web-app.png)

## Плюсы и минусы

[Критерии](../arch.criteria.md)

Плюсы:

- Поддержка работы оффлайн, без подключения к Интернету и серверу
- Возможность переиспользовать код
- Скорость работы и отзывчивость приложения and use less bandwidth
- Улучшенный пользовательский опыт
- we needed to further separate out our SPA code based on function
- Well Defined API
	- If your organization does not have a strong API or SDK, you will want to start planning that out before you begin transitioning to a single page architecture. It can be helpful to involve your frontend engineers in the process of creating these APIs.
- The presentation logic resides in the client, and server transactions can be data-only, depending on your preference for data rendering. При традиционном подходе к SPA на фронтенде находится не только UI, но и __логика интерфейса__
- возможна реализация [прогрессивных веб приложений (PWA)](pwa.md)

Минусы:

- Более длительное время начальной загрузки
- Безопасность данных
- Плохая SEO-оптимизация
  - [решение](https://www.purrweb.com/ru/blog/odnostranichnye-prilozheniya-polnyj-gid-po-razrabotke/) - [SSR](../pattern/performance/ssr.md)
- Кнопка «Назад»

## Паттерны

- [4 layers SPA](https://medium.com/hackernoon/architecting-single-page-applications-b842ea633c2e)
  - View
    - Separated Presentation
    - Presentation Component
    - [Container Component](https://medium.com/@dan_abramov/smart-and-dumb-components-7ca2f9a7c7d0)
  - Application Service
  - Store
    - Состояние (vuex) клиента между браузерами, нодами backend?
    - Один клиент с разных браузеров (параллельные экземпляры) как шарится, балансируется состояние между браузерами, нодами?
  - Domain
    - Domain Service
- Define a Container / Component Structure
- [Производительность](../pattern/performance/pattern.perf.md)
  - [Web Vitals Metric](../ability/performance.md)
  - Кеширование, lazy load component UI?
  - [SSR](../pattern/performance/ssr.md) (Server Side Rendering)
  - Testing tools Selenium, Cypress and Puppeteer can also be used to measure app performance.
  - WebPageTest is an online tool that's easier to use
  - Application performance on the client side can be monitored via __Navigation Timing API__ and __Resource Timing API__
    - But these fail to capture JavaScript execution times. To address this, User Timing API can be used. LinkedIn took this approach.
- Валидация данных
  - Дублирование клиент+сервер из за уязвимости браузера? Разные языки двойная кодовая база?
  - Бизнес правила
    - с сервера обновления?
- Сквозная функциональность
  - [Локализация](../pattern/system.design/i18n.md)
	- Безопасность
  	- Критичная логика на сервере, риски взлома на клиенте.
  	- [Auth](https://docs.microsoft.com/en-us/azure/active-directory/develop/scenario-spa-overview) with [Single Sign-on](../pattern/security/sso.md) and [Identity Service (IAM)](../system.class/iam.md)
  - observability
    - [Мониторинг](../../technology/observability/monitoring.md)
    	- [Sentry](../../technology/observability/sentry.md)
    - [Логирование](../../technology/observability/logging.md)
    	- Стратегия логирования (исключений), аудита на клиенте - передача через АПИ на сервер ([Sentry](../../technology/observability/sentry.md) например)
    	- Мерж логов на сервере+с Х клиентов-браузеров 1 юзера-сеанса
    	- [Errbit SaaS (Loggly, New Relic)](https://www.sitepoint.com/logging-errors-client-side-apps/)

## Технологии

- [Vue.JS](../../technology/framework/vuejs.md)
- [React](../../technology/framework/react.md)
	- Next.js

## Reference Architecture

![spa](../../img/arch/spa/spa.jpg)
![command](../../img/arch/spa/command.jpg)
![flow](../../img/arch/spa/flow.jpg)
![module](../../img/arch/spa/module.jpg)
![model state](../../img/arch/spa/spa.state.jpg)

См ms arch

- [AWS](https://docs.aws.amazon.com/whitepapers/latest/serverless-multi-tier-architectures-api-gateway-lambda/single-page-application.HTML)
