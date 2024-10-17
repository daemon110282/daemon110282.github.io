# Vue.JS

- [Vue.JS](#vuejs)
  - [Зачем](#зачем)
  - [Плюсы-минусы](#плюсы-минусы)
  - [Паттерны](#паттерны)
    - [Динамическая форма Dynamic Forms](#динамическая-форма-dynamic-forms)
    - [Динамическая валидация Dynamic Validation](#динамическая-валидация-dynamic-validation)
  - [Технологии](#технологии)

## Зачем

- frontend-фреймворк
  - проект Weex — кроссплатформенный UI-фреймворк native ios, android. Alibaba но сырой ещё
- использует архитектуру Model-View-ViewModel
- [SPA](/arch/style/spa.md)
- Vue 2.0 поддерживает __серверный рендеринг SSR__
	- Сервер [NodeJS](nodejs.md) + [Nuxt.js](https://dergunov.com/wiki/nuxt-js-intro)
- Паттерн управления состоянием приложения: Vuex, Pinia
- Vue концентрируется на однонаправленном потоке данных между компонентами

## Плюсы-минусы

- TypeScript слабая поддержка
- поддерживает только IE9+
- [Сравнение c React, Angular, Ember](https://ru.vuejs.org/v2/guide/comparison.html)

## Паттерны

- [SOLID](https://webdevblog.ru/kak-izbezhat-narusheniya-principov-solid-v-vue-js-prilozhenie/)
- Архитектура слои приложения
  - [1](https://frontenso.com/ru/blog/drugoi-podkhod-k-arkhitekture-frontenda)
  - [2](https://badtry.net/arkhitiektura-bolshogho-masshtabnogho-entierpraiz-prilozhieniia-na-vuejs/)
- Vue официальные [паттерны разработки для разработчиков](https://ru.vuejs.org/v2/style-guide/index.html)

### Динамическая форма Dynamic Forms

- [asigloo](https://github.com/asigloo/vue-dynamic-forms) [example](https://www.vuescript.com/dynamically-create-reactive-forms/) [demo](https://vue-dynamic-forms-demos.alvarosaburido.dev/)
- <https://rangle.io/blog/how-to-create-data-driven-user-interfaces-in-vue>
- <https://medium.com/vue-mastery/building-an-interactive-and-distraction-free-form-with-vue-bfe23907e981>

### Динамическая валидация Dynamic Validation

[Динамическая валидация](https://jasonwatmore.com/post/2020/09/30/vuejs-vuelidate-dynamic-form-example)

- [vuelidate.js](https://vuelidate-next.netlify.app/)
  - [builtin validators](https://vuelidate.js.org/#sub-builtin-validators)
  - [async validate](https://vuelidate-next.netlify.app/examples.html#asynchronous-validation) and [custom async](https://vuelidate-next.netlify.app/custom_validators.html#async-validators)
  - [dynamic validate rule](https://vuelidate-next.netlify.app/examples.html#dynamic-validation-schema)

## Технологии

- [Components, Libraries](https://github.com/vuejs/awesome-vue)
- Vite
- управления состоянием приложения
  - Pinia
  - Vuex
- Node.js
  - Nuxt.js - фреймворк для создания Vue.js веб-приложений
