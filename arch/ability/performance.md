# Производительность Performance

Производительность - вид эффективности ИС, определяющий ее __мощность__ через __количество__ информационных услуг, обеспечиваемых системой в __единицу времени__.

- [Производительность Performance](#производительность-performance)
  - [Зачем](#зачем)
  - [TODO web app](#todo-web-app)
  - [Инструменты](#инструменты)
  - [Метрики](#метрики)
  - [Требования пример](#требования-пример)
  - [TODO](#todo)

## Зачем

Одна из [архитектурных характеристик](../arch.ability.md), атрибутов качества ИС.

- Ключевая метафора для понимания производительности - это __конвейер задач__. Которые прокачиваются через __трубу__.
- Количество и последовательность задач в конвейере определяются требованиями заказчика и техническими решениями программиста.
- Пропускная способность трубы определяется ее __шириной (Bandwitch) и длиной(Latency)__. Которые в свою очередь определены лежащим в фундаменте системы Hardware/Software.
- Пропускная способность системы в целом определяется тем, __сколько задач можно прокачать через трубу в единицу времени__. - Здесь важны "ширина" (объем используемого CPU/RAM/IO) и "длина" (продолжительность выполнения) задач.
- Производительность может быть повышена следующими способами:
  - Сокращением “длины” и/или “ширины” задач
  - Выполнением задач __параллельно__, ЕСЛИ в “трубе” есть для этого место.
  - Исключением задач из конвейера - выполнением их __асинхронно__.

[Паттерны](../pattern/performance/pattern.perf.md).

## TODO web app

- WIN32_ERROR_DESCRIPTION(sc-win32-status) as Description, TO_LOCALTIME
- НТ метрика от. Netexport записать, эталон. Конфигурация ПК клиента. С кешем из firebug.
- тайминг логировать
- Yslow, page speed chrome
- HTTP Error 503.2 — Service Unavailable в логах [IIS](../../technology/middleware/webserver/iis.md) есть - __очередь запросов__
- The __Time-Taken__ - field shows the length of time that it takes for a request to be processed and its response to be sent.  
  - This value gets calculated by a timer that gets initialized when the __IIS server receives the first byte of an HTTP request__, and stopped when the __last IIS response send operation completes__.  
  - It is important to note that the Time-Taken field __usually includes the time that the request and response packets are travelling over the network__.
  - Время когда был рост времени ответа совпадает с current connection пиками?
- [http-status-code](https://support.microsoft.com/ru-ru/help/943891/the-http-status-code-in-iis-7.0,-iis-7.5,-and-iis-8.0)
- [network speed??](https://serverfault.com/questions/412419/iis-how-to-tell-if-a-slow-time-taken-is-due-to-a-slow-network-connection)
- [DOS attack](https://serverfault.com/questions/288262/dos-attack-slow-post-how-to-prevent-in-iis?rq=1) "slow post"
- выявить источник и тип трафика, а также точки входа на сайт или скрипты, которые вызываются чаще всего. Причины высокой нагрузки в результатах анализа следует посмотреть:  
  - TOP 20 запросов методом POST
  - TOP 20 запросов методом GET/HEAD
  - TOP 20 IP адресов по числу хитов
  - TOP 20 ссылающихся страниц по числу хитов
- настройка трейса FREB по длительным [запросам time-taken](https://blogs.msdn.microsoft.com/docast/2016/04/28/troubleshooting-iis-request-performance-slowness-issues-using-freb-tracing/) ЗАМЕДЛЯЕТ САЙТ!  
- [long time-taken and win32 status code = 64](https://forums.iis.net/t/1169411.aspx)
  - is connection is already lost? common by proxies, to not have too many socket connections?

## Инструменты

- Php
- Стандартное логирование запросов (nginx, apache, php-fpm)
- Логирование медленных запросов БД (опция в mysql)
- Инструменты фиксации узких мест при прохождении запроса. Для php это xhprof, pinba.
- Встроенные инструменты внутри веб-приложения, например отдельный модуль трассировки.

## Метрики

[Виды метрик и примеры](performance.metric.md)

## Требования пример

- какой объем памяти выделен будет на работу приложения на хостинге?
- какой объем памяти допустимо использовать на ПК клиента для отображения отчета (максимум как мы понимаем 1ГБ- память на работу ОС XP, т.е. около 800Мб)?
- какая макс скорость канала будет от ПК пользователя до веб-сервера?
- какое время ожидания отчета в принципе допустимо для "очень большого отчета"? предлагаю определиться именно с параметрами "очень большого отчета"
- Здесь необходимо сначала дать определения большого и не большого отчета, а то слишком субъективные оценки.
- Обычный Текстовый 150 строк * 12 столбцов 12 сек.
- Большой Текстовый отчет за 3 года не более 2 мин. (ориентировочно 20000 строк*15 столбцов)
- Обычный Числовой/Графический 1 минута 3-4 группировки 200 строк * 100 столбоцов
- Максимальный Числовой/Графический максимальная скорость построения отчета – 2 минуты.

## TODO

- [UMP](https://airtable.com/embed/shrj9QkstRkVlFW0i/tblzJXJYUlj4aCHaJ)
- [speed](http://sixrevisions.com/web-performance/improve-website-speed-02/)
