# Reverse Proxy

## Зачем

- Cache
- SSL encryption
- Load balancing
- Routing ![arch](https://docs.citrix.com/en-us/citrix-adc/media/csw-lbconfiguration.png) - __без Redirect__, подмена ИС для обработки одного и того же URL. Пример Redirect - смена домена (app.company.ru/add + new-app.company.ru/add ), одновременно работают обе ИС на разных доменах.
	- Headers (User Agent, Accept-Language)	
	- URI
	- HTTP Method
	- IP:port, TCP, UDP параметры
	- Cookie
	- Payload


## Технологии

- [Nginx](../../technology/middleware/proxy.nginx.md)
- [Traefik](../../technology/middleware/router.traefik.md)
- [Citrix ADC (application delivery controller) Netscaler](https://docs.citrix.com/en-us/citrix-adc/current-release/content-switching.html)

## Compare

- [Traefik лучше Nginx для роутинга?](https://s3rius.blog/traefik)