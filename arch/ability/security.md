# Security

- [Security](#security)
  - [Крипто Защита Информации (СКЗИ)](#крипто-защита-информации-скзи)
  - [Криптоалгоритмы](#криптоалгоритмы)
  - [API](#api)
  - [Технологии](#технологии)
  - [Примеры требований](#примеры-требований)

TODO

- АСП
- ЭЦП
- Криптоалгоритмы
- HTTPS [SSL\TLS\MTLS](../../technology/protocols.integration/tls.md)
- PCI DSS
- k8s
  - TLS – cert-manager
  - Key Managment, Key Vault
    - HashiCorp Vault 
    - альтернативы [CyberArk, AWS](https://datafloq.com/read/5-compelling-alternatives-hashicorp-vault/)
- [Zero Trust](https://t.me/ru_arc/136)

## Крипто Защита Информации (СКЗИ)

- [На сетевом уровне (OSI L1-L3)](https://systempb.ru/company/our-articles/vysokie-skorosti-sovremennykh-tsod-kak-vozmozhnosti-stanovyatsya-ogranicheniyami-i-chto-s-etim-delat/)
  - ![compare](https://systempb.ru/upload/medialibrary/e4a/4.jpg)

## Криптоалгоритмы

- подписание - состоит из операции хэширования и шифрования
  - ГОСТ 34.10
- шифрование
  - ГОСТ 2012, 2001
  - RSA
- хэширования
  - ГОСТ 31.11
  - SHA

## API

- [API Security Audit](https://docs.42crunch.com/latest/content/concepts/api_contract_security_audit.htm)
- [OWASP](https://42crunch.com/owasp-api-security-top-10/)
- [check api tools](https://platform.42crunch.com/)
- [tools for check api sec](https://github.com/arainho/awesome-api-security)

## Шифрование канала связи (трафика) mTLS, VPN туннель 

Технологии и протоколы:
- [SSL\TLS VPN](https://www.pvsm.ru/vpn/32300)  
- IPSec VPN
  - [host to net](https://habr.com/ru/articles/504484/)
  - net to net
  - transport mode
- DTLS

Варианты:

- Криптоалгоритмы [ГОСТ Р 34.10-2012](https://qsetup.ru/gost-vpn-chto-eto/) 256 бит, необходимо использовать сертифицированные ФСБ РФ СКЗИ 
  - Open Source
    - на основе OpenSSL - полноценная криптографическая библиотека с открытым исходным кодом, широко известна из-за расширения SSL/TLS, используемого в веб-протоколе HTTPS. Поддерживает почти все низкоуровневые алгоритмы хеширования, шифрования и электронной подписи, а также реализует большинство популярных криптографических стандартов, в том числе позволяет создавать ключи RSA, DH, DSA, сертификаты X.509, подписывать их, формировать CSR и CRT, шифровать данные и тестировать SSL/TLS соединения.        
      - Proxy nginx 
        - 2022 nginx 1.23.2 + openssl 3.0.5 + gost engine 3.0.1 + TLSv1.2 [docker образ](https://github.com/vheathen/docker-nginx-openssl3-gost)
        - 2018 [docker образ](https://habr.com/ru/articles/353534/) [GIT](https://github.com/rnixik/docker-openssl-gost)
          - Библиотека OpenSSL 1.1.0g 
          - [gost-engine](https://github.com/gost-engine/engine) - reference implementation of the Russian [ГОСТ крипоалгоритмы](https://github.com/gost-engine/engine/blob/master/README.prov.md) for OpenSSL
      - [stunnel](https://habr.com/ru/companies/aktiv-company/articles/477650/) - программа, на которую можно переложить всю логику шифрования трафика между сервером и клиентом
        - stunnel:port openssl-gost-stunnel (>=v.1.0.2)
    - на основе КриптоПро
      - Nginx вариант с библиотекой [КриптоПро](https://habr.com/ru/articles/353534/#comment_10757142)
      - 2018 [Docker контейнер с CryptoPro 4 и nginx](https://github.com/navyzet/crypto-proxy)
      - Win Server [IPSec VPN](https://itnan.ru/post.php?c=1&p=328770) с КриптоПро CSP и [КриптоПро IPSec](https://www.cryptopro.ru/products/ipsec/vpngost)
  - Commercial
    - аппаратные устройства [КриптоПро NGate](https://www.cryptopro.ru/products/ngate)
    - Аутсорс с арендой оборудования [Ростелеком Солар](https://rt-solar.ru/services/vpn/)
    - аппаратные устройства [TSS Diamond](https://qsetup.ru/gost-vpn-chto-eto/)
    - программно-аппаратный комлекс [S-terra](../../technology/s-terra.md)
- Криптоалгоритмы международные RSA

- [Проверка алгоритма подписи примененного к сертификату](https://sysos.ru/?p=589)
  - 1.2.643.7.1.1.3.2, то сертификат сгенерирован по ГОСТ Р 34.10-2012. 
  - Если установлен КриптоПро, то в Алгоритме подписи будет отображаться ГОСТ Р 34.11-2012/34.10-2012 256 бит.

## Технологии

- [КриптоПро](https://www.cryptopro.ru/products/csp/compare#supported_algorithms)
- КриптоАРМ
  - Клиент
    - [Linux](https://cryptoarm.ru/documentation/kak-ustanovit-kriptoarm-gost-na-platformu-Linux)
  - [КриптоАрм Сервер](https://cryptoarm.ru/news/kriptoarm-server/)
    - [КриптоАрм Сервер Git](https://github.com/CryptoARM/CryptoARMGOST-Web)
- Крипто Провайдеры
  - [КриптоПро CSP](https://www.cryptopro.ru/products/csp/compare)
  - [OpenSSL ГОСТ](https://redos.red-soft.ru/base/manual/safe-redos/gost-in-openssl/)
- Web Application firewall (WAF) Межсетевые экраны
  - [PT Application Firewall](https://www.tadviser.ru/index.php/%D0%9F%D1%80%D0%BE%D0%B4%D1%83%D0%BA%D1%82:PT_Application_Firewall)
    - Сертификация ФСТЭК
    - OWASP TOP 10
    - DDOS
- [Identity and Access Management (IAM)](../system.class/iam.md)
  - [JWT](../../technology/jwt.md)
  - [SSO](../sso.md)
    - Oauth 2, OpenID Connect, SAML
    - WS-Federation (token)
    - two-factor authentication (2FA)
- swt
- bearer
- ntlm ldap,
- http basic
- digest
- form
- ws security
- ssl client
- api key
- [cookie](https://blog.bytebytego.com/i/86976622/token-cookie-session)
![scheme](https://blog.bytebytego.com/p/ep34-session-cookie-jwt-token-sso)

## Примеры требований

- Взаимодействие осуществляется через сеть Интернет по протоколу HTTP с использованием стандартного сетевого порта
- Передача конфиденциальной информации в рамках взаимодействия не предполагается
- Взаимная аутентификация клиента и сервера на базе SSL-сертификатов, шифрование передаваемой информации с использованием протокола HTTPS (TLS 1.2)
- SSL-сертификаты должны быть выпущены доверенными удостоверяющими центрами
- В случае, если взаимодействие осуществляется по внешним сетям передачи данных (далее – внешние сети), и участвующая во взаимодействии ИС Компании не является публичной , сетевой доступ к ИС Компании из внешних сетей, открываемый для обеспечения взаимодействия, должен быть ограничен конкретными адресами внешней ИС или сетью ее владельца  и конкретными сетевыми протоколами, используемыми ИС Компании.
- Токен (id сессии), при его использовании, должен быть динамическим (актуальным только для одной сессии одного клиента) и не должен передаваться в URL.
