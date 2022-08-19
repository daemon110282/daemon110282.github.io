# Паттерны отката изменения rollback

- Возможность автоматизации процесса отката на предыдущую версию на уровне 
	- контейнеров
	- бэкапов
	- кода
	- подхододов [deploy](pattern.deploy.md) (например blue-green deployment)
- Версионирование API для поддержки обратной совместимости

## Технологии

- [argo-rollouts (k8s helm)](https://rtfm.co.ua/kubernetes-tipy-deployment-strategies-i-argo-rollouts/)