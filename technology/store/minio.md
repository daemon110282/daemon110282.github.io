# MinIO

## Зачем

Реализация [Object Storage Объектное хранилище](./object.storage.md), протокол Amazon S3 compatible.
Технология для [хранилищ данных](../../arch/system.class/store.md).

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
		- [on days](https://min.io/docs/minio/linux/administration/object-management/object-lifecycle-management.html#object-expiration)
	- Legal Hold [Object Retention](https://min.io/docs/minio/linux/administration/object-management.html#object-retention) - блокировка от удаления
		- enforces Write-Once Read-Many (WORM) immutability to protect versioned objects from deletion
		- MinIO supports both duration
			- based object retention
			- indefinite Legal Hold retention.
	- Quota
- Object
	- object name
	- file name
	- object data stream, object size, content type,
	- object metadata (метод [StatObject](https://min.io/docs/minio/linux/developers/dotnet/API.html#statobjectasync-statobjectargs-args))
	- Data Encryption [SSE](https://min.io/docs/minio/linux/operations/server-side-encryption.html)
	- Tags
	- [Legal Hold status](https://min.io/docs/minio/linux/administration/object-management.html#object-retention)
	- Retention Policy
	- [Expire Policy](https://min.io/docs/minio/linux/developers/dotnet/API.html#presigned-operations)
- Интеграции
	- [Client SDK](https://min.io/docs/minio/linux/developers/minio-drivers.html#minio-drivers)
		- [JS](https://github.com/minio/minio-js),
		- PHP
			- [PHP Laravel support](https://laravel.com/docs/9.x/filesystem#amazon-s3-compatible-filesystems)
		- [.NET](https://min.io/docs/minio/linux/developers/dotnet/minio-dotnet.html)
	- Bucket [Events](https://min.io/docs/minio/linux/administration/monitoring/bucket-notifications.html#)	to [RMQ, PSQL, Redis, WebHook](https://min.io/docs/minio/linux/administration/monitoring.html#bucket-notifications)
	- [presigned URLs](https://min.io/docs/minio/linux/integrations/presigned-put-upload-via-browser.html)
- [Security](https://min.io/docs/minio/linux/administration/identity-access-management.html)
	- Policy-Based Access Control (PBAC)
	- Data [Encryption SSE](https://min.io/product/enterprise-object-storage-encryption)
	- Manage
		- Internal IDP
		- security access by [IAM Keycloak](https://min.io/product/identity-and-access-management) OIDC protocol
		- LDAP
	- [Audit requests](https://min.io/docs/minio/linux/operations/monitoring/minio-logging.html#minio-logging-publish-audit-logs)
- MTA
	- [MinIO Operator](https://blog.min.io/secure-multi-tenant-object-storage/)
	- Варианты [Guide Deploy](https://github.com/minio/minio/blob/master/docs/multi-tenancy/README.md)

### Bucket Events

- Настраивается по Bucket перечень нужных [Events](https://min.io/docs/minio/linux/reference/minio-mc/mc-event-add.html#mc-event-supported-events)
	- Console
	- CLI
	- [SDK's BucketNotification APIs](https://min.io/docs/minio/linux/developers/go/API.html#setbucketnotification-ctx-context-context-bucketname-string-config-notification-configuration-error)
- RMQ [example](https://min.io/docs/minio/linux/administration/monitoring/publish-events-to-amqp.html#minio-bucket-notifications-publish-amqp)
	- [Manual Detail](https://github.com/minio/minio/blob/master/docs/bucket/notifications/README.md)
- [Event Structure](https://docs.aws.amazon.com/AmazonS3/latest/userguide/notification-content-structure.html)
	- [Created, Deleted, Restored](https://docs.aws.amazon.com/AmazonS3/latest/userguide/ev-events.html)
	- requestParameters
		- sourceIPAddress
	- s3
		- object
			- key
			- eTag

## Плюсы-Минусы

- имеет низкий порог входа в отличии от Ceph
- HTTPS TLS 1.2+

## Patterns

### Data Encryption (SSE)

- Data [Encryption Server-Side Encryption (SSE)](https://min.io/product/enterprise-object-storage-encryption)
- Encryption [algorithms](https://min.io/product/enterprise-object-storage-encryption): AES-256-GCM, ChaCha20-Poly1305, and AES-CBC
- [Общая архитектура](https://min.io/product/enterprise-object-storage-encryption)

Разные типы:

- SSE-KMS (ключи берутся из KMS)
  - MinIO supports enabling automatic SSE-KMS encryption of __all objects written to a bucket__ using a specific __External Key (EK)__ stored on the external Key Managment System __(KMS)__.
  - При загрузке объекта, MinIO:
    - Генерирует уникальный Data Encryption Key (DEK) для каждого объекта.
    - DEK шифруется Master Key-ом (из KMS).
    - Объект шифруется DEK’ом (обычно алгоритм AES-256-GCM).
    - Зашифрованный DEK сохраняется в метаданных объекта.
  - MinIO автоматически расшифровывает данные при чтении, если у него есть доступ к нужному ключу
    - Клиент делает запрос на скачивание объекта. Например: GET /mybucket/myfile.txt
    - MinIO читает зашифрованный объект из хранилища, а также метаданные, в которых содержится: Зашифрованный DEK (Data Encryption Key), Идентификатор ключа шифрования (Master Key ID)
    - MinIO обращается к KMS (или использует встроенный ключ, если настроено MINIO_KMS_SECRET_KEY) для расшифровки DEK с помощью Master Key.
    - Используя расшифрованный DEK, MinIO дешифрует сам объект на лету
    - Расшифрованные данные отправляются клиенту — клиент ничего не должен знать о ключах или шифровании.
- SSE-C (ключи указывает Клиент)
  - Clients specify an EK as part of the write operation for an object. MinIO uses the specified EK to perform SSE-S3.

Support KMS:

- [hashicorp-vault](https://min.io/docs/kes/integrations/hashicorp-vault-keystore/)
- внутренний сервис Minio Key Encryprion Service [KES](https://min.io/docs/kes/)
  - поддерживает получение ключей из [Filesystem](https://min.io/docs/kes/tutorials/filesystem-keystore/)
  - [Guide](https://min.io/docs/minio/linux/administration/server-side-encryption/server-side-encryption-sse-kms.html)

## Технологии

## Наблюдаемость

- [Grafana Dashboard](https://min.io/docs/minio/linux/operations/monitoring/grafana.html#minio-grafana)
- [VM](https://min.io/docs/minio/linux/operations/monitoring/collect-minio-metrics-using-prometheus.html)

## Deployment

- docker compose
- HELM chart
- [k8s](https://min.io/docs/minio/kubernetes/upstream/index.html)
- Observability
	- метрики
		- [Prometheus-compatible](https://min.io/docs/minio/linux/administration/monitoring.html#deployment-metrics)
		- [Grafana](../observability/grafana.md)
	- [logs](https://min.io/docs/minio/linux/administration/monitoring.html#server-logs)
		- [console](https://github.com/minio/minio/blob/master/docs/logging/README.md)
		- http web hook

### Version
