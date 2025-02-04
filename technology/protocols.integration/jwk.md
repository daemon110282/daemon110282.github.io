# JSON Web Key (JWK)

## Зачем

Структура данных в формате JSON, представляющая криптографический ключ.

## Структура

[Структура](https://wiki.openbankingrussia.ru/security/json-web-key-structure):

- Обязательные
  - "kty" : "RSA", // key type -- тип семейства криптографических алгоритмов использованных для ключа
  - "e" : "...", // публичная экспонента ключа в виде HexToBase64UrlEnodedByte
  - "n" : "..." // modulus ключа в виде  HexToBase64UrlEnodedByte
- Необязательные
  - тодо
