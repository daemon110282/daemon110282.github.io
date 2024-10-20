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
  - [builtin validators](https://ajv.js.org/guide/formats.html)
  - [async validate](https://ajv.js.org/guide/async-validation.html)
  - [dynamic validate rule](t)
  - [Errors i18n](https://github.com/ajv-validator/ajv-i18n)

### Динамическая форма Dynamic Forms

- from Json Schema
  - [react-jsonschema-form](https://rjsf-team.github.io/react-jsonschema-form/)
    - [функции](https://github.com/rjsf-team/react-jsonschema-form)
      - [themes](https://rjsf-team.github.io/react-jsonschema-form/docs/usage/themes/)
    - [docs](https://rjsf-team.github.io/react-jsonschema-form/docs/)
    - [обучение](https://habr.com/ru/companies/otus/articles/829326/)
    - version
      - v5
        - validation use [AJV v8](https://rjsf-team.github.io/react-jsonschema-form/docs/usage/validation)
          - Live\Submit
  - [fform](https://habr.com/ru/articles/466179/)
  - Json Schema [Form Constructor](https://wtnm.github.io/fform-constructor/index.html)
- [react-hook-form](https://react-hook-form.com/)
	- [example v7](https://github.com/react-hook-form/react-hook-form/tree/master/examples)
	- отдельная библиотека from [Json Schema](https://github.com/vtex/react-hook-form-jsonschema)
  	- много ограничений по [поддержке Json Schema](https://github.com/vtex/react-hook-form-jsonschema?tab=readme-ov-file#supported-json-schema-keywords)
- [Formik](https://reactjsexample.com/example-for-a-lightweight-react-json-form-builder/)
- [варианты](https://questu.ru/articles/332266/)
  - jsonforms.io
  - [react-schema-form](https://github.com/networknt/react-schema-form)
