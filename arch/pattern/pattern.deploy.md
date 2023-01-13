# Deployment

Стратегии:

- [Dark (скрытые) или А/В-развертывания](https://temofeev.ru/info/articles/strategii-deploya-v-kubernetes-rolling-recreate-blue-green-canary-dark-a-b-testirovanie/) - вариация Canary стратегии . Разница между скрытым и канареечным развертыванием состоит в том, что скрытые развертывания имеют дело с фронтендом, а не с бэкендом, как канареечные.
- [Rollback](pattern.rollback.md)
- k8s
	- [Recreate](https://rtfm.co.ua/kubernetes-tipy-deployment-strategies-i-argo-rollouts/) - с простоем
	- [RollingUpdate](https://rtfm.co.ua/kubernetes-tipy-deployment-strategies-i-argo-rollouts/) - запускает новые поды параллельно с запущенными старыми, а затем убивает старые, и оставляет только новые.
- [Blue Green Deployment](https://docs.oracle.com/en/solutions/mod-app-deploy-strategies-oci/index.html#GUID-2207DEDA-718D-4264-B851-144EBF0E57CF) - одновременно работает и старая (green), и новая (blue) версия, но весь трафик направляет на новую, а если с ней возникают проблемы – то можно переключиться обратно на первую.
- [Canary Deployment](https://docs.oracle.com/en/solutions/mod-app-deploy-strategies-oci/index.html#GUID-2207DEDA-718D-4264-B851-144EBF0E57CF) - гибче RollingUpdate, т.к. часть запросов переключается на новую версию, а часть продолжает использовать старую версию

## Blue Green Deployment

Плюсы
	- Downtime сокращается
	- Простота внедрения для __stateless ИС__ (микросервисной архитектуры) 
	- Необходимо применение автоматизированных подходов CI-CD и контейнеризации ([k8s](../../technology/ci-cd/k8s.md), ingress controler (Istio))
Минусы
	- Сложность поддержки на уровне statefull компонентов ИС - БД [__двух версий__ (Миграция БД) - поддержка новой, старой версии модели данных](https://habr.com/ru/post/309832/), [чтения\записи по старой\новой модели](https://learn.microsoft.com/en-us/answers/questions/159546/sql-server-zero-downtime-blue-green-deployment) данных
		- Рекомендуется разворачивать __одну БД с поддержкой двух версий модели данных__
		- Возможны задержки на уровне БД при __миграции модели БД__ онлайн - увеличение Downtime
	- Необходимость поддержки на уровне компонентов ИС отката
		- рост трудозатрат на тестирования
		- рост трудозатрат разработки на поддержку [подходов к проектированию БД](https://habr.com/ru/company/nixys/blog/481932/)
			- применение решений вида: __Liquibase__
				- It automates database schema changes management
				- allows versioning of those changes, easily roll back all the previously [performed modifications of your schema](https://piotrminkowski.com/2021/02/18/blue-green-deployment-with-a-database-on-kubernetes/)

## Как обновлять кодовую базу незаметно для пользователей

- возможности управления HAProxy и реализации Graceful Shutdown в наших сервисах
- Миграции бд
- поддерживаем на бою одновременно старую и новую версии сервиса
- Заранее, на этапе разработки софта, закладывается, что даже если будут изменения в базе данных сервиса, они не будут ломать предыдущий код.

![scheme](../../img/pattern/deploy/deploy.update.jpg)

## Технологии

- Flagger
- [k8s](../../technology/ci-cd/k8s.md)