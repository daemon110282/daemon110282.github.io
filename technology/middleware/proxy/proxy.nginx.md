# NGINX

Реализует паттерн [Reverse Proxy](../../../arch/pattern/deployment/pattern.proxy.reverse.md) и [API Gateway](../../../arch/pattern/deployment/api.gateway.md)

- Cache
- SSL encryption
- Load balancing
- Routing
	- [Config или Lua](https://habr.com/ru/company/vdsina/blog/504308/)
- [Demo Nginx Plus](https://demo.nginx.com/)

## Version

- NGINX Plus Release 28 (R28). Based on NGINX Open Source, NGINX Plus is the only all-in-one software web server, load balancer, reverse proxy, content cache, and API gateway.

- NGINX Plus R28 is based on NGINX Open Source 1.23.2

## Deployment

- CPU, RAM
	- [Becnhmark trafic](../../ability/performance/load.test.md#trafic)

## Папаметры конфигурации

Порядок применения правил сверху вниз.
Пример структуры конфига:

upstream [name]
	server [IP]\[url]:[PORT]
server
	server_name
	proxy_set_header [header] [value]
	location [маска regexp? URL]
		rewrite [regex] [replacement] [flag]
		mirror
		allow [IP]\[подсеть]
		deny [IP]\[подсеть]
		proxy_set_header [header] [value]
		proxy_pass http://[upstream name]
		proxy_redirect [?]
	error_page [HTTP Status] /[url]

### Описание параметров

- upstream - именованная группа backend-серверов
  - Сам по себе он ничего не делает, пока на него не ссылается proxy_pass, fastcgi_pass и т.п.
- server - определяет backend-сервер, на который будут проксироваться запросы
  - proxy_set_header
  - location - определяет, как обрабатывать запросы, соответствующие определенному шаблону URI
    - proxy_set_header - позволяет установить или изменить заголовки HTTP, которые будут отправлены на backend-сервер при проксировании запроса. 
      - Переопределяет глобальный из server.
      - Без proxy_pass не работает.
    - proxy_pass - [проксирование запросов](https://serveradmin.ru/nginx-proxy_pass/)
    - rewrite - [изменять URI запроса](https://habr.com/ru/companies/otus/articles/901516/) на лету и при необходимости управлять дальнейшим потоком выполнения
      - break - прекращает выполнение текущего блока и продолжает обработку запроса в новом месте, используя измененный URI
      - last - поиск по новой маске URI, если не найдено - 404
    - proxy_redirect - [изменение заголовков Location и Refresh в ответах от проксируемого сервера](https://serveradmin.ru/nginx-proxy_redirect/)
    - mirror - [зеркалирование запросов](https://serveradmin.ru/nginx-mirror/)
    - allow/deny - [управление доступом по IP-адресу](https://serveradmin.ru/nginx-allow-deny/)
