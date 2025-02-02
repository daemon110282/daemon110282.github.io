# Deployment

- [Deployment](#deployment)
  - [Зачем](#зачем)
  - [Версионирование обновлений приложения](#версионирование-обновлений-приложения)
  - [Стратегии развертывания Deploy](#стратегии-развертывания-deploy)
    - [Canary Deployment](#canary-deployment)
  - [Технологии](#технологии)

## Зачем

Как обновлять кодовую базу незаметно для пользователей:

- возможности управления HAProxy и реализации [Graceful Shutdown](graceful.shutdown.md) в наших сервисах
- [Миграции бд](../migration.db.md)
- поддерживаем на бою одновременно старую и новую версии сервиса применяя [стратегии](#стратегии-развертывания-deploy) развертывания
- Заранее, на этапе разработки софта, закладывается [версионирование](#версионирование-обновлений-приложения), что даже если будут изменения в базе данных сервиса, они не будут ломать предыдущий код

![scheme](../../../img/pattern/deploy/deploy.update.jpg)

## Версионирование обновлений приложения

- Цель
  - Не зависеть от обновлений бэка. Бэк выкатывается раньше.
  - Обратная совместимость
  - Простота поддержки
  - Минимальное время простоя
- Проблемы
  - Пользователь не обновляется
  - Проверка долго, могут не пустить версию
  - Новая версия приложения еще неработает, а бэк новый уже обновлен
- Версионирование варианты
  - Mediator pattern
  - Expand contract избыточность кода, поддержка документации
  - Номер версии: В данных, api - url, header
  - Правила версионирования [SemVer](https://semver.org/lang/ru/)
  - Язык запрсов к API: Graphql
- [Unit tests](../test.md) api version
  
## Стратегии развертывания Deploy

- Надежность
  - [Rollback pattern](./pattern.rollback.md)
  	- [Blue Green Deployment](./pattern.rollback.md#blue-green-deployment)
  	- k8s
  		- [Recreate](https://rtfm.co.ua/kubernetes-tipy-deployment-strategies-i-argo-rollouts/) - с __простоем__
  		- [Rolling Update](https://rtfm.co.ua/kubernetes-tipy-deployment-strategies-i-argo-rollouts/) - запускает __новые поды параллельно с запущенными старыми__, а затем убивает старые, и оставляет только новые
- Сокращение TTM, проверка гипотез
	- [Canary Deployment](#canary-deployment)
	- [Dark (скрытые) или А/В-развертывания](https://temofeev.ru/info/articles/strategii-deploya-v-kubernetes-rolling-recreate-blue-green-canary-dark-a-b-testirovanie/) - вариация Canary стратегии . Разница между скрытым и канареечным развертыванием (Canary Deployment) состоит в том, что скрытые развертывания __имеют дело с фронтендом, а не с бэкендом__, как канареечные.
  	- Ref Arch [A\B test](../../ref/abtesting.md)
	- [Feature toggle](../feature.toggle.md)
- [варианты](https://blog.bytebytego.com/i/98040721/what-is-the-process-for-deploying-changes-to-production) ![schema](https://substackcdn.com/image/fetch/w_1456,c_limit,f_webp,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F58c6a2b8-33c2-4094-b07c-b644227b1b20_3546x4233.jpeg)

### Canary Deployment

- [Canary Deployment](https://martinfowler.com/bliki/CanaryRelease.html) - гибче __Rolling Update__, т.к. часть запросов переключается __на новую версию, а часть продолжает использовать старую версию__
- [TODO нюансы](https://habr.com/ru/company/oleg-bunin/blog/493026/)
- [Reference arch Oracle](https://docs.oracle.com/en/solutions/mod-app-deploy-strategies-oci/index.html#GUID-2207DEDA-718D-4264-B851-144EBF0E57CF)

## Технологии

- [k8s](../../../technology/ci-cd/k8s.md)
