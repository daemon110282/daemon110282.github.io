# Deployment

Стратегии:

- Надежность
	- [Rollback pattern](pattern.rollback.md) - Blue Green Deployment
	- k8s
		- [Recreate](https://rtfm.co.ua/kubernetes-tipy-deployment-strategies-i-argo-rollouts/) - с простоем
		- [Rolling Update](https://rtfm.co.ua/kubernetes-tipy-deployment-strategies-i-argo-rollouts/) - запускает новые поды параллельно с запущенными старыми, а затем убивает старые, и оставляет только новые.
- Сокращение TTM, проверка гипотез
	- [Canary Deployment](https://martinfowler.com/bliki/CanaryRelease.html) - гибче __Rolling Update__, т.к. часть запросов переключается __на новую версию, а часть продолжает использовать старую версию__
	- [Dark (скрытые) или А/В-развертывания](https://temofeev.ru/info/articles/strategii-deploya-v-kubernetes-rolling-recreate-blue-green-canary-dark-a-b-testirovanie/) - вариация Canary стратегии . Разница между скрытым и канареечным развертыванием (Canary Deployment) состоит в том, что скрытые развертывания __имеют дело с фронтендом, а не с бэкендом__, как канареечные.

## Canary Deployment

- TODO нюансы https://habr.com/ru/company/oleg-bunin/blog/493026/
- [Reference arch Oracle]](https://docs.oracle.com/en/solutions/mod-app-deploy-strategies-oci/index.html#GUID-2207DEDA-718D-4264-B851-144EBF0E57CF)

## Как обновлять кодовую базу незаметно для пользователей

- возможности управления HAProxy и реализации Graceful Shutdown в наших сервисах
- Миграции бд
- поддерживаем на бою одновременно старую и новую версии сервиса
- Заранее, на этапе разработки софта, закладывается, что даже если будут изменения в базе данных сервиса, они не будут ломать предыдущий код.

![scheme](../../img/pattern/deploy/deploy.update.jpg)

## Технологии

- Flagger
- [k8s](../../technology/ci-cd/k8s.md)