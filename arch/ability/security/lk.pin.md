# Авторизация в ЛК по ПИН

- [Авторизация в ЛК по ПИН](#авторизация-в-лк-по-пин)
	- [Зачем](#зачем)
	- [Локальная валидация PIN в браузере](#локальная-валидация-pin-в-браузере)
	- [Серверная валидация PIN](#серверная-валидация-pin)
	- [Системная валидация PIN WebAuthn](#системная-валидация-pin-webauthn)
	- [Примеры](#примеры)

## Зачем

Use Cases:

- установить PIN
  - [пример реализации React](https://blog.openreplay.com/securing-pin-input/)
  - Пользователь вводит PIN дважды
  - Ограничьте длину PIN (4-8)
- вход по PIN
  - ограничьте число попыток ввода PIN
- изменить\сбросить PIN
- уведомления о входе на новом устройстве
- (не)доверенные устройства

[ИБ рекомендации TODO](https://fi5t.xyz/posts/pin-code-authentication-rfc/)

## Локальная валидация PIN в браузере

Допустимо:

- Это не заменяет логин/пароль, а скорее упрощает доступ после первоначального входа.
- Используется для "локальной быстрой авторизации" — как в мобильных приложениях: пользователь залогинился один раз, задал PIN, и в дальнейшем использует только его (в рамках того же устройства/браузера).
- PIN используется для локального доступа (например, дешифровки токена)

Варианты решений:

- PIN-код хранится в __хешированном виде с солью__
  - соль: ид сессии + [deviceid](../../../technology/fingerprint.md)
- или Web Crypto API для __шифрования__ PIN (например, с ключом, основанным на устройстве)
  - PIN зашифруем с помощью AES-GCM, используя ключ, связанный с устройством (или сессией)
  - Храним:
    - зашифрованный PIN (ciphertext)
    - iv (вектор инициализации)
  - Ключ храним в session-only памяти — он исчезает при перезапуске вкладки или браузера
  - Расшифровка PIN происходит только при вводе.
- или __zero-knowledge security - шифрование токенов\данных__, можно использовать короткие ПИНы (перебор усложнен из за PBKDF2)
  - PIN-код __не хранится__
  - Из PIN и соли генерируется ключ через хэш функцию Password-Based Key Derivation Function [__PBKDF2__](https://www.securitylab.ru/analytics/427930.php)
  - Ключ используется для AES-GCM шифрования данных (например, access token)
  - Зашифрованные данные + соль + iv сохраняются в localStorage или IndexedDB (безопаснее от угроз XSS)
  - При вводе PIN — дешифруем и восстанавливаем access\refresh token
  - При совпадении — отправляется refresh token или сохранённый access token на сервер

Срок жизни ПИН:

- критичен, потому что
  - PIN — слабый фактор (обычно 4–6 цифр)
  - PIN не защищён как пароли
  - Долгая сессия + бесконечный PIN = уязвимость
- ограничить таймаут для блокировки и входа по ПИН
- не заставлять пользователя менять PIN сам по себе, если не было взлома или подозрительной активности.

## Серверная валидация PIN

- example [LoginRadius API](https://www.loginradius.com/legacy/docs/api/v2/customer-identity-api/pin-authentication/overview/#partdeployment2) Use Case:
  - Set PIN
    - During the registration, the application prompts your customer to set a PIN for the account
    - existing customers are prompted to set a PIN during the login
  - Change PIN (old, new send)
  - Forgot/reset pin by email/phone/username
  - Reset PIN using security questions
- [пример](https://fi5t.xyz/posts/pin-code-authentication-rfc/)

## Системная валидация PIN WebAuthn

На уровне устройств по протоколу [WebAuthn](../../../technology/protocols.integration/webauthn.md), FIDO2\CTAP2 (авторизация в системной форме)

## Примеры

[Т Банк анализ работы](../../ref/tbank.lk.pin.puml)
