# Prompts Инжиниринг промтов

- [Рекомендации по написанию Промтов](promts.manual.md)

## Библиотека промтов

Для различных задач в области анализа требований, проектирования систем и взаимодействия с AI‑агентами.

- [ ] Использовать VS Code Snippets
  - [x] Добавить в [global.code-snippets](../../.vscode/global.code-snippets)
- [ ] Библиотека промтов:
  - Continue.dev — полноценный AI‑агент внутри VS Code.
  - PromptHub — менеджер промтов с категориями.
  - ChatGPT – EasyCode — позволяет сохранять и переиспользовать промты.
  - Pieces for Developers — сохраняет фрагменты текста, кода, промтов.
- [ ] Использовать GitHub Gist как удалённую библиотеку промтов

## Примеры

- [Примеры промтов для аналитики](../../../analytic/ai/prompts_my/readme.md)

### naming things Domain

 "Describe the domain, model of which consists of classes:"
 	и далее copypaste список классов из модели домена
	Оно вываливает кучу текста, похожего на правду, если вы используете термины из предметной области
затем "provide clear and brief description"
и в догоночку "Provide bounded context name based on description"
	и мэтчим с собственным названием ограниченного контекста
