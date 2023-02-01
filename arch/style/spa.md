# Single Page Application (SPA) Одностраничное веб приложение

- [Single Page Application (SPA) Одностраничное веб приложение](#single-page-application-spa-одностраничное-веб-приложение)
	- [Зачем](#зачем)
	- [Плюсы и минусы](#плюсы-и-минусы)
	- [Паттерны](#паттерны)
		- [SSR (Server Side Rendering, серверный рендеринг)](#ssr-server-side-rendering-серверный-рендеринг)
	- [Технологии](#технологии)
	- [Reference Architecture](#reference-architecture)

## Зачем

- В приложении [требуется полнофункциональный пользовательский интерфейс](https://learn.microsoft.com/ru-ru/dotnet/architecture/modern-web-apps-azure/choose-between-traditional-web-and-single-page-apps).
![arch](https://learn.microsoft.com/ru-ru/azure/architecture/reference-architectures/serverless/_images/serverless-web-app.png)

## Плюсы и минусы

[Критерии](../arch.criteria.md)

| + | - |
| - | - |
| Скорость работы и отзывчивость приложения. | Более длительное время начальной загрузки |
| Возможность переиспользовать код. | Безопасность данных. |
| Улучшенный пользовательский опыт | [Плохая SEO-оптимизация (решение SSR)](https://www.purrweb.com/ru/blog/odnostranichnye-prilozheniya-polnyj-gid-po-razrabotke/) |
| Поддержка работы оффлайн, без подключения к Интернету и серверу | Кнопка «Назад». |
| The presentation logic resides in the client, and server transactions can be data-only, depending on your preference for data rendering. При традиционном подходе к SPA на фронтенде находится не только UI, но и __логика интерфейса__. |  |

Если вести разработку в соответствии со [стандартами прогрессивных приложений (PWA)](https://webcase.com.ua/blog/razrabotka-odnostranichnyh-prilozhenij-spa-webcase/#f5), то открываются и другие возможности. Например – добавление значка приложения на домашний экран смартфона.

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
- [Производительность](../pattern/pattern.perf.md)
  - Web Vitals Metric
  - Кеширование, lazy load component UI?
- Валидация данных
  - Дублирование клиент+сервер из за уязвимости браузера? Разные языки двойная кодовая база?
  - Бизнес правила
    - с сервера обновления?
- Сквозная функциональность
  - Безопасность
	- Критичная логика на сервере, риски взлома на клиенте.
    - [Auth](https://docs.microsoft.com/en-us/azure/active-directory/develop/scenario-spa-overview) with [Single Sign-on](../sso.md) and [Identity Service (IAM)](../system.class/iam.md)
  - [Мониторинг](../../technology/monitoring.md)
  	- [Sentry](../../technology/observability/sentry.md)
  - [Логирование](../../technology/logging.md)
  	- Стратегия логирования (исключений), аудита на клиенте - передача через АПИ на сервер ([Sentry](../../technology/observability/sentry.md) например)
  	- Мерж логов на сервере+с Х клиентов-браузеров 1 юзера-сеанса
  	- [Errbit SaaS (Loggly, New Relic)](https://www.sitepoint.com/logging-errors-client-side-apps/)
- Локализация - текстов сообщений (resource) с бэка
	- vue-i18n готовое решение для локализации (понятно у нас пока RU) с шаблонами, placeholder и тд. Его планируется использовать на фронте или иное решение типовое?
	https://cli.vuejs.org/ru/dev-guide/ui-localization.html
	https://vue-i18n.intlify.dev/
	https://github.com/intlify/vue-i18n-next
	https://phrase.com/blog/posts/ultimate-guide-to-vue-localization-with-vue-i18n/
	https://vue-i18n.intlify.dev/guide/advanced/lazy.html есть подгрузка динамически для компонентов локализаций
	- есть HTML в шаблоне локализации, но это добавляет рисков безопасности еще
	https://vue-i18n.intlify.dev/guide/essentials/syntax.html#html-message
	Останется только:
	1. на бэке по БД формировать json в нужном формате, которые примет vue-i18n 
	2. или же вообще вынести эту функцию из КК, например, https://www.codeandweb.com/babeledit

### SSR (Server Side Rendering, серверный рендеринг)

способ рендеринга одностраничного приложения на стороне сервера, когда в браузер пользователя отправляется уже полностью отрисованная страница.

## Технологии

- [Vue.JS](../../technology/framework/vuejs.md)
- React

## Reference Architecture

См ms arch

- [AWS](https://docs.aws.amazon.com/whitepapers/latest/serverless-multi-tier-architectures-api-gateway-lambda/single-page-application.HTML)
- [Azure SPA](https://learn.microsoft.com/ru-ru/azure/architecture/reference-architectures/serverless/web-app)
