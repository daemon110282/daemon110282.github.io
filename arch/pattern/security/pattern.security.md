# Security Patterns

- [Security Patterns](#security-patterns)
	- [Зачем](#зачем)
	- [Антипаттерны](#антипаттерны)
	- [Device/Endpoint](#deviceendpoint)
	- [Network Сетевая Инфраструктура](#network-сетевая-инфраструктура)
	- [Application](#application)
		- [API](#api)
	- [Data](#data)
	- [User](#user)
	- [Регламентирование](#регламентирование)
	- [Организационные](#организационные)

## Зачем

Обеспечить [безопасность](../../ability/security/security.md).
[Матрица ИТ безопасности](https://www.ninjaone.com/blog/it-security-checklist-protect-your-business/):

- Device/Endpoint security
- Network security
- Application security
- Data security
- User security

## Антипаттерны

- Черные списки
- Шаблонный код
- Доверие по умолчанию

## Device/Endpoint

- Антивирусы

## Network Сетевая Инфраструктура

- [Шифрование канала связи (трафика)](../../ability/security/security.vpn.md):
- [TLS, mTLS](../../../technology/protocols.integration/tls.md)
- VPN, туннель
- DDOS
- FireWall
- NAT, NAC
- Антивирусы
- Data loss prevention (DLP)
- Network segmentation (КСПД)

## Application

- DevSecOps
- [Аутентификация](../../ability/security/security.md#аутентификация)
- [Авторизация](../../ability/security/security.md#авторизация)
- [Крипто Защита Информации](../../ability/security/security.crypto.md) (Шифрование, ЭЦП)
- [Zero Trust](https://t.me/ru_arc/136)
- [Аудит](../observability/pattern.audit.md)
- Логирование
- [Platform V Synapse](https://platformv.sbertech.ru/blog/kak-otslezhivat-bezopasnost-prikladnyh-api-s-pomoshhyu-platform-v-synapse)
- [SIEM](../../system.class/siem.md) (Security information and event management)
- Конфигурация "Во вне"
- Пассивная (При сборке приложения)
- Активная Key Managment, Key Vault
  - HashiCorp Vault
  - альтернативы [CyberArk, AWS](https://datafloq.com/read/5-compelling-alternatives-hashicorp-vault/)

### API

- Access Token ([JWT](../../../technology/jwt.md))
- [API](../../ability/security/security.api.md#паттерны)

## Data

- Access аудит

## User

- HTTPS

## Регламентирование

- [152 ФЗ](https://astral.ru/news/zakonodatelstvo/39596/)
- API Банк РФ
- ФСТЭК РФ
- ФСБ РФ

## Организационные

- [Secure by Design](https://habr.com/ru/companies/bastion/articles/842874/)
  - матрица рисков
  - поверхность атаки
- [Pen Tests](https://www.aztechit.co.uk/blog/cloud-security-best-practices)
