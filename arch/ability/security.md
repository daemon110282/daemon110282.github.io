# Security

- [Security](#security)
  - [Крипто Защита Информации (СКЗИ)](#крипто-защита-информации-скзи)
  - [Криптоалгоритмы](#криптоалгоритмы)
  - [API](#api)
  - [Шифрование канала связи (трафика) mTLS, VPN туннель](#шифрование-канала-связи-трафика-mtls-vpn-туннель)
    - [Криптоалгоритмы](#криптоалгоритмы-1)
  - [Технологии](#технологии)
  - [Примеры требований](#примеры-требований)

TODO

- АСП
- Аутентификация HTTPS 
  - [SSL\TLS](../../technology/protocols.integration/tls.md)
  - [MTLS](../../technology/protocols.integration/tls.md)
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

- __подписание__ - состоит из операции __хэширования__ и __шифрования__
  - ГОСТ Р 34.10 2012, 2001 
- __шифрование__
  - ГОСТ 2015, 2012, 2001
  - RSA
  - трафика
    - ГОСТ 28147-89
    - ГОСТ Р 34.10-2012
    - алгоритм «Кузнечик» в соответствии с ГОСТ Р 34.12-2015
- __хэширование__
  - ГОСТ Р 31.11  
  - HMAC SHA256 симметричный
  - RS256 - ассиметричный. Приватным ключом подпись создается, публичным ключом проверяется подлинность
  - кодирование
    - base64urlas
- имитозащита - защита целостности сообщения

### ГОСТ 

- Криптоалгоритмы [ГОСТ Р 34.10-2012, ГОСТ 34.10-18](https://qsetup.ru/gost-vpn-chto-eto/) 256 бит
  - необходимо использовать __сертифицированные ФСБ РФ СКЗИ__
  - Open Source
    - на основе __криптобиблиотеки OpenSSL__ - __полноценная криптографическая библиотека с открытым исходным кодом__, широко известна из-за расширения SSL/TLS, используемого в веб-протоколе HTTPS. 
      - Поддерживает почти все низкоуровневые алгоритмы хеширования, шифрования и электронной подписи
      - криптографических стандартов: 
        - RSA, DH, DSA, сертификаты X.509, подписывать их, формировать CSR и CRT, шифровать данные и тестировать SSL/TLS соединения
        - ГОСТ через расширение библиотеки OpenSSL [ГОСТ алгоритмами](https://github.com/gost-engine/engine/blob/master/README.prov.md) [gost-engine](https://github.com/gost-engine/engine)
      - Proxy nginx
        - 2022 nginx 1.23.2 + openssl 3.0.5 + gost engine 3.0.1 + TLSv1.2 [docker образ](https://github.com/vheathen/docker-nginx-openssl3-gost)
        - 2018 [docker образ](https://habr.com/ru/articles/353534/) [GIT](https://github.com/rnixik/docker-openssl-gost)
          - Библиотека OpenSSL 1.1.0g 
          - gost-engine
      - [stunnel](https://habr.com/ru/companies/aktiv-company/articles/477650/) - программа, на которую можно переложить всю логику [шифрования трафика](https://www.stunnel.org/docs.html) между сервером и клиентом
        - stunnel:port openssl-gost-stunnel (>=v.1.0.2)
        - шифрование через криптобиблиотеку openssl и расширешение библиотеки ГОСТ алгоритмами gost-engine
        - [docker-openssl-gost](https://github.com/rnixik/docker-openssl-gost)
        - криптотуннель с валидным ключом, подписанным самим «КриптоПро», и с алгоритмом шифрования [GOST_2012, 512 бит](https://www.anti-malware.ru/practice/methods/save-company-budget-or-how-build-crypto-tunnel-in-accordance-with-GOST)
    - на основе __криптобиблиотек КриптоПро__
      - Nginx вариант с библиотекой [КриптоПро](https://habr.com/ru/articles/353534/#comment_10757142)
      - 2018 [Docker контейнер с CryptoPro 4 и nginx](https://github.com/navyzet/crypto-proxy)
      - Win Server [IPSec VPN](https://itnan.ru/post.php?c=1&p=328770) с КриптоПро CSP и [КриптоПро IPSec](https://www.cryptopro.ru/products/ipsec/vpngost)
  - Commercial
    - аппаратные устройства [КриптоПро NGate](https://www.cryptopro.ru/products/ngate)
    - Аутсорс с арендой оборудования [Ростелеком Солар](https://rt-solar.ru/services/vpn/)
    - аппаратные устройства [TSS Diamond](https://qsetup.ru/gost-vpn-chto-eto/)
    - программно-аппаратный комплекс [S-terra](../../technology/s-terra.md)
      - [пример, мониторинг тунеля](https://habr.com/ru/companies/solarsecurity/articles/471470/)
    - программно-аппаратный комплекс [Infotecs VipNet](https://infotecs.ru/products/)
      - [пример](https://habr.com/ru/companies/solarsecurity/articles/514896/)
  - выбор
    - https://ib-bank.ru/bisjournal/post/1210 		
    - https://cisoclub.ru/sravnenie-korporativnyh-sredstv-zashhity-udalennogo-dostupa/		
    - [хорошее сравнение](https://www.anti-malware.ru/compare/certified-russian-TLS-gateways)

### Международные

- Криптоалгоритмы международные RSA\AES
  - IPSec VPN Site-to-Site - [CISCO](https://wiki.merionet.ru/articles/nastrojka-site-to-site-ipsec-vpn-na-cisco)

## Подписание ЭЦП

- __Электронная подпись (ЭЦП)__ содержит номер, сгенерированный и зашифрованный при помощи криптографического программного обеспечения.
- Алгоритм
  - Хэширование сообщения: на входе сообщение __произвольной длины__, на выходе хэш значение __фиксированной длины__
  - Шифрование хэша - не обязательно
  - При формировании ЭЦП закрытый ключ отправителя используется, проверка - открытым ключом отправителя
  - При шифровании сообщения - открытый ключ получателя, расшифрование сообщения - закрытым ключом получателя
- Три [вида электронной подписи](https://astral.ru/articles/elektronnaya-podpis/6106/):
  - Простая электронная подпись
  - Усиленная неквалифицированная электронная подпись (УНЭП)
  - Усиленная квалифицированная электронная подпись (УКЭП)
    - получают в аккредитованном удостоверяющем центре (УЦ)
- [Форматы ЭЦП](https://astral.ru/articles/elektronnaya-podpis/6106/)
  - Присоединённая 
    - содержится в самом документе
    - чтобы прочитать документ потребуется ПО
  - Отсоединённая
    - содержится в отдельном файле .SIG
    - чтобы прочитать документ НЕ потребуется ПО, не изменяет подписываемый документ
    - [Как создать программно в КриптоПро](https://www.cryptopro.ru/forum2/default.aspx?g=posts&t=18608)
    - в формате 
      - [pkcs 7](https://astral.ru/articles/elektronnaya-podpis/6106/) через Приложение __cryptcp__ для КриптоПро CSP
        - в кодировке __DER__ или __BASE64__
      - [Base64String]()
  - Интегрированная

## Шифрование канала связи (трафика) TLS, mTLS, VPN туннель

![type](../../img/technology/vpn.type.jpg)

Технологии и протоколы шифрования и имитозащиты передаваемого трафика:

- [SSL VPN\TLS VPN\mTLS VPN](https://www.pvsm.ru/vpn/32300) 
  - устанавливает безопасный удаленный доступ между личным устройством и офисной сетью __через веб-портал и тоннель__, защищенный SSL\TLS
  - can __only support browser-based__ applications 
    - роль клиента в SSL\TLS\mTLS может исполнять любой современный __браузер__
  - web servers always __аутентификация по цифровым сертификатам__  
- [Site-to-Site VPN](https://docs.selectel.ru/servers-and-infrastructure/firewalls/fortigate/vpn-site-to-site/#:~:text=VPN%20типа%20Site-to-site%20—%20VPN-соединение%2C,сетями%20удалённых%20филиалов%20или%20отделов) выступает в качестве внутренней __частной сети__ для компаний со множеством подразделений в __отдельных географических регионах__ на основе:
  - GRE 
  - L2TPv3
  - IPSec VPN Стандарт RFC2401-2412
    - может работать [в двух режимах](https://habr.com/ru/articles/170895/): туннельном и транспортном
    - __защищают весь трафик между двумя узлами__, позволяя пользователю в случае удалённого подключения к доверенной сети быть её полноправным членом, как если бы он находился непосредственно в ней.
    - __аутентификация__ сторон при использовании технологии VPN обычно выполняется на основе __сертификатов (IPsec)__ или предварительно __распределённых секретных ключей (IPsec, IPlir)__
    - включает протоколы
      - ESP (Encapsulating Security Payload – безопасная инкапсуляция полезной нагрузки)
      - AH (Authentication Header – заголовок аутентификации)
      - IKE (Internet Key Exchange protocol – протокол обмена ключами) 
    - [host to net](https://habr.com/ru/articles/504484/)
    - net to net
    - transport mode
- __VPN клиент или открытая сеть VPN__
  - В VPN клиенте администратор сети несет ответственность за установку и настройку VPN-сервиса. 
  - Затем __файл конфигурации распределяется клиентам__ или конечным пользователям, которым необходим доступ. 
  - После этого клиент может установить VPN-подключение к сети компании на локальном компьютере или мобильном устройстве. 
- OpenVPN
- PPTP (Point-to-Point Tunneling Protocol)
- DTLS

## Сертификаты

- Виды сертификатов
  - client certificate для аунтентификации Mutual TLS (mTLS) 
  - self signed certificate
- Типы форматов сертификатов
  - сертификат удостоверяющего центра CA __.PEM__
  - client certificate
    - __.CRT__ file and the __.KEY__ file  
    - __.PFX__ file for your certificate
  - [Пример запроса с сертификатом в Postman](https://learning.postman.com/docs/sending-requests/certificates/)
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
  - [SSO](../sso.md)
    - Oauth 2, OpenID Connect, SAML
    - WS-Federation (token)
    - two-factor authentication (2FA)

## Примеры требований

- Взаимодействие осуществляется через сеть Интернет по протоколу HTTP с использованием стандартного сетевого порта
- Передача конфиденциальной информации в рамках взаимодействия не предполагается
- Взаимная аутентификация клиента и сервера на базе SSL-сертификатов, шифрование передаваемой информации с использованием протокола HTTPS (TLS 1.2)
- SSL-сертификаты должны быть выпущены доверенными удостоверяющими центрами
- В случае, если взаимодействие осуществляется по внешним сетям передачи данных (далее – внешние сети), и участвующая во взаимодействии ИС Компании не является публичной , сетевой доступ к ИС Компании из внешних сетей, открываемый для обеспечения взаимодействия, должен быть ограничен конкретными адресами внешней ИС или сетью ее владельца  и конкретными сетевыми протоколами, используемыми ИС Компании.
- Токен (id сессии), при его использовании, должен быть динамическим (актуальным только для одной сессии одного клиента) и не должен передаваться в URL.
