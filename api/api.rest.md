# REST API

TODO
- [HTTP Status](api-http-status.md)
- [HATEOS](https://docs.microsoft.com/ru-ru/azure/architecture/best-practices/api-design#use-hateoas-to-enable-navigation-to-related-resources)

Проектирование
- https://systems.education/api-design
- Наименования физические ресурсов, свойств
  - https://proglib.io/p/21-luchshiy-metod-vyvedet-vashi-navyki-proektirovaniya-api-na-novyy-uroven-2021-04-29
  - https://proglib.io/p/15-luchshih-praktik-razrabotki-i-proektirovaniya-rest-api-2022-04-12

## Best practices

- Идемпотентность
  - GET всегда
  - POST - клиент должен контролировать повторные запросы, если не получил ответа
  - PUT - если клиент не получил ответа на запрос, просто направляет повторно 
- RESTful
  - [Яндекс.Касса](https://yookassa.ru/developers/using-api/interaction-format) 


## Links

- REST
  - https://itnan.ru/post.php?c=1&p=351890
  - [MS Guide](https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md)
  - [IBM](https://www.ibm.com/docs/ru/zos-connect/zosconnect/3.0?topic=apis-designing-restful)
- [Док-е](https://starkovden.github.io/index.html)
