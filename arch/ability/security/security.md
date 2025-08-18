# Security Информационная безопасность

- [Security Информационная безопасность](#security-информационная-безопасность)
  - [Зачем](#зачем)
  - [Виды атак](#виды-атак)
  - [Паттерны](#паттерны)
    - [Триггеры для подключения ОИБ, анализа ИБ](#триггеры-для-подключения-оиб-анализа-иб)
    - [TODO](#todo)
    - [Аутентификация](#аутентификация)
    - [Авторизация](#авторизация)
  - [Антипаттерны](#антипаттерны)
  - [Сертификаты](#сертификаты)
  - [Технологии](#технологии)
  - [Примеры требований](#примеры-требований)

## Зачем

Информационная безопасность - комплекс мер, которые нужны, чтобы защитить от утечки или взлома программы, компьютерные системы и данные.

[Матрица ИТ безопасности](https://www.ninjaone.com/blog/it-security-checklist-protect-your-business/):

- Device/Endpoint security
- Network security
- Application security
- Data security
- User security

## Виды атак

- [Атаки загрязнения прототипа](https://habr.com/ru/companies/piter/articles/841098/)
- [Кликджекинг](https://habr.com/ru/companies/piter/articles/841098/)
- Табнаббинг и обратный табнаббинг
- [API](security.api.md#виды-атак)

## Паттерны

- Device/Endpoint
  - Антивирусы
- Network Сетевая Инфраструктура
  - [Шифрование канала связи (трафика)](security.vpn.md):
    - [TLS, mTLS](../../technology/protocols.integration/tls.md)
    - VPN, туннель
  - DDOS
  - FireWall
  - NAT, NAC
  - Антивирусы
  - Data loss prevention (DLP)
  - Network segmentation (КСПД)
- Application
  - DevSecOps
  - [Аутентификация](#аутентификация)
  - [Авторизация](#авторизация)
  - [API Security](security.api.md)
  - [Крипто Защита Информации](security.crypto.md) (Шифрование, ЭЦП)
  - [Zero Trust](https://t.me/ru_arc/136)
  - Аудит, логирование
    - [Platform V Synapse](https://platformv.sbertech.ru/blog/kak-otslezhivat-bezopasnost-prikladnyh-api-s-pomoshhyu-platform-v-synapse)
    - [SIEM](../system.class/siem.md) (Security information and event management)
  - Конфигурация "Во вне"
    - Пассивная (При сборке приложения)
    - Активная Key Managment, Key Vault
      - HashiCorp Vault
      - альтернативы [CyberArk, AWS](https://datafloq.com/read/5-compelling-alternatives-hashicorp-vault/)
- Data
  - Access аудит
- User
  - HTTPS
- Регламентирование
  - [152 ФЗ](https://astral.ru/news/zakonodatelstvo/39596/)
  - API Банк РФ
  - ФСТЭК РФ
  - ФСБ РФ
- Организационные
  - [Secure by Design](https://habr.com/ru/companies/bastion/articles/842874/)
    - матрица рисков
    - поверхность атаки
  - [Pen Tests](https://www.aztechit.co.uk/blog/cloud-security-best-practices)

### Триггеры для подключения ОИБ, анализа ИБ

- Добавление или, напротив, отказ от внешних точек выхода в интернет
- Изменение внешних API
- Архитектурно-значимые изменения
- Рефакторинг

### TODO

- АСП
- PCI DSS
  
### Аутентификация

- Состоит из:
  - __Сеанса__ Session (ИД, Роль)
    - Который хранится на стороне сервера
    - ИЛИ передается и проверяется на уровне API GW\ИС
      - API Key
      - Token
        - JWT
        - [OAuth](../../technology/protocols.integration/oauth.md)
        - [Access](../../technology/protocols.integration/oauth/oauth.access.token.md)
        - [Refresh](../../technology/protocols.integration/oauth/oauth.refresh.token.md)
  - Контекста
- __Способы аутентификации__ пользователей и обеспечения безопасности транзакций:
  - одноразовые пароли на основе времени/события
  - одноразовые пароли на основе механизма «запрос – ответ»
  - различные механизмы подписи транзакции на базе симметричных криптографических механизмов (например, технологии EMV-CAP, OATH, проприетарных  механизмов)
  - механизмы на основе несимметричных алгоритмов (PKI)
  - специфические механизмы привязки к мобильным устройствам
  - биометрия
- Методы защиты
  - CORS
  - XSS
  - Recaptcha
  - CSRF Token
  - Аутентификация __HTTPS__
    - [SSL\TLS](../../technology/protocols.integration/tls.md)
    - [MTLS](../../technology/protocols.integration/tls.md)
  - [Схемы аутентификации](security.api.md#схемы-аутентификации)
- Фреймворки
  - [Spring](../../technology/framework/java.spring.md) Security
  - NodeJS Passport
- [IAM](../../arch/system.class/iam.md)
  - [SSO](../pattern/security/sso.md)
  - MFA

### Авторизация

- Access Control List (ACL)
  - по URI
- RBAC\ABAC

## Антипаттерны

- Черные списки
- Шаблонный код
- Доверие по умолчанию

## Сертификаты

- Виды сертификатов
  - клиентский client certificate для аунтентификации Mutual TLS (mTLS)
  - самоподписанный self signed certificate
- Типы форматов сертификатов
  - сертификат удостоверяющего центра CA __.PEM__
  - client certificate
    - __.CRT__ file and the __.KEY__ file  
    - __.PFX__ file for your certificate
  - [Пример запроса с сертификатом в Postman](https://learning.postman.com/docs/sending-requests/certificates/)
- [Проверка алгоритма подписи примененного к сертификату](https://sysos.ru/?p=589)
  - 1.2.643.7.1.1.3.2, то сертификат сгенерирован по ГОСТ Р 34.10-2012
  - Если установлен КриптоПро, то в Алгоритме подписи будет отображаться ГОСТ Р 34.11-2012/34.10-2012 256 бит.

## Технологии

- [Криптозащиты](security.crypto.md#технологии)
- [Web Application firewall](../system.class/waf.md) (WAF) Межсетевые экраны  
- [Identity and Access Management (IAM)](../system.class/iam.md)
  - [SSO](../pattern/security/sso.md)
    - Oauth 2, OpenID Connect, SAML
    - WS-Federation (token)
    - [two-factor authentication (2FA)](security.2fa.md)

## Примеры требований

- Взаимодействие осуществляется через сеть Интернет по протоколу HTTP с использованием стандартного сетевого порта
- Передача конфиденциальной информации в рамках взаимодействия не предполагается
- Взаимная аутентификация клиента и сервера на базе SSL-сертификатов, шифрование передаваемой информации с использованием протокола HTTPS (TLS 1.2)
- SSL-сертификаты должны быть выпущены доверенными удостоверяющими центрами
- В случае, если взаимодействие осуществляется по внешним сетям передачи данных (далее – внешние сети), и участвующая во взаимодействии ИС Компании не является публичной , сетевой доступ к ИС Компании из внешних сетей, открываемый для обеспечения взаимодействия, должен быть ограничен конкретными адресами внешней ИС или сетью ее владельца  и конкретными сетевыми протоколами, используемыми ИС Компании.
- Токен (id сессии), при его использовании, должен быть динамическим (актуальным только для одной сессии одного клиента) и не должен передаваться в URL.
