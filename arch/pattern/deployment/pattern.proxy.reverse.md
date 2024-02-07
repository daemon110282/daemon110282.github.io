# Reverse Proxy

- [Reverse Proxy](#reverse-proxy)
	- [Зачем](#зачем)
	- [Технологии](#технологии)
		- [Выбор](#выбор)

## Зачем

- [Cache](https://habr.com/ru/companies/otus/articles/741136/)
	- Redirection to Cache Server
	- Integrated
- SSL encryption
- TLS Termination
- [Load balancing](load.balancing.md)
- Routing ![arch](https://docs.citrix.com/en-us/citrix-adc/media/csw-lbconfiguration.png) - __без Redirect__, подмена ИС для обработки одного и того же URL. Пример Redirect - смена домена (app.company.ru/add + new-app.company.ru/add ), одновременно работают обе ИС на разных доменах.
	- Headers (User Agent, Accept-Language)
	- URI
	- HTTP Method
	- IP:port, TCP, UDP параметры
	- Cookie
	- Payload

## Плюсы и минусы

Минусы:

- Единая точка отказа

## Технологии

- [Nginx](../../../technology/middleware/proxy/proxy.nginx.md)
- [Traefik](../../../technology/middleware/proxy/router.traefik.md)
- [Netscaler](../../../technology/middleware/proxy/proxy.netscaler.md)

### Выбор

- [Nginx Plus vs Netscaler performance](https://www.nginx.com/blog/nginx-plus-vs-citrix-netscaler-price-performance-comparison/)
- [Traefik лучше Nginx для роутинга?](https://s3rius.blog/traefik)
