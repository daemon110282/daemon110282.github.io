# Single Page Application SPA

Поюс
Скорость работы и отзывчивость приложения.
Возможность переиспользовать код.
Улучшенный пользовательский опыт
поддержка работы оффлайн, без подключения к Интернету и серверу;

the presentation logic resides in the client, and server transactions can be data-only, depending on your preference for data rendering.

Мин
Плохая SEO-оптимизация.
.   минимизации - SSR (Server Side Rendering, серверный рендеринг) — способ рендеринга одностраничного приложения на стороне сервера, когда в браузер пользователя отправляется уже полностью отрисованная страница

Более длительное время начальной загрузки.
Кнопка «Назад».
Безопасность данных.

https://www.purrweb.com/ru/blog/odnostranichnye-prilozheniya-polnyj-gid-po-razrabotke/

если вести разработку в соответствии со стандартами прогрессивных приложений, то открываются и другие возможности. Например – добавление значка приложения на домашний экран смартфона

При традиционном подходе к SPA на фронтенде находится не только UI, но и логика

https://webcase.com.ua/blog/razrabotka-odnostranichnyh-prilozhenij-spa-webcase/#f5


Критичная логика на сервере, риски взлома на клиенте.
Бизнес правила с сервера обновления?
См ms arch

Один клиент с разных браузеров как шарится балансируется состояние vuex между браузерами, нодами?


Reference
https://docs.aws.amazon.com/whitepapers/latest/serverless-multi-tier-architectures-api-gateway-lambda/single-page-application.HTML


https://medium.com/hackernoon/architecting-single-page-applications-b842ea633c2e


TODO
- Стратегия логирования (исключений), аудита на клиенте? 
	- Передача через АПИ на сервер постоянно?
	- Мерж логов на сервере
- Состояние клиента между браузерами, нодами backend?
