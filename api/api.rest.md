# REST API

- [REST API](#rest-api)
  - [Термины](#термины)
  - [Проектирование](#проектирование)
    - [Качества хорошего API](#качества-хорошего-api)
  - [Patterns](#patterns)
    - [Файлы](#файлы)

## Термины

- Ресурс
- URL
- Headers
- [HTTP Status](api-http-status.md)
- [HATEOS](https://docs.microsoft.com/ru-ru/azure/architecture/best-practices/api-design#use-hateoas-to-enable-navigation-to-related-resources)

## Проектирование

![design](https://miro.medium.com/max/720/1*lFGlOSW19H184tUt9DhvUg@2x.webp)

- <https://systems.education/api-design>
- TODO [Сергей Константинов. API](https://twirl.github.io/The-API-Book/API.ru.html)
  - метод (__сигнатура__)
    - Стремитесь к тому, чтобы из __сигнатуры функции было абсолютно ясно, что она делает, что принимает на вход и что возвращает__. Вообще, при прочтении кода, работающего с вашим API, должно быть сразу понятно, что, собственно, он делает — без подглядывания в документацию.
    - Избегайте неявных частичных обновлений
    - Рекомендации по [наименованию](https://proglib.io/p/21-luchshiy-metod-vyvedet-vashi-navyki-proektirovaniya-api-na-novyy-uroven-2021-04-29) физических ресурсов, [свойств](https://proglib.io/p/15-luchshih-praktik-razrabotki-i-proektirovaniya-rest-api-2022-04-12)
    - Конечные точки в URL – [имя существительное, не глагол](https://habr.com/ru/post/351890/), Множественное число. Примеры:
      - https://{domain}/{service}/v1/customers/1
      - https://{domain}/{service}/{version}/{resourcepath}?fields={fieldId,*}
      - https://{domain}/files/v3/documents/ab34de
  - свойства  метода (__контракт\интерфейс__)
    - Указывайте использованные стандарты
    - При этом существует «золотое правило», применимое не только к API, но ко множеству других областей проектирования: человек комфортно удерживает в краткосрочной памяти __7±2 различных объекта__. Манипулировать большим числом сущностей человеку уже сложно. Это правило также известно как __«закон Миллера»__. Бороться с этим законом можно только одним способом: __декомпозицией__. На каждом уровне работы с вашим API нужно стремиться логически группировать сущности под одним именем там, где это возможно и таким образом, чтобы разработчику никогда не приходилось оперировать более чем 10 сущностями одновременно. Должны выделить в структуре __информационные домены__: какие поля логически относятся к одной предметной области.
    - Сущности должны именоваться конкретно
    - Тип поля должен быть ясен из его названия
  - __Возможные ошибки__
    - Должны быть информативными
  - Пример запроса\ответа

### Качества хорошего API

- очевидность
- читабельность
- консистентен: при разработке новой функциональности, т.е. при обращении к каким-то незнакомым сущностям в API, разработчик может действовать по аналогии с уже известными ему концепциями API, и его код будет работать.

## Patterns

- TODO
  - [Patterns REST API](https://microservice-api-patterns.org/)
  - [MS Guide](https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md)
  - [IBM](https://www.ibm.com/docs/ru/zos-connect/zosconnect/3.0?topic=apis-designing-restful)
  - [CISCO](https://github.com/CiscoDevNet/api-design-guide)
- Security
  - [REST Best Practice - TLS, OAuth, OIDC SSO](https://stackoverflow.blog/2021/10/06/best-practices-for-authentication-and-authorization-for-rest-apis/?utm_campaign=APISecurity%20newsletter&utm_medium=email&_hsmi=204867978&_hsenc=p2ANqtz-94r6UDHzZG48tgtd0Sz6OiZicy6tTBQysQKtk0WzhZXlXrXBucIld80QE3Gll1Le1lxnwNhNqu-pySFps1AsqeR8MQrg&utm_content=204868574&utm_source=hs_email)
- АвтоДокументация [OpenApi](openapi.md)
- Версионность
  - Версия вашего приложения
- [Сортировка](https://gist.github.com/fomvasss/c1221b2464be94870f7f823c74520665)
- [Пагинация](https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md#98-pagination)
  - [Offset Pagination](https://www.moesif.com/blog/technical/api-design/REST-API-Design-Filtering-Sorting-and-Pagination/#offset-pagination)
  - Seek Pagination
  - [HATEOS](https://developer.atlassian.com/server/confluence/pagination-in-the-rest-api/)
- [Фильтрация](https://www.moesif.com/blog/technical/api-design/REST-API-Design-Filtering-Sorting-and-Pagination/)
- Использование SSL
- HTTP методы
  - [Методы, JSON, URI](https://habr.com/ru/post/447322/)
  - [SRP паттерн](../arch/patterns.md)
- Эффективное использование [кодов ответов HTTP](api-http-status.md)
- [Идемпотентность](../arch/pattern/idempotent.md)
- RESTful
  - [Пример Яндекс.Касса](https://yookassa.ru/developers/using-api/interaction-format)
- Стандартизировать дополнительные машиночитаемые данные в ответе, предпочтительно в форме заголовков HTTP (потому что чтение заголовков не требует вычитывания и разбора всего тела ответа, так что промежуточные прокси и гейтвеи смогут понять семантику ошибки без дополнительных расходов; а так же их можно логировать.
- [Валидация входных данных](https://github.com/Sairyss/backend-best-practices)

CheckList
- [43 Things To Think About When Designing, Testing, and Releasing your API](https://mathieu.fenniak.net/the-api-checklist/)

### Файлы

- Download
  - Use [Content Delivery Network (CDN)](../arch/system.class/cdn.md)
  - Массив байтов, не в JSON. Файл нужно передавать [под его "родным"](https://code-maze.com/aspnetcore-web-api-return-file/) __Content-Type__
  - Request the file, GET /downloads/123, file not yet completed, __response 102 Processing__ (and an optional progress and/or ETA, if available)
  - Request the file, GET /downloads/123, file completed, __response 303__ See other, Location: https://cdn/full-path-to-generated.file.pdf
  - [Support partial responses for large binary resources](https://learn.microsoft.com/en-us/azure/architecture/best-practices/api-design#support-partial-responses-for-large-binary-resources)
- [Upload](https://tyk.io/blog/api-design-guidance-file-upload/)
  - Не использовать [base64 кодирования](https://tyk.io/blog/api-design-guidance-file-upload/)
  - [OWASP Unrestricted File Upload](https://owasp.org/www-community/vulnerabilities/Unrestricted_File_Upload)
  - [Option](https://tyk.io/blog/api-design-guidance-file-upload/)
    - Direct file upload
        - Create a new file, POST /downloads (endpoint name an example), __response 202 Accepted, Location: /downloads/123__ (unique ID of the download). If we're sharing the files among users, the same POST might return the same ID (all the users are waiting for the same file to generate)
    - Multipart HTTP request
    - Two-step metadata + upload
  - [HTTP Status](api-http-status.md)
    - 413 Payload Too Large (if exceeding max)
    - 507 Insufficient Storage (server full).