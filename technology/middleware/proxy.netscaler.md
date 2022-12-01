# Netscaler

- Routing [Citrix ADC (application delivery controller) Netscaler](https://docs.citrix.com/en-us/citrix-adc/current-release/content-switching.html)
	![scheme](https://docs.citrix.com/en-us/citrix-adc/media/csw-lbconfiguration.png)
	- Device Type
	- Language
	- Cookie
	- HTTP Method
	- Layer 3/4 Data

[example](https://www.cloudedskies.co.uk/single-post/2016/11/27/Citrix-NetScaler-111-Content-Switch)

load balancing virtual server (LBVS)
content switching virtual server
	- [policy](https://docs.citrix.com/en-us/citrix-adc/current-release/citrix-adc-cache-redirection-gen-wrapper-10-con/selective-cache-redirect/configure-policies-content-switching.html), support CLI\GUI config
		- URL
		- request-based [expression](https://docs.citrix.com/en-us/citrix-adc/current-release/appexpert/policies-and-expressions/summary-examples-of-advanced-policy-expressions.html)
	- bing policy 		
		- priority
		- target LBVS	
action