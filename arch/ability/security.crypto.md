# Крипто Защита Информации

- [Крипто Защита Информации](#крипто-защита-информации)
  - [Зачем](#зачем)
  - [Паттерны](#паттерны)
    - [Криптоалгоритмы](#криптоалгоритмы)
      - [ГОСТ](#гост)
      - [Международные](#международные)
        - [Алгоритм Diffie-Hellman](#алгоритм-diffie-hellman)
    - [Подписание ЭЦП](#подписание-эцп)
    - [Имитозащита](#имитозащита)

## Зачем

Обеспечение [информационной безопасности](security.md) передаваемых данных.

## Паттерны

- [На сетевом уровне (OSI L1-L3)](https://systempb.ru/company/our-articles/vysokie-skorosti-sovremennykh-tsod-kak-vozmozhnosti-stanovyatsya-ogranicheniyami-i-chto-s-etim-delat/)
  - ![compare](https://systempb.ru/upload/medialibrary/e4a/4.jpg)
- СКЗИ
  - на программном уровне
  - на аппаратном уровне

### Криптоалгоритмы

- __[подписание](#подписание-эцп)__ - состоит из операции __хэширования__ и __шифрования__
  - ГОСТ Р 34.10 2012, 2001
- __шифрование__
  - [ГОСТ](#гост) 2015, 2012, 2001
  - [RSA\AES](#международные)
  - трафика
    - ГОСТ 28147-89
    - ГОСТ Р 34.10-2001, 34.10-2012
    - алгоритм «Кузнечик» в соответствии с ГОСТ Р 34.12-2015
- __хэширование__
  - ГОСТ Р 34.11-94, 34.11-2012
  - ГОСТ Р 31.11  
  - HMAC SHA256 симметричный
  - RS256 - ассиметричный. Приватным ключом подпись создается, публичным ключом проверяется подлинность
  - кодирование
    - base64urlas
- [__имитозащита__](#имитозащита) - защита целостности сообщения
  - В России принят алгоритм вычисления __имитовставки по ГОСТ 28147-89__
  - __Имитовста́вка__ (MAC, англ. message authentication code — код аутентификации послания)
    - средство обеспечения имитозащиты в протоколах аутентификации сообщений с доверяющими друг другу участниками
    - специальный набор символов, который добавляется к сообщению и предназначен для обеспечения его целостности и аутентификации источника данных
- [Алгоритм Diffie-Hellman](#алгоритм-diffie-hellman) - транспортный ключ

#### ГОСТ

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
  - программно-аппаратный комплекс [S-terra](../../technology/s-terra.md)
    - [пример, мониторинг тунеля](https://habr.com/ru/companies/solarsecurity/articles/471470/)
  - программно-аппаратный комплекс [Infotecs VipNet](https://infotecs.ru/products/)
    - [пример](https://habr.com/ru/companies/solarsecurity/articles/514896/)
- выбор
  - [Устройства для сетевого шифрования](https://ib-bank.ru/bisjournal/post/1210)
  - [VPN: Cisco Anyconnect, VipNet, S-terra](https://cisoclub.ru/sravnenie-korporativnyh-sredstv-zashhity-udalennogo-dostupa/)		
  - [хорошее сравнение](https://www.anti-malware.ru/compare/certified-russian-TLS-gateways)

#### Международные

Криптоалгоритмы международные:

- RSA\AES
- IPSec VPN Site-to-Site - [CISCO](https://wiki.merionet.ru/articles/nastrojka-site-to-site-ipsec-vpn-na-cisco)

##### Алгоритм Diffie-Hellman

- Варианты алгоритмов:
  - Diffie-Hellman (DH) Key Exchange - Диффи-Хеллмана
  - Elliptic Curve Diffie-Hellman (ECDH) - Диффи-Хеллмана на эллиптических кривых
- Ипользуется для того, чтобы две стороны могли создать общий секретный ключ, его еще называют «транспортный ключ», который затем используется для шифрования и дешифрования сообщений
  - Используется в TLS, IPSec, SSH
- Главное - этот ключ __создается без [прямого обмена](https://habr.com/ru/articles/726324/) им между сторонами__
- [Алгоритм](https://hostzealot.ru/blog/about-servers/realizaciya-algoritma-diffi-xellmana-na-java-dlya-klientov-i-serverov)
  - Сначала сервер и клиент должны сгенерировать свои идентификационные номера
  - На основе этих номеров сервер и клиент создают свои __собственные открытые и закрытые ключи__
  - Затем происходит __обмен открытыми ключами__, в то время как закрытыми ключами обмениваться не нужно
  - Используя свой закрытый ключ и открытый ключ сервера, клиент устанавливает общий секретный ключ, а сервер выполняет ту же последовательность действий
    - С помощью __закрытых ключей__ обе стороны __генерируют общий секретный ключ__, который затем будет использоваться выбранным алгоритмом шифрования для обеспечения безопасности связи.
    - Общий секретный ключ остается конфиденциальным
- Параметры алгоритма
  - Ключевая пара (public\private key)
    - Длина ключа не менее 1024 байт
    - формат X.509 Encoded
    - Сгенерируем приватный ключ RSA зашифрованный AES 256 с паролем "password" длиной 4096 бит (меньше 1024 считается ненадежным)
- Реализации  
  - Key Exchange
    - [Swift](https://github.com/gsurma/diffie_hellman_key_exchange)
  - ECDH - Диффи-Хеллмана на эллиптических кривых
    - [JAVA](https://docs.oracle.com/javase/7/docs/technotes/guides/security/crypto/CryptoSpec.html#DH2Ex)
    - [.NET Cryptography Next Generation (CNG) c функцией формирования ключа (KDF)](https://learn.microsoft.com/ru-ru/dotnet/api/system.security.cryptography.ecdiffiehellmancng?view=net-8.0)
    - [Swift Apple CryptoKit Сurve25519](https://ricardojpsantos.medium.com/building-and-end-to-end-encryption-framework-in-swift-cff7c8909130) [GitHub](https://github.com/ricardopsantos/RJSP_Security)
      - Используется алгоритм X25519 на [curve25519](https://developer.apple.com/documentation/cryptokit/curve25519)
    - [OpenSSL X25519](https://docs.openssl.org/master/man7/X25519/#description)
  
### Подписание ЭЦП

- __Электронная подпись (ЭЦП)__ содержит номер, сгенерированный и зашифрованный при помощи криптографического программного обеспечения.
- Алгоритм
  - Хэширование сообщения: на входе сообщение __произвольной длины__, на выходе хэш значение __фиксированной длины__
  - Шифрование хэша - не обязательно
  - При формировании ЭЦП закрытый ключ отправителя используется, проверка - открытым ключом отправителя
  - При шифровании сообщения - открытый ключ получателя, расшифрование сообщения - закрытым ключом получателя
- [Виды электронной подписи](https://astral.ru/articles/elektronnaya-podpis/6106/) по №63-ФЗ «Об электронной подписи»:
  - Простая электронная подпись
    - представляет собой уникальную комбинацию символов, которая создаётся пользователем или информационной системой и не имеет физического носителя
    - не может защитить [документ от последующего изменения](https://astral.ru/articles/elektronnaya-podpis/3021/)
  - Усиленная электронная подпись (__УЭП__) может быть [двух видов](https://uralbuh.ru/tpost/t2smzbfzi1-elektronnie-podpisi-vidi-i-sferi-primene#popup:block):
    - Усиленная неквалифицированная электронная подпись (__УНЭП__)
    - Усиленная квалифицированная электронная подпись (__УКЭП__)
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
      - Base64String
  - Интегрированная

### Имитозащита

Варианты решений

- [УНЭП](https://www.signal-com.ru/products/prikladnye-resheniya/imitozaschita-informatsii-s-autentifikatsiey-signal-com-authkey/)
- [aladdin-rd](https://developer.aladdin-rd.ru/archive/jc_mobile_sdk/2.2.1/api_android/standard/sign.html)
- [C++ Chutka/28147-89](https://github.com/Chutka/28147-89)