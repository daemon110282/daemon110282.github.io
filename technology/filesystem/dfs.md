# Распределённая файловая система DFS (Distributed File System)

## Зачем

- предоставления прозрачного доступа к хранилищам данных (как удаленный жёсткий диск), общие папки (монтирование папок на клиенте), управляемые распределенной файловой системой
- [партнеров по репликации для отказоустойчивости](https://windata.ru/windows-world/lokalnaya-set/raspredelennaya-fajlovaya-sistema-dfs-osnovy)
- имеют высокую __устойчивость к сбоям__ и спроектированы для работы на железе с низкой стоимостью
- Open source реализации, такие как
  - HDFS (Hadoop Distributed File System)
  - CFS (Cassandra File System) дают высокую пропускную способность при доступе к данным приложения и подходят для обработки больших наборов данных.

Плюсы:

- ** Performance - спроектированы для быстрого последовательного чтения/записи, прекрасны для пакетной обработки ([MapReduce](../../arch/pattern/system.design/map.reduce.md)). Для операций со случайным чтением/записью рекомендуется использовать NoSQL БД (например HBase поверх HDFS)
- *** Scalability - масштабируется линейно, теоретически кол-во узлов не ограничено, существуют боевые реализации на 10000+ узлов
- *** Availability - репликация на три узла по-умолчанию, отсутствие единой точки отказа

## Протоколы

- Облако
  - [Object Storage](../store/object.storage.md) аля Amazon S3
- NFS
	- ![nfs](../../img/nfs.png)
	- Под unix\win
	- [Active Directory по протоколу Kerberos для NFSv4](https://www.k-max.name/windows/active-directory-as-kdc-nfsv4/)
- Common internet file system (CIFS) на базе SMB
- SMB
	- сервер\клиент Samba под unix
- [Кластерная система (Cluster)](https://itelon.ru/blog/raspredelennye-faylovye-sistemy-tekhnologicheskiy-obzor-produktovyy-obzor/) содержит несколько серверов в общей сети.
  - Gfs2
- [Что выбрать по производительности и надежности?](http://codernet.ru/amp/?page=kakoj_setevoj_protokol_obmena_fajlami_imeet_luchshuyu_proizvoditelnost_i_nadezhnost)

## Безопасность

- [Ввод в домен AD, доменная авторизация, синхронизация учетных записей из домена на unix](../os/unix.md)
