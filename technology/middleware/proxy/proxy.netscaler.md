# Citrix ADC (Netscaler)

- [Citrix ADC (Netscaler)](#citrix-adc-netscaler)
	- [Зачем](#зачем)
	- [Cache](#cache)
	- [Routing](#routing)
	- [Validate Token](#validate-token)
	- [Version](#version)

## Зачем

Реализует паттерн [Reverse Proxy](../../../arch/pattern/pattern.proxy.reverse.md)

- Auth
	- [OAuth OIDC с v.12.1](https://docs.citrix.com/en-us/citrix-adc/current-release/aaa-tm/authentication-methods/oauth-authentication.html)
	- [API OIDC](https://docs.citrix.com/en-us/citrix-adc/current-release/aaa-tm/authentication-methods/oauth-authentication/api-authentication-with-adc.html)
- Routing [Citrix ADC (application delivery controller) Netscaler](https://docs.citrix.com/en-us/citrix-adc/current-release/content-switching.html)
	- [example](https://www.cloudedskies.co.uk/single-post/2016/11/27/Citrix-NetScaler-111-Content-Switch)
	![scheme](https://docs.citrix.com/en-us/citrix-adc/media/csw-lbconfiguration.png)
- Proxy
  - Проксирование статического контента.
- Load Balancer
	- [iis](https://kb.paessler.com/en/topic/22633-how-to-monitor-active-sessions-users-for-iis-7-0)
	- [configure](http://pleasework.robbievance.net/howto-configure-citrix-netscaler-to-perform-website-aware-load-balancing/)
- [Citrix ADC (NetScaler) Ingress Controller for Kubernetes](https://github.com/citrix/citrix-k8s-ingress-controller)
- [Cache](../../../arch/pattern/pattern.cache.md) - Кэширование динамического контента и сброс кэша по определенным условиями или времени
	- [Redirection](https://docs.citrix.com/en-us/citrix-adc/current-release/citrix-adc-cache-redirection-gen-wrapper-10-con.html) to Cache Server - кэш __не хранится__ в Citrix
	- [Integrated Caching](https://docs.citrix.com/en-us/citrix-adc/12-1/optimization/integrated-caching.html) - [кэш хранится](https://jgspiers.com/netscaler-integrated-caching/) в Citrix, необходима лизенция выше __Enterprise__
- [Разделение статического и динамического контента](https://habr.com/ru/articles/239411/) для снятия нагрузки.
- Проксирование и кэширование mySQL и других реляционных баз данных в целях сокращения количества выборок.
- Разделение трафика и контента по сетевым адресам, гео расположению и многим другим параметрам.
- Шифрование траффика.
- Работа в качестве DNS сервера.
- По умолчанию NS уже имеет сетевую защиту, например от ICMP флуда и др.
- Администрирование
	- [Аудит изменений конфигурации Audit Logging](https://docs.netscaler.com/en-us/citrix-adc/12-1/system/audit-logging)
	- [Логическое разделение балансировщиков Admin Partitioning](https://docs.netscaler.com/en-us/citrix-adc/12-1/admin-partition)

## Cache

- [Built-in cache redirection policies](https://docs.citrix.com/en-us/citrix-adc/12-1/citrix-adc-cache-redirection-gen-wrapper-10-con/cache-redirection-policies/builtin-cache-redirection-policies.html) and custom bound to a virtual server
- Integrated Caching

## Routing

На основе параметров:

- Device Type
- Language
- Cookie
- HTTP Method
- Layer 3/4 Data

Компоненты:

- load balancing virtual server (LBVS)
- content switching virtual server
	- [policy](https://docs.citrix.com/en-us/citrix-adc/current-release/citrix-adc-cache-redirection-gen-wrapper-10-con/selective-cache-redirect/configure-policies-content-switching.html), support CLI\GUI config
		- URL
		- request-based [expression](https://docs.citrix.com/en-us/citrix-adc/current-release/appexpert/policies-and-expressions/summary-examples-of-advanced-policy-expressions.html)
	- bing policy
		- priority
		- target LBVS
- action

## Validate Token

Два [формата токена](https://docs.citrix.com/en-us/citrix-adc/current-release/aaa-tm/authentication-methods/oauth-authentication/api-authentication-with-adc.html) для валидации:

- identifier-based or opaque access token
- __self-contained__ [jwt format only](https://docs.citrix.com/en-us/citrix-adc/current-release/aaa-tm/authentication-methods/oauth-authentication/api-authentication-with-adc.html#oauth-configuration-for-id-tokens)

[Права доступа у пользователя к API по роли](https://docs.citrix.com/en-us/citrix-adc/current-release/aaa-tm/authentication-methods/oauth-authentication.html) на основе Policy:

- uses a __positive security model__, so when you configure an __auth policy__ for some API resources, you’ll configure the "No Auth" policy for the remaining API resources to skip authentication. Otherwise, access will be denied with a 401 error message.
	- if the API resources have authentication policies, you’ll need to [create authorization policies also for those API resources](https://docs.netscaler.com/en-us/citrix-adc/current-release/aaa-tm/authorization.html). Otherwise, you’ll get a 403 error message. If you __do not need authorization checks__, you can create an __authorization policy with empty claims__.
- supports __authorization policies__ to verify access privileges to a resource, you generally check the __claims__ associated with the __token__ using authorization policies. The policies can verify whether the required claims are present in the token received with an API request.

Citrix ADC может в [Grafana статистику по отказам, запросам отдавать](https://dzone.com/articles/oauth2-tips-token-validation).

## Version

[License](https://www.citrix.com/products/citrix-adc/citrix-adc-data-sheet.html):

- Standard Edition
- Advanced Edition
- Enterprise?
- Premium Edition

- 12.1 Enterpise - use
- 13.0
