# Reverse Proxy

- [Reverse Proxy](#reverse-proxy)
	- [Зачем](#зачем)
	- [Технологии](#технологии)
		- [Выбор](#выбор)

## Зачем

- Cache
	- Redirection to Cache Server
	- Integrated
- SSL encryption
- [Load balancing](load.balancing.md)
- Routing ![arch](https://docs.citrix.com/en-us/citrix-adc/media/csw-lbconfiguration.png) - __без Redirect__, подмена ИС для обработки одного и того же URL. Пример Redirect - смена домена (app.company.ru/add + new-app.company.ru/add ), одновременно работают обе ИС на разных доменах.
	- Headers (User Agent, Accept-Language)
	- URI
	- HTTP Method
	- IP:port, TCP, UDP параметры
	- Cookie
	- Payload

## Технологии

- [Nginx](../../technology/middleware/proxy/proxy.nginx.md)
- [Traefik](../../technology/middleware/proxy/router.traefik.md)
- [Netscaler](../../technology/middleware/proxy/proxy.netscaler.md)

### Выбор

- [Traefik лучше Nginx для роутинга?](https://s3rius.blog/traefik)
