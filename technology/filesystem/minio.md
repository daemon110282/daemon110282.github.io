# MinIO

## Зачем

Реализация [Object Storage Объектное хранилище](object.storage.md), протокол Amazon S3 compatible.

## Функции

[MinIO](https://min.io/):

- GNU AGPL v3 лицензия позволяет коммерческое использование
- [CLI](https://min.io/docs/minio/linux/reference/minio-mc.html)
- [MinIO Console](https://min.io/docs/minio/linux/administration/minio-console.html) - GUI управления 
	- object browser
	- metrics, logs
- custom [Admin REST API](https://github.com/dominicklee/MinIO-Admin-for-PHP) by CLI command
- Bucket
	- [Expire Policy](https://min.io/docs/minio/linux/administration/object-management.html#object-lifecycle-management) - автоочистка старых данных
	- [Object Retention](https://min.io/docs/minio/linux/administration/object-management.html#object-retention) - блокировка от удаления
	- Quota
- Интеграции
	- [Client SDK](https://min.io/docs/minio/linux/developers/minio-drivers.html#minio-drivers) 
		- [JS](https://github.com/minio/minio-js), 
		- PHP
			- [PHP Laravel support](https://laravel.com/docs/9.x/filesystem#amazon-s3-compatible-filesystems)
		- [.NET](https://min.io/docs/minio/linux/developers/dotnet/minio-dotnet.html) 
	- Bucket [Events](https://min.io/docs/minio/linux/administration/monitoring/bucket-notifications.html#)	to [RMQ, PSQL, Redis, WebHook](https://min.io/docs/minio/linux/administration/monitoring.html#bucket-notifications)
		- Настраивается по Bucket перечень нужных [Events](https://min.io/docs/minio/linux/reference/minio-mc/mc-event-add.html#mc-event-supported-events)
		- RMQ [example](https://min.io/docs/minio/linux/administration/monitoring/publish-events-to-amqp.html#minio-bucket-notifications-publish-amqp)
- [Security](https://min.io/docs/minio/linux/administration/identity-access-management.html)
	- Policy-Based Access Control (PBAC) 
	- [Encryption](https://min.io/product/enterprise-object-storage-encryption)
	- Manage
		- Internal IDP	
		- security access by [IAM Keycloak](https://min.io/product/identity-and-access-management) OIDC protocol
		- LDAP
- MTA
	- [MinIO Operator](https://blog.min.io/secure-multi-tenant-object-storage/)
	- Варианты [Guide Deploy](https://github.com/minio/minio/blob/master/docs/multi-tenancy/README.md)

## Плюсы-Минусы

- имеет низкий порог входа в отличии от Ceph
- HTTPS TLS 1.2+

## Patterns

## Технологии

## Deployment

- docker compose
- HELM chart
- [k8s](https://min.io/docs/minio/kubernetes/upstream/index.html)
- Observability
	- метрики 
		- [Prometheus-compatible](https://min.io/docs/minio/linux/administration/monitoring.html#deployment-metrics)
		- Grafana
	- [logs](https://min.io/docs/minio/linux/administration/monitoring.html#server-logs)
		- [console](https://github.com/minio/minio/blob/master/docs/logging/README.md)
		- http web hook

### Version

## Compare