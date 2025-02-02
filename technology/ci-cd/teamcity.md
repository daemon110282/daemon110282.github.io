# Team City

- [Team City](#team-city)
	- [Зачем](#зачем)
	- [Функции](#функции)
		- [CI-CD](#ci-cd)
	- [Deployment](#deployment)
	- [Version](#version)

## Зачем

CI/[CD](../../arch/pattern/deployment/devops.md#cd) - решение для [DevOps](../../arch/pattern/deployment/devops.md) команд.

## Функции

- [REST API](https://www.jetbrains.com/ru-ru/teamcity/)

### CI-CD

- Project
  - содержит Build configurations
- [Build Agent](https://habr.com/ru/companies/tbank/articles/532546/) Агент Сборки
  - Build Trigger (commit\merge in VCS)
  - Build configurations
    - содержит Steps Шаги Сборки, которые настраиваются через [Build Runner](https://www.jetbrains.com/help/teamcity/build-runner.html)
  - После сборки могут быть Artifact
- [Build chain](https://habr.com/ru/companies/tbank/articles/532546/) цепочка сборки (Pipeline)
  - позволяет разносить Build Steps по разным конфигурациям, связывая их при помощи
    - снепшот-зависимостей Shapshot Dependency
    - Artifact Dependency
  - параллельный запуск Build configurations

## Deployment

- Cloud
- On premise

## Version

- Professional - On premise open source
- Cloud - commercial
