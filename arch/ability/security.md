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
- HTTPS [SSL\TLS\MTLS](https://habr.com/ru/post/593507/)
- PCI DSS
- k8s
  - TLS – cert-manager
  - Key Managment
  - Key Vault
    - HashiCorp
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
- [Identity and Access Management (IAM)](../iam.md)
  - JWT
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
- cookie

## Примеры требований

- Взаимодействие осуществляется через сеть Интернет по протоколу HTTP с использованием стандартного сетевого порта
- Передача конфиденциальной информации в рамках взаимодействия не предполагается
- Взаимная аутентификация клиента и сервера на базе SSL-сертификатов, шифрование передаваемой информации с использованием протокола HTTPS (TLS 1.2)
- SSL-сертификаты должны быть выпущены доверенными удостоверяющими центрами
- В случае, если взаимодействие осуществляется по внешним сетям передачи данных (далее – внешние сети), и участвующая во взаимодействии ИС Компании не является публичной , сетевой доступ к ИС Компании из внешних сетей, открываемый для обеспечения взаимодействия, должен быть ограничен конкретными адресами внешней ИС или сетью ее владельца  и конкретными сетевыми протоколами, используемыми ИС Компании.
- Токен (id сессии), при его использовании, должен быть динамическим (актуальным только для одной сессии одного клиента) и не должен передаваться в URL.
