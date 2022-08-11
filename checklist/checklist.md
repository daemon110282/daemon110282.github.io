# Checklist

- [Checklist](#checklist)
	- [Аналитика](#аналитика)
	- [Поставка](#поставка)
	- [Сервис](#сервис)
	- [API](#api)
	- [Links](#links)

## Аналитика

TODO https://docs.google.com/document/d/1Z6-Mzzca5ASOoVVyQ1HmlzMt29Qfv146ZUZQFA4kDGQ/edit?usp=sharing

## Поставка

Фикс данных: бэкап, откат, лог изменений, атомарность, транзакции. Всегда отдельно от изменений кода
Изменение кода фичи новые: отключать как, откатить
Регулярные: инструкция бизнесу, лог, бэкап
Puppet, поставки rpm пакетами, haproxy
Сине-зеленый деплой
Rollback
Миграции

## Сервис

сервис: Stateless, no db, log4net, sync , json, post, timeout.
Режим доступности 24/7

## API

НТ rps, sla
- Кеш на стороне лк, чтобы меньше запросов к сервису и быстрее ответ.
- Кеш фиас на сервисе данные статичны, чтобы меньше в бд ходить
- Rps 2000 в день полей правок =
- Кэширование - Ответы сервера должны иметь явное или неявное обозначение как кэшируемые или некэшируемые
- Нфт, бизнес метрики
мониторинг бд, аппов, health monitoring.
- Json метод со статусом апи
Сбор статистики обращений к веб сервису, кол-во запросов, фильтров топ
решение, использующее gRPC, оказывается на 27% быстрее решения, использующего HTTP/1.1.
Auth:
- Oauth 2, OpenID Connect, SAML
- WS-Federation (token)
- swt
- jwt
- bearer
- ntlm ldap,
- http basic
- digest
- form,
- ws security
- ssl client
- api key
- cookie
- two-factor authentication (2FA)
Swagger песочница
Http headers
Gateway api
Асинхронная загрузка от сервиса, lazy load. Лк ходит сразу к веб сервису или к себе, затем вебсервис. Я за 2е, гибче переделать на свою бд, слабая связность
Версии апи: url, param, http header
обработка сбоев веб сервиса
Http status
retry policy

## Links

https://mathieu.fenniak.net/the-api-checklist/
https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md

