# Spec-Kit Кастомизация

[Мануал](https://github.github.com/spec-kit/how-to/customization.html)

## Project-local overrides and resolution

- Рекомендуется использовать для кастомизации команд Spec-Kit в рамках конкретного проекта.
- Лучше использовать [Preset](#preset) для кастомизации команд Spec-Kit, если кастомизация должна быть доступна в нескольких проектах.
- [ ] .specify/templates/overrides/

Проверить, как работает кастомизация:

```text
specify artifact info template:spec-template --json
specify preset resolve spec-template  
```

## Extension

- Добавление новых возможностей в Spec-Kit через расширения (extensions) позволяет кастомизировать процесс разработки и документации, добавляя специфические для проекта функции и автоматизации.

```text
specify extension search tracer
specify extension list
specify extension add {name}
```

TODO:

- [x] DEPRECATED [spec-kit-tracer](https://github.com/haveard/spec-kit-tracer)
- [ ] [speckit-grill-me](https://github.com/yoshi1220/speckit-grill-me)
- [ ] [spec-kit-changelog](https://github.com/Quratulain-bilal/spec-kit-changelog)
- [ ] [spec-kit-markitdown](https://github.com/BenBtg/spec-kit-markitdown)
- [ ] [spec-kit-analytics](https://github.com/Fyloss/spec-kit-analytics)

## Preset

- Изменение существующих команд Spec-Kit через preset позволяет адаптировать стандартные команды под специфические требования проекта, изменяя их поведение и вывод.
- Можно вынести в отдельный каталог и раздавать независимо от репозитория.
- После обновления самого Spec Kit кастомизированные команды могут оказаться несовместимы с новой версией.
- Дополнительно потребуется поддерживать инфраструктуру для хранения и доставки preset.
- [Comunity catalog](https://github.com/github/spec-kit/blob/main/presets/catalog.community.json)

```text
specify preset list
specify preset search {name}
specify preset add {name}
```

TODO:

- [ ] [Трассировка спецификаций, тестов и кода в разработке с использованием AI](https://www.glukhov.org/ru/app-architecture/testing-architecture/specs-tests-code-traceability-ai-development/)
  - [x] [spec-kit-preset-test-first-governance](https://github.com/ka-zo/spec-kit-preset-test-first-governance)
- [ ] Table of Contents Navigation (toc-navigation) v1.0.0
- [ ] iSAQB Architecture Governance (isaqb-architecture-governance) v0.2.5
- [ ] Jira Issue Tracking (jira) v1.0.0
- [ ] Security Governance (security-governance) v0.7.4

## Workflow

TODO:
