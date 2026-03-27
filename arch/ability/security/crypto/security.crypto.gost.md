# Криптоалгоритмы международные

- [Криптоалгоритмы международные](#криптоалгоритмы-международные)
  - [Зачем](#зачем)
  - [Ассимметричные алгоритмы](#ассимметричные-алгоритмы)
  - [Симметричные алгоритмы](#симметричные-алгоритмы)
  - [VPN](#vpn)
  - [Технологии](#технологии)

## Зачем

Обеспечение [криптозащиты](../security.crypto.md) данных в целях [информационной безопасности](../security.md).

## Ассимметричные алгоритмы

Криптоалгоритмы [ГОСТ Р 34.10-2012, ГОСТ 34.10-18](https://qsetup.ru/gost-vpn-chto-eto/) 256 бит:

- необходимо использовать __сертифицированные ФСБ РФ СКЗИ__
- Open Source
  - на основе __криптобиблиотеки OpenSSL 3.0__ - __полноценная криптографическая библиотека с открытым исходным кодом__, широко известна из-за расширения SSL/TLS, используемого в веб-протоколе HTTPS.
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
  - программно-аппаратный комплекс [S-terra](../../../../technology/s-terra.md)
    - [пример, мониторинг тунеля](https://habr.com/ru/companies/solarsecurity/articles/471470/)
  - программно-аппаратный комплекс [Infotecs VipNet](https://infotecs.ru/products/)
    - [пример](https://habr.com/ru/companies/solarsecurity/articles/514896/)
- выбор
  - [Устройства для сетевого шифрования](https://ib-bank.ru/bisjournal/post/1210)
  - [VPN: Cisco Anyconnect, VipNet, S-terra](https://cisoclub.ru/sravnenie-korporativnyh-sredstv-zashhity-udalennogo-dostupa/)		
  - [хорошее сравнение](https://www.anti-malware.ru/compare/certified-russian-TLS-gateways)

## Симметричные алгоритмы

## VPN

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
