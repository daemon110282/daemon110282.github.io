# Криптоалгоритмы международные

- [Криптоалгоритмы международные](#криптоалгоритмы-международные)
  - [Зачем](#зачем)
  - [Ассимметричные алгоритмы](#ассимметричные-алгоритмы)
  - [Симметричные алгоритмы](#симметричные-алгоритмы)
  - [VPN](#vpn)
  - [Алгоритм Diffie-Hellman](#алгоритм-diffie-hellman)
  - [Технологии](#технологии)

## Зачем

Обеспечение [криптозащиты](../security.crypto.md) данных в целях [информационной безопасности](../security.md).

## Ассимметричные алгоритмы

- [RSA](https://www.devglan.com/online-tools/rsa-encryption-decryption)
  - Padding: Proper __padding schemes__ (e.g., OAEP, PKCS#1 v1.5) are crucial to prevent certain cryptographic attacks and ensure secure encryption.
    - Optimal Asymmetric Encryption Padding (OAEP) - шифрование
      - [algorithm](https://connect2id.com/products/nimbus-jose-jwt/examples/jwt-with-rsa-encryption)
        - RSA_OAEP_256 - RSAES using Optimal Asymmetric Encryption Padding (OAEP) (RFC 3447), with the SHA-256 hash function and the MGF1 with SHA-256 mask generation function
        - RSA_OAEP - __DEPRECATED__ - RSAES using Optimal Asymmetric Encryption Padding (OAEP) (RFC 3447), with __the default parameters specified by RFC 3447 in section [A.2.1](https://datatracker.ietf.org/doc/html/rfc3447#appendix-A.2.1)__. Use of this encryption algorithm is no longer recommended, use RSA_OAEP_256 instead.
          - hash: sha1
          - maskGenAlgorithm: mgf1SHA1
          - pSourceAlgorithm: empty
    - RSASSA-PKCS1-v1_5 - подпись\шифрование
    - RSA-PSS - подпись

## Симметричные алгоритмы

- AES modes: CTR, CBC, GCM

## VPN

- IPSec VPN Site-to-Site - [CISCO](https://wiki.merionet.ru/articles/nastrojka-site-to-site-ipsec-vpn-na-cisco)

## Алгоритм Diffie-Hellman

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
  
## Технологии

TODO
