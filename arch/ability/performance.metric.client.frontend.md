# Client Metrics: Приложение front-end

## Зачем

Вид [метрик производительности](performance.metric.md).

- Google [Web Vitals](https://web.dev/i18n/en/vitals/)
  - [Core](https://timeweb.com/ru/community/articles/core-web-vitals) __75-й процентиль__
    - [LCP](https://habr.com/ru/companies/vk/articles/577792/) - насколько быстро происходит скорость загрузки страницы - <2.5-4c
    - FID - как быстро происходит взаимодействие с сайтом - <1-3c
    - CLS - корректно ли работают в совокупности все элементы - <0.1-0.25
  - [Дополнительно](https://web.dev/vitals/#drugie-pokazateli-web-vitals)
    - Time to First Byte (TTFB) - Время до первого байта
    - First Contentful Paint (FCP) - Первая отрисовка контента
    - Total Blocking Time (TBT) - Общее время блокировки
    - Time to Interactive (TTI) - Время до интерактивности
  - Иснтрументы
    - [pagespeed](https://pagespeed.web.dev/)
    - gtmetrix.com
    - [lighthouse](https://developer.chrome.com/docs/lighthouse/overview/)
- Yandex [ИКС](https://kokoc.com/terminy/chto-takoe-iks-sajta-v-yandekse/)
  - Учитывает Web Vitals
- Navigation timing API
  - Метрики: DNS, transfer time, response time, TCP
