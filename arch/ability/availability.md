# отказоустойчивость, доступность Availability (high availability). Надежность Reliability

[throttling](https://docs.microsoft.com/ru-ru/azure/architecture/patterns/throttling)

## балансировка

* https://photos.app.goo.gl/VaUseEzeFcvSJj6U9
* отказоустойчивость и масштабирование MariaDB и RabbitMQ в основе лежит разделение баз и брокеров по сервисам.
* отказоустойчивость самого балансировщика. Просто установка балансировщика тоже создаёт точку отказа: балансировщик ломается — сервис падает. 
  * Чтобы так не получалось, мы использовали HAProxy совместно с ExaBGP.
  * Балансировка HAProxy на базе DNS + BGP
  * Доступность haproxy: heartbeat между ExaBGP и HAProxy
* синхронизировать сессии. 
  * При работе через распределенные балансировщики сложно организовать сохранение информации о сессиях клиентов. 
  * Но HAProxy — один из немногих балансировщиков, который умеет это за счёт функционала Peers — возможности передачи между различными процессами HAProxy таблицы сессий. 
  * https://habr.com/ru/company/mailru/blog/474180/
* Избегайте состояния (state) в вашем приложении

## Big data 

* http://habrahabr.ru/post/272041/ MapReduce, gfs, hadoop, clickhouse, splunk, vertica, netapp


# Links

* http://habrahabr.ru/post/272041/
* https://habr.com/ru/company/mailru/blog/474180/
