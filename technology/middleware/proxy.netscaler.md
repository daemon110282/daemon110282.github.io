# Citrix ADC (Netscaler)

Реализует паттерн [Reverse Proxy](../../arch/pattern/pattern.proxy.reverse.md)
- Auth
	- [OAuth OIDC с v.12.1](https://docs.citrix.com/en-us/citrix-adc/current-release/aaa-tm/authentication-methods/oauth-authentication.html)
	- [API OIDC](https://docs.citrix.com/en-us/citrix-adc/current-release/aaa-tm/authentication-methods/oauth-authentication/api-authentication-with-adc.html)
- Routing [Citrix ADC (application delivery controller) Netscaler](https://docs.citrix.com/en-us/citrix-adc/current-release/content-switching.html)
	- [example](https://www.cloudedskies.co.uk/single-post/2016/11/27/Citrix-NetScaler-111-Content-Switch)
	![scheme](https://docs.citrix.com/en-us/citrix-adc/media/csw-lbconfiguration.png)
- Proxy	
- Load Balancer
	- https://kb.paessler.com/en/topic/22633-how-to-monitor-active-sessions-users-for-iis-7-0
  	- http://pleasework.robbievance.net/howto-configure-citrix-netscaler-to-perform-website-aware-load-balancing/
- [Citrix ADC (NetScaler) Ingress Controller for Kubernetes](https://github.com/citrix/citrix-k8s-ingress-controller)

## Rounting

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