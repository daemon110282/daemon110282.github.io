# Object Storage Объектное хранилище

- [Object Storage Объектное хранилище](#object-storage-объектное-хранилище)
	- [Зачем](#зачем)
	- [Термины](#термины)
	- [Функции](#функции)
	- [Плюсы-минусы](#плюсы-минусы)
	- [Технологии](#технологии)
	- [Deployment](#deployment)

## Зачем

Вариант распределенного [хранения данных](../filesystem/filesystem.md).

- Понимаются __устройства__ и __программное обеспечение__, которые хранят данные в структурах, называемых «__объектами__», и обслуживают клиентов через API RESTful HTTP, такие как Amazon Simple Storage Service (S3)
- Данные и метаданные распределяются по нескольким узлам в __кластере__ для обеспечения
  - __доступности__
  - __отказоустойчивости__ и защиты данных в режиме самовосстановления
  - линейного обеспечения __высокой пропускной способности__
  - большой емкости
- Дополнительный слой абстракции над файловой системой и хостом, который позволяет работать с [файлами (получать доступ, хранить) через API](https://habr.com/ru/company/ozontech/blog/586024/)

UC:

- Backup
- IoT
- Logs
- CDN
- BigData [Data lake](../../arch/pattern/system.design/data.lake.md)

## Термины

- объект – это файл и набор метаданных о нём
- все объекты находятся в одном «каталоге» – bucket

## Функции

- Загрузка upload объектов
- Версионирование объектов
- Скачивание download файла
	- Проксировать запрос [напрямую в S3 пример MinIO](https://habr.com/ru/company/ozontech/blog/586024/)
- Ограничение доступа
	- Token реализация паттерна [valet key](https://learn.microsoft.com/en-us/azure/architecture/patterns/valet-key)
	![scheme](https://learn.microsoft.com/en-us/azure/architecture/patterns/_images/valet-key-pattern.png)
- Expire Policy - автоочистка старых данных
- Object Retention - блокировка от удаления

## Плюсы-минусы

[Плюсы](https://cloudian.com/guides/hybrid-it/on-premises-object-storage/):

- Scalability
- Easier search and analysis
- Cost reduction
- High performance

Минусы

- Затраты на инфраструктуру

## Технологии

[Сравнение Gartner](https://www.gartner.com/reviews/market/distributed-file-systems-and-object-storage)

Варианты

- Cloud Commercial
	- Amazon S3
	- GCS
	- Azure
- [On premise](https://geekflare.com/self-hosted-s3/)
	- Open Source (класс Amazon S3-совместимых хранилищ)
		- [MinIO](minio.md)
		- [Ceph](https://ceph.com/en/)
			- [более надежен](https://habr.com/ru/company/ozontech/blog/586024/#comment_23647704) чем MinIO
			- не S3 совместимо?
	- Commercial		
		- [Cloudian](https://cloudian.com/guides/hybrid-it/on-premises-object-storage/)

Критерии выбора
ТОДО

## Deployment

- [S3 benchmarking tool](https://github.com/minio/warp)
