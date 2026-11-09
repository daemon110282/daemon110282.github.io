# Spec-Driven Development (SDD)

## Зачем

Фреймворк для разработки технической документации в репозитории, подход __docs-as-code__ без изменения технологического стека разработки:

- модель артефактов и базовые инварианты __трассируемости__ между ними
- __DoD__ как минимальный порог качества ключевых артефактов
- GAP-реестр как "легальная неполнота" для R&D
- фиксация архитектурно значимых решений в __формате ADR__
- протокол взаимодействия "человек <> AI-агент" в режиме human-in-the-loop, фиксирующий границы ответственности и условия обязательного вмешательства человека

## Плюсы и минусы

Плюсы:

- Трассировка требований и тестов через документацию
- Возможность интеграции с CI/CD и Agile
- Возможность интеграции с AI-агентами (например, ChatGPT) для генерации и проверки документации

Минусы:

- Похоже на Waterfall, но с возможностью гибкой адаптации к Agile и CI/CD

## TODO

- [x] [Внедрение Spec-Driven Development](https://www.youtube.com/watch?v=EZwcBSX_Rbs)
- [ ] [Трассировка спецификаций, тестов и кода в разработке с использованием AI](https://www.glukhov.org/ru/app-architecture/testing-architecture/specs-tests-code-traceability-ai-development/)
  - [ ] use spec-kit-tracer
- [ ] Superpowers
  - [manual](https://www.glukhov.org/ru/ai-devtools/superpowers/)
- [ ] OpenSpec
  - [intro](https://www.youtube.com/watch?v=nntQKlHS-z4)

## Frameworks

- [Сравнение](https://www.youtube.com/watch?v=UHKRUEoHZow)
  - [RuStore](https://www.rustore.ru/developer/blog/spec-kit-i-openspec-v-realnom-android-proekte-testiruem-sdd-na-zadachah-rustore)
  - [SDD vs Vibe Coding](https://www.glukhov.org/ru/ai-devtools/vibe-coding/spec-driven-development-vs-vibe-coding/)
  - [SDD vs BDD vs TDD](https://www.glukhov.org/ru/app-architecture/documentation/what-is-spec-driven-development/)
- [Github Spec-Kit](spec-kit.md)
  - проходит последовательные стадии от constitution до implement, и ему трудно с меняющимися требованиями и сильной связанностью
  - MIT
  - позволяет организовать подробный жизненный цикл отдельных функциональных возможностей, оставляя команде выбор стратегии хранения актуальных спецификаций
  - Рекомендуют, если:
    - Создаётся __новая информационная система или крупная подсистема__.
    - Требуется формализовать архитектуру до начала реализации.
    - Необходимо согласование требований и технических решений.
    - Важна стандартизация работы нескольких команд.
    - Требуется расширяемый процесс контроля реализации.
- [AWS Kiro](https://github.com/kiro-dev/kiro)
  - vendor-agnostic (AWS), но требует отдельного сервера и не интегрируется с GitHub Actions
  - Proprietary, но с открытым исходным кодом
- [OpenSpec](https://github.com/openspec)
  - рассчитан на существующие кодовые базы и ведёт изменение [через explore, propose и apply](https://www.youtube.com/watch?v=_imJ9rHoapY)
  - MIT
  - использует [Gherkin](gherkin.md) вместо [Use cases](../use.case.md)
  - поддерживает постоянную базовую спецификацию системы и дельты изменений
  - Рекомендуют, если:
    - Есть __существующие информационные системы__.
    - Требуется развивать функциональность небольшими итерациями.
    - Важно поддерживать актуальность спецификаций.
    - Используется несколько AI coding assistants.
    - Не хочется создавать много документации для каждой задачи.
- [Superpowers](https://superpowers.dev/)
  - Open-source пакет навыков, накладывающий обязательный цикл «мозговой штурм → план → субагенты → TDD → ревью»
- [ai-factory](https://github.com/lee-to/ai-factory)
