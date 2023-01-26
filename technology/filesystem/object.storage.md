# Object Storage Объектное хранилище

Понимаются устройства и программное обеспечение, которые хранят данные в структурах, называемых «объектами», и обслуживают клиентов через API RESTful HTTP, такие как Amazon Simple Storage Service (S3). 
Данные и метаданные распределяются по нескольким узлам в кластере для обеспечения доступности, отказоустойчивости и защиты данных в режиме самовосстановления и линейного обеспечения высокой пропускной способности и емкости.

## Зачем

- Дополнительный слой абстракции над файловой системой и хостом, который позволяет работать с [файлами (получать доступ, хранить) через API](https://habr.com/ru/company/ozontech/blog/586024/).
- масштабируемость, простота поддержки, гибкость
- распределенное хранение

Термины:
- объект – это файл и набор метаданных о нём
- все объекты находятся в одном «каталоге» – bucket

Функции:
- [Data lakes](https://cloudian.com/guides/hybrid-it/on-premises-object-storage/)
- CDN
- Загрузка upload файла
- Скачиваени download файла
	- Проксировать запрос [напрямую в S3 пример MinIO](https://habr.com/ru/company/ozontech/blog/586024/)
- Ограничение доступа 
	- Token реализация паттерна [valet key](https://learn.microsoft.com/en-us/azure/architecture/patterns/valet-key)
	![scheme](https://learn.microsoft.com/en-us/azure/architecture/patterns/_images/valet-key-pattern.png)
	
## Технологии

[Сравнение Gartner](https://www.gartner.com/reviews/market/distributed-file-systems-and-object-storage)

Класс Amazon S3-совместимых хранилищ
- Cloud Commercial
	- Amazon S3
	- GCS
	- Azure	
- [On premise](https://geekflare.com/self-hosted-s3/)
	- Open Source
		- [MinIO](https://min.io/)
			- имеет низкий порог входа от Ceph
			- k8s docker compose
			- [PHP Laravel support] https://laravel.com/docs/9.x/filesystem#amazon-s3-compatible-filesystems
			- Client SDK [JS](https://github.com/minio/minio-js), PHP, .NET и тп
			- security access by [IAM Keycloak](https://min.io/product/identity-and-access-management) OIDC protocol
	- Commercial
		- Ceph
			- [более надежен](https://habr.com/ru/company/ozontech/blog/586024/#comment_23647704) чем MinIO
		- [Cloudian](https://cloudian.com/guides/hybrid-it/on-premises-object-storage/)
	
## Deployment

- [S3 benchmarking tool](https://github.com/minio/warp)