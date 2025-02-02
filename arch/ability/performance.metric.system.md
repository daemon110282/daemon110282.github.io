# System Metrics

- [System Metrics](#system-metrics)
			- [Virtual Machine](#virtual-machine)
			- [Кеш](#кеш)
			- [Балансирощик](#балансирощик)
			- [СУБД](#субд)
			- [Backend](#backend)
			- [Контейнеризация](#контейнеризация)
			- [File Storage](#file-storage)
			- [MessageBus](#messagebus)

## Зачем

Вид [метрик производительности](performance.metric.md).

Это данные о производительности низкого уровня (уровень базовой инфраструктуры). Они обычно нацелены на ключевые показатели эффективности, связанные с памятью, сетевой утилизацией, активностью диска, использованием процессора в разрезе компонентов ИС:

- CPU
  - Нагрузка на CPU - Процент
  - CPU User time
  - CPU System time (Может  показывать на неэффективный ввод-вывод, т.е. слишком большое количество мелких операций)
- HDD
  - Дисковые операции СХД	- Количество, частота следования в секунду
  - HDD Number of reads IOPS
  - HDD Number of writes IOPS
  - HDD bytes readed
  - HDD bytes written
- Network
  - Сетевые операции, канал забит -	Количество, частота следования в секунду
  - объем трафика bandwidth, какие урлы сколько трафика генерируют
  - трафик на сетевых интерфейсах
  - Network Number of reads
  - Network Number of writes
  - Network bytes readed
  - Network bytes written
- RAM
  - RAM Private space used by application
  - RAM Shared space used by application
  - RAM Number of page faults (насколько локализованы данные приложения в памяти?)
  - Использование физической/виртуальной памяти	- Байты, килобайты, мегабайты, гигабайты
  - Выделение блоков памяти - Количество байтов, количество объектов, частота следования в секунду

## Virtual Machine

- параметры [виртуалки VMWare](https://habrahabr.ru/post/259087/)

## Кеш
  
- redis
  - Утилизация памяти
  - операции чтения\записи с диска
- Hit Rate Количество, частота попаданий в кеш	в секунду

## Балансирощик

- [балансировщик](../pattern/deployment/load.balancing.md) прокси, nginx, netscaler - как балансировка на ноды работает, время ответ нод балансировщику

## СУБД

- [mssql](../../technology/db/mssql/mssql.performance.metric.md)
- [postgresql](../../technology/db//postgresql/postgresql.performance.metric.md)

## Backend

- [IIS](../../technology/middleware/webserver/iis.performance.metric.md)

## Контейнеризация

- [k8s](../../technology/ci-cd/k8s.md)

## File Storage

- [minio](../../technology/store/minio.md)

## MessageBus

- [rmq](../../technology/middleware/messagebus/rmq.md)
