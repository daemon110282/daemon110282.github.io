# Паттерны отката изменения rollback

- [Паттерны отката изменения rollback](#паттерны-отката-изменения-rollback)
	- [Зачем](#зачем)
	- [Подходы Deploy](#подходы-deploy)
		- [Blue Green Deployment](#blue-green-deployment)
	- [Технологии](#технологии)

## Зачем

- Возможность автоматизации процесса отката на предыдущую версию на уровне
	- контейнеров
	- бэкапов
	- кода
	- паттернов [Deploy](pattern.deploy.md)

## Подходы Deploy

- [Blue Green Deployment](https://docs.oracle.com/en/solutions/mod-app-deploy-strategies-oci/index.html#GUID-2207DEDA-718D-4264-B851-144EBF0E57CF) - одновременно работает и старая (green), и новая (blue) версия, но весь трафик направляет на новую, а если с ней возникают проблемы – то можно переключиться обратно на первую.

### Blue Green Deployment

Плюсы:

- Downtime сокращается
- Простота внедрения для __stateless ИС__ (микросервисной архитектуры)
- Необходимо применение автоматизированных подходов CI-CD и контейнеризации ([k8s](../../technology/ci-cd/k8s.md), ingress controler (Istio))

Минусы:

- Сложность поддержки на уровне statefull компонентов ИС - БД [__двух версий__ (Миграция БД) - поддержка новой, старой версии модели данных](https://habr.com/ru/post/309832/), [чтения\записи по старой\новой модели](https://learn.microsoft.com/en-us/answers/questions/159546/sql-server-zero-downtime-blue-green-deployment) данных
	- Рекомендуется разворачивать __одну БД с поддержкой двух версий модели данных__
	- Возможны задержки на уровне БД при __миграции модели БД__ онлайн - увеличение Downtime
- Необходимость поддержки на уровне компонентов ИС отката
	- рост трудозатрат на тестирования
	- рост трудозатрат разработки на поддержку [подходов к проектированию БД](https://habr.com/ru/company/nixys/blog/481932/)
		- применение решений вида: __Liquibase__
			- It automates database schema changes management
			- allows versioning of those changes, easily roll back all the previously [performed modifications of your schema](https://piotrminkowski.com/2021/02/18/blue-green-deployment-with-a-database-on-kubernetes/)
- Необходимость поддержки на уровне зависимых API ИС отката
	- Версионирование API для поддержки обратной совместимости
	- Автоматизация разворачивания всех зависимых ИС дает ожидаемое снижение Downtime при обновление\откате

## Технологии

- [argo-rollouts (k8s helm)](https://rtfm.co.ua/kubernetes-tipy-deployment-strategies-i-argo-rollouts/)
- Liquibase