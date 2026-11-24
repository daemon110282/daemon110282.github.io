# Spec-Kit

- [Spec-Kit](#spec-kit)
  - [Зачем](#зачем)
  - [Процесс](#процесс)
    - [0. Init](#0-init)
      - [0.1. Add customization](#01-add-customization)
      - [0.2. Update](#02-update)
    - [1. Constitution - Конституция, стандарты, принципы](#1-constitution---конституция-стандарты-принципы)
    - [2. Бизнес требования](#2-бизнес-требования)
      - [2.1. Grilling Сбор бизнес требований](#21-grilling-сбор-бизнес-требований)
      - [2.2. Specify](#22-specify)
    - [3 Уточнение бизнес требований](#3-уточнение-бизнес-требований)
      - [3.1 Clarify](#31-clarify)
      - [3.2 Альтернатива Clarify - grill.with-docs](#32-альтернатива-clarify---grillwith-docs)
    - [4. Plan - Технический план](#4-plan---технический-план)
    - [5. Checklist - Чек-листы качества](#5-checklist---чек-листы-качества)
    - [6. Tasks - Задачи на разработку](#6-tasks---задачи-на-разработку)
    - [7. Analyze - Проверка согласованности](#7-analyze---проверка-согласованности)
    - [8. Implement - Разработка](#8-implement---разработка)
      - [8.1. ChangeLog](#81-changelog)
    - [9. Converge - Проверить полноту реализации](#9-converge---проверить-полноту-реализации)
    - [10. Release](#10-release)

## Зачем

[Spec-Kit](https://github.github.com/spec-kit/) реализация фреймворка [SDD](../sdd.md) (Spec-Driven Documentation) для разработки технической документации в репозитории, подход __docs-as-code__ без изменения технологического стека разработки.

[Кастомизация Spec-Kit](spec-kit.custom.md).

## Процесс

- [Мануал](https://github.github.com/spec-kit/quickstart.html)
- [Синтаксис команд](https://github.github.com/spec-kit/reference/agentic-sdd.html)
- [Flow](https://www.youtube.com/watch?v=rCdqRETmYFw):

### 0. Init

[Init](https://github.github.com/spec-kit/installation.html) project.
Запускается один раз в проекте, чтобы создать структуру каталогов под LLM и базовые файлы для SDD:

- Copilot
- [Codex CLI](https://github.com/github/spec-kit/blob/main/docs/integrations/codex.md)

```powershell
specify init .
specify init . --integration codex
specify init taskify --integration copilot
specify init . --integration copilot
```

#### 0.1. Add customization

Добавить набор Preset, Extension по [кастомизация Spec-Kit](spec-kit.custom.md)

#### 0.2. Update

[Guide](https://github.github.com/spec-kit/upgrade.html)

```powershell
specify self check
```

### 1. Constitution - Конституция, стандарты, принципы

Для __существующих проектов__ — дайте команду проанализировать существующую кодовую базу:

```powershell
/speckit.constitution
Проанализируй текущий код и создай constitution на его основе.
```

Пример:

```powershell
/speckit-constitution Taskify is a "Security-First" application. All user inputs must be validated. We use a microservices architecture. Code must be fully documented.
```

```powershell
/speckit-constitution {Название проекта}
Создай конституцию проекта на основе следующих принципов:
- Specification-First Development
- API-First
- Security by Design
- Architecture Consistency
- Requirements Traceability
- Testability
- Simplicity

Используй нормативные формулировки MUST, SHOULD, MAY.
Конституция должна применяться ко всем спецификациям проекта.
```

Best practices:

- Используйте ChatGPT для генерации первого драфта constitution
- В репозитории SpecKit есть примеры — берите за основу и адаптируйте под свой проект
- Если в компании есть coding standards — превратите их в constitution один раз, используйте во всех проектах
- [Что включать в Constitution](spec-kit.constitution.md)

### 2. Бизнес требования

#### 2.1. Grilling Сбор бизнес требований

[Matt Pocock Skills](https://www.aihero.dev/skills)

- mattpocock/skills@grill-with-docs см. "AI learn"

#### 2.2. Specify

Результат: specs/001-feature-name/spec.md

Пример:

```powershell
/speckit-specify Develop Taskify, a team productivity platform where predefined users create projects, assign tasks, comment, and move tasks across Kanban columns (To Do, In Progress, In Review, Done). Five users (one product manager, four engineers), three sample projects, no login for this first phase.
```

Best practices:

- Используйте "ДОЛЖНА/МОЖЕТ/НЕ ДОЛЖНА"
- Разделяйте MVP и будущие фичи
- User Story Mapping
- Используйте ChatGPT для первого драфта

Custom Preset:

- [test-first-governance](spec-kit.custom.md#test-first-governance---bdd-atdd-tdd-traceability-us-fr-tc-quality-gate) BDD, ATDD добавляет:
  - BDD требуется для поведения, видимого пользователю, и бизнес-правил.
  - ATDD требуется для критериев приемки заинтересованными сторонами и границ релиза.
  - Работа, связанная только с __техническими аспектами__, может быть отмечена как __N/A__ с обоснованием и альтернативными доказательствами
    - Укажите, какие истории, требования или критерии успеха являются __Required или N/A__, и объясните каждый N/A.
    - пример промта "Mark BDD N/A for this internal refactor because there is no user-visible behavior; use TDD and coverage evidence instead."

### 3 Уточнение бизнес требований

#### 3.1 Clarify

- Интервью с умным коллегой
- Запускайте clarify после больших изменений spec.md, чтобы убедиться, что требования согласованы и не противоречат друг другу.

```powershell
/speckit.clarify
```

#### 3.2 Альтернатива Clarify - grill.with-docs

Установить Custom Extension [SpecKit Grill Me](spec-kit.custom.md#speckit-grill-me---grilling-в-формате-spec-kit)

```powershell
$speckit.grill.me OR $speckit.grill.with-docs
```

[ ] Синхронизировать tfs.md с учетом grill

### 4. Plan - Технический план

Пример:

```powershell
/speckit.plan

Backend: Python FastAPI + TypeScript
Frontend: Vue.js 3
UI: Tailwind CSS + shadcn-vue
Редактор: Markdown редактор с live preview
Telegram: python-telegram-bot
База данных: PostgreSQL
Кэш: Redis для очереди публикаций
Деплой: Docker
```

```powershell
/speckit.plan
Arhitecture: DDD, feature toggle
Security: OAuth, Bearer Token
Observability: OpenTelemetry, GrayLog, Grafana
Backend: ABP.IO, .NET, DI
Frontend: React
UI: Tailwind CSS + shadcn/ui
База данных: PostgreSQL
Кэш: Redis
Деплой: Docker
```

Best practices:

- Каждое изменение стека/архитектуры → обновление plan.md
- Запросите альтернативы для ключевых решений
- Используйте ChatGPT для review плана

```text
Вот технический план проекта: [вставляете plan.md]

Проанализируй:
1. Есть ли переусложнения?
2. Где могут быть bottleneck'и?
3. Какие риски ты видишь?
4. Что можно упростить для MVP?
```

Preset:

- [test-first-governance](spec-kit.custom.md#test-first-governance---bdd-atdd-tdd-traceability-us-fr-tc-quality-gate) добавляет:
  - TDD
  - Инструменты для тестирования и контроля качества
  - Политика покрытия и пороговых значений
  - Трассировка спецификаций, тестов и кода: test-traceability.md
  - Сохранение доказательств и отчетов: defect-log.md, test-summary.md

### 5. Checklist - Чек-листы качества

- Аудит по стандартам качества

```powershell
/speckit.checklist [тема]
```

Доступные темы:

/speckit.checklist UX
/speckit.checklist Security
/speckit.checklist Performance
/speckit.checklist Accessibility
/speckit.checklist SEO
/speckit.checklist Testing

Любая кастомная тема:

/speckit.checklist Mobile-First Design
/speckit.checklist Data Privacy GDPR
/speckit.checklist API Design Best Practices

### 6. Tasks - Задачи на разработку

Best practices:

- Если изменили подход — обновите соответствующие задачи
  - Добавляйте новые задачи, если появились
  - Помечайте выполненные задачи как DONE
- Разбивайте сложные задачи

### 7. Analyze - Проверка согласованности

- AI-аудит всех созданных документов. Как опытный тимлид, который ревьюит ваш проект перед стартом разработки
- Найдёт проблемы, конфликты и несоответствия во всех созданных спецификациях
  - Конфликты между требованиями
  - Несоответствия между spec и plan
  - Технические невозможности
  - Упущенные edge cases
  - Нереалистичные оценки
  - Противоречия в dependencies

Best practices:

- Запускайте analyze минимум 2 раза
- Ошибка: Исправлять проблемы "на глаз", не обновляя документы: spec/plan/tasks

### 8. Implement - Разработка

Best practices:

- Запускать
  - по фазам (рекомендуется): /speckit.implement Phase 1
  - Конкретные задачи: /speckit.implement T001, T002, T003
- Одна фаза = одна сессия чата. Workflow:
  - Новая сессия чата
  - /speckit.implement Phase 1
  - Ждёте завершения
  - Тестируете результат
  - Коммитите
  - Закрываете сессию (/clear)
  - Новая сессия → /speckit.implement Phase 2
  
Custom Preset:

- [test-first-governance](spec-kit.custom.md#test-first-governance---bdd-atdd-tdd-traceability-us-fr-tc-quality-gate) добавляет:
  - TDD
  - Инструменты для тестирования и контроля качества
  - Политика покрытия и пороговых значений
  - Сохранение доказательств и отчетов: test-traceability.md, defect-log.md, test-summary.md

#### 8.1. ChangeLog

Custom Extension [spec-kit-changelog](https://github.com/Quratulain-bilal/spec-kit-changelog)

```powershell
/speckit.changelog.generate             ← "What changed overall?"
/speckit.changelog.release              ← "What's in this release?"
/speckit.changelog.diff                 ← "What's different from v1?"
/speckit.changelog.notify               ← "Tell the team"
```

### 9. Converge - Проверить полноту реализации

/speckit-converge

Preset:

- [test-first-governance](spec-kit.custom.md#test-first-governance---bdd-atdd-tdd-traceability-us-fr-tc-quality-gate) добавляет:
  - Cводка по тестированию
    - Если идентификатор релиза не указан, по умолчанию используется __rolling и записывается reports/test-summary.md__
    - В режиме релиза записывается __reports/releases/<release-id>/test-summary.md__
      - пример промта: "Overall Test Summary Destination: release. Release ID: v1.3.0. Output path: reports/releases/v1.3.0/test-summary.md."
  - Дополнительные общие отчеты
    - пример промта: "Customer contract requires an overall defect report; generate it from feature defect logs and link it from the overall test summary."

### 10. Release

1.Назначить версию и дату: например, 0.1.0 и фактическую дату выпуска.

Установить skill "spec-kit-changelog"

```text
$spec-kit-changelog Обнови CHANGELOG.md выпуска версии 1.0.0 с датой 2026-11-24 от пустого дерева до HEAD
```

2.Оформить CHANGELOG.md: перенести подтверждённые изменения из Unreleased в секцию версии.
3.Зафиксировать релизный commit и тег: тег должен указывать на проверенный снимок вместе с документацией выпуска.

```powershell
git add CHANGELOG.md
git commit -m "docs: prepare release 1.0.0"
git tag -a v1.0.0 -m "Release 1.0.0"
```

4.Собрать и опубликовать артефакты: для калькулятора — выбранный вариант .NET-поставки; при использовании GitHub Releases приложить сборку и release notes.
