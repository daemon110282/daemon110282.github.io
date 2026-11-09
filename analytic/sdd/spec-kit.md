# Spec-Kit

- [Spec-Kit](#spec-kit)
	- [Зачем](#зачем)
	- [TODO](#todo)
	- [Процесс](#процесс)
		- [0. Init](#0-init)
		- [1. Constitution - Конституция, стандарты, принципы](#1-constitution---конституция-стандарты-принципы)
		- [2. Specify - Бизнес требования](#2-specify---бизнес-требования)
		- [3. Clarify - Уточнение бизнес требований](#3-clarify---уточнение-бизнес-требований)
		- [4. Checklist - Чек-листы качества](#4-checklist---чек-листы-качества)
		- [5. Plan - Технический план](#5-plan---технический-план)
		- [6. Tasks - Задачи на разработку](#6-tasks---задачи-на-разработку)
		- [7. Analyze - Проверка согласованности](#7-analyze---проверка-согласованности)
		- [?. Trace - Трассировка спецификаций, тестов и кода](#-trace---трассировка-спецификаций-тестов-и-кода)
		- [8. Implement - Разработка](#8-implement---разработка)
		- [9. Converge - Проверить полноту реализации](#9-converge---проверить-полноту-реализации)

## Зачем

[Spec-Kit](https://github.github.com/spec-kit/) реализация фреймворка [SDD](sdd.md) (Spec-Driven Documentation) для разработки технической документации в репозитории, подход __docs-as-code__ без изменения технологического стека разработки.

[Кастомизация Spec-Kit](spec-kit.custom.md).

## TODO

- [ ] Тест
  - [x] [проект](https://github.github.com/spec-kit/quickstart.html)
  - [x] [мануал](https://habr.com/ru/articles/964368/)
- [ ] Кастом

## Процесс

[Синтаксис команд](https://github.github.com/spec-kit/reference/agentic-sdd.html)

[Flow](https://www.youtube.com/watch?v=rCdqRETmYFw):

### 0. Init

[Init](https://github.github.com/spec-kit/quickstart.html#install-specify) project
Запускается один раз в проекте

```test
specify init taskify --integration copilot
specify init . --integration copilot
specify init . --integration copilot
```

### 1. Constitution - Конституция, стандарты, принципы

Для __существующих проектов__ — дайте команду проанализировать существующую кодовую базу:

```text
/speckit.constitution
Проанализируй текущий код и создай constitution на его основе.
```

Best practices:

- Используйте ChatGPT для генерации первого драфта constitution
- В репозитории SpecKit есть примеры — берите за основу и адаптируйте под свой проект
- Если в компании есть coding standards — превратите их в constitution один раз, используйте во всех проектах

[Что включать](https://habr.com/ru/articles/964368/):

1. Архитектурные принципы
Стиль архитектуры (Feature-Sliced Design, Clean Architecture, Microservices)
Паттерны проектирования, которые вы используете
2. Технические ограничения
Языки и их версии (TypeScript, PHP 8.2+, строгая типизация)
Обязательные инструменты (ESLint, Prettier, PHPStan)
Запрещённые библиотеки или подходы
Требования к совместимости
3. Стандарты качества кода
SOLID принципы, DRY, KISS
Стандарты именования (camelCase, snake_case)
Максимальная длина функций/классов
Требования к комментариям и документации
4. Тестирование
Какие тесты обязательны (unit, integration, e2e)
Coverage требования (если есть)
Test-Driven Development подход (если используете)
Стратегия тестирования (AAA pattern, Given-When-Then)
5. Git и коммиты
Стратегия коммитов (один коммит на таску, conventional commits)
Формат commit message
Стратегия бранчей
Требования к PR
6. UX/Accessibility
Стандарты доступности (WCAG AA/AAA)
Поддержка устройств (mobile-first, responsive)
Производительность (Core Web Vitals)
7. Security и Privacy
Требования безопасности
Обработка персональных данных
Compliance (GDPR, и т.д.)

### 2. Specify - Бизнес требования

```text
specs/001-feature-name/spec.md
```

Best practices:

- Используйте "ДОЛЖНА/МОЖЕТ/НЕ ДОЛЖНА"
- Разделяйте MVP и будущие фичи
- User Story Mapping
- Используйте ChatGPT для первого драфта

### 3. Clarify - Уточнение бизнес требований

- Интервью с умным коллегой
- Запускайте clarify после больших изменений spec.md, чтобы убедиться, что требования согласованы и не противоречат друг другу.

### 4. Checklist - Чек-листы качества

- Аудит по стандартам качества

```text
/speckit.checklist [тема]
```

Доступные темы:

/speckit.checklist UX
/speckit.checklist Security
/speckit.checklist Performance
/speckit.checklist Accessibility
/speckit.checklist SEO
/speckit.checklist Testing
Любая кастомная тема
/speckit.checklist Mobile-First Design
/speckit.checklist Data Privacy GDPR
/speckit.checklist API Design Best Practices

### 5. Plan - Технический план

Пример:

```test
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

### ?. Trace - Трассировка спецификаций, тестов и кода

[ ] TODO [trace](https://www.glukhov.org/ru/app-architecture/testing-architecture/specs-tests-code-traceability-ai-development/)
	[extension](https://github.com/haveard/spec-kit-tracer?ysclid=mw4pjwkemy523441946)
	/speckit.tracer.trace
	/speckit.tracer.verify
	/speckit.tracer.expand

requirements.md     # REQ-IDs с критериями приемки в стиле EARS
design.md           # ADR-IDs, затронутые файлы, архитектурные решения
tasks.md            # TASK-IDs, маппинг на одно или несколько REQ-IDs
tests.md            # какие файлы/функции тестов ссылаются на какие REQ-IDs
traceability.md     # сгенерированная таблица: REQ -> ADR -> TASK -> файлы -> тесты -> PR

tests.md и traceability.md должны быть сгенерированы, а не поддерживаться вручную

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
  
### 9. Converge - Проверить полноту реализации

/speckit-converge
