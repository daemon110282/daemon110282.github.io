# React JS

- [React JS](#react-js)
	- [Зачем](#зачем)
	- [Плюсы-минусы](#плюсы-минусы)
	- [Паттерны](#паттерны)
		- [Динамическая валидация Dynamic Validation](#динамическая-валидация-dynamic-validation)
		- [Динамическая форма Dynamic Forms](#динамическая-форма-dynamic-forms)

## Зачем

- frontend веб-фреймворк
- [vs React Native](../mobile/react.native.md#vs-react)

## Плюсы-минусы

## Паттерны

### Динамическая валидация Dynamic Validation

- [AJV](https://ajv.js.org/) (Another JSON Schema Validator)
  - библиотека валидации данных в __формате JSON__ с поддержкой [__JSON Schema__](../../api/jsonschema.md)
  - AJV позволяет проверять данные по подготовленным схемам валидации
  - schema language
    - [JSON Type Definition](https://ajv.js.org/guide/schema-language.html#json-type-definition)
    - [JSON Schema](https://ajv.js.org/guide/schema-language.html#json-schema)
  - version
    - v8
      - specifically formatted messages
    - v6
  - [builtin validators]()
  - [async validate](https://ajv.js.org/guide/async-validation.html) 
  - and [custom async](t)
  - [dynamic validate rule](t)

### Динамическая форма Dynamic Forms

- [react-jsonschema-form](https://rjsf-team.github.io/react-jsonschema-form/)
  - [](https://github.com/rjsf-team/react-jsonschema-form)
    - [themes](https://rjsf-team.github.io/react-jsonschema-form/docs/usage/themes/)
  - [docs](https://rjsf-team.github.io/react-jsonschema-form/docs/)
  - [обучение](https://habr.com/ru/companies/otus/articles/829326/)
  - version
    - v5
      - validation use [AJV v8](https://rjsf-team.github.io/react-jsonschema-form/docs/usage/validation)
        - Live\Submit
- [react-hook-form](https://react-hook-form.com/)
	- [example v7](https://github.com/react-hook-form/react-hook-form/tree/master/examples)

TODO
  - [asigloo](https://github.com/asigloo/vue-dynamic-forms) [example](https://www.vuescript.com/dynamically-create-reactive-forms/) [demo](https://vue-dynamic-forms-demos.alvarosaburido.dev/)
  - <https://rangle.io/blog/how-to-create-data-driven-user-interfaces-in-vue>
  - <https://medium.com/vue-mastery/building-an-interactive-and-distraction-free-form-with-vue-bfe23907e981>
