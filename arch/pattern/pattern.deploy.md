# Deployment

Стратегии:

- [Dark (скрытые) или А/В-развертывания](https://temofeev.ru/info/articles/strategii-deploya-v-kubernetes-rolling-recreate-blue-green-canary-dark-a-b-testirovanie/) - вариация Canary стратегии . Разница между скрытым и канареечным развертыванием состоит в том, что скрытые развертывания имеют дело с фронтендом, а не с бэкендом, как канареечные.
- [Rollback](pattern.rollback.md)
- k8s
	- [Recreate](https://rtfm.co.ua/kubernetes-tipy-deployment-strategies-i-argo-rollouts/) - с простоем
	- [RollingUpdate](https://rtfm.co.ua/kubernetes-tipy-deployment-strategies-i-argo-rollouts/) - запускает новые поды параллельно с запущенными старыми, а затем убивает старые, и оставляет только новые.
- [Blue Green Deployment](https://docs.oracle.com/en/solutions/mod-app-deploy-strategies-oci/index.html#GUID-2207DEDA-718D-4264-B851-144EBF0E57CF) - одновременно работает и старая (green), и новая (blue) версия, но весь трафик направляет на новую, а если с ней возникают проблемы – то можно переключиться обратно на первую.
- [Canary Deployment](https://docs.oracle.com/en/solutions/mod-app-deploy-strategies-oci/index.html#GUID-2207DEDA-718D-4264-B851-144EBF0E57CF) - гибче RollingUpdate, т.к. часть запросов переключается на новую версию, а часть продолжает использовать старую версию

## Как обновлять кодовую базу незаметно для пользователей

- возможности управления HAProxy и реализации Graceful Shutdown в наших сервисах
- Миграции бд
- поддерживаем на бою одновременно старую и новую версии сервиса
- Заранее, на этапе разработки софта, закладывается, что даже если будут изменения в базе данных сервиса, они не будут ломать предыдущий код.

![scheme](../../img/pattern/deploy/deploy.update.jpg)

## Технологии

- Flagger
- [k8s](../../technology/ci-cd/k8s.md)