# Access Token

- [Access Token](#access-token)
  - [Зачем](#зачем)
  - [Структура](#структура)
  - [Security](#security)

## Зачем

Аутентификация по протоколу [OAuth](../oauth.md) для обеспечения [информационной безопасности](../../../arch/ability/security.md).

## Структура

[Структура Payload](https://datatracker.ietf.org/doc/html/rfc9068)

Required:

- iss: "http://authorization-server.example.com/" - кто выпустил токен, идентификатор эмитента JWT (сервера авторизации, выдавшего его)
- sub: "auth0|123456" - Уникальный идентификатор пользователя в IAM, идентификатор субъекта JWT
- [aud](https://developers.sber.ru/docs/ru/sberbusinessapi/authorization/auth-sbbid/tokens): "1234abcdef" - равно client_id - ИС запращивающая доступ, перечень идентификаторов получателей, которым предназначен JWT
- exp: 1311281970 - срок действия в секундах
- iat: 1311280970 - время выпуска JWT
- jti: dbe39bf3a3ba4238a513f51d6e1691c4 - ИД jwt tokena
- scope: openid profile reademail 
  - роли, права доступа (RBAC, ABAC) к ресурсу, область действия
  - определяет свойства защищаемых данных конечного пользователя, к которым запрошен доступ
  - в случае использования протокола OpenID Connect параметр должен содержать строку "openid"
- client_id: lk - идентификатор клиента OAuth 2.0, полученный при регистрации на сервере авторизации
- redirect_uri: http://lk.ru - URI переадресации, на который будет отправлен ответ, должен быть предварительно зарегистрирован на сервере авторизации
- response_type: code - тип ответа и сценарий протокола авторизации

Optional:

- azp:  идентификатор клиента стороны, для которого был выпущен токен
- Key ID — ИД ключа, которым можно проверить подпись токена
- typ: Bearer
- nbf: - время, до которого JWT не должен приниматься к обработке
- state: - значение, используемое для синхронизации состояния между за-просом и обратным вызовом; используется для защиты от атак межсайтовых запросов (CSRF);
- nonce: - случайное строковое значение, используемое для привязки сеанса клиента к ID токену и для защиты от атак повторного воспроизведения;
- prompt: - список строк, которые указывают, должен ли сервер авторизации запрашивать у конечного пользователя повторную аутентификацию и согласие на доступ клиента к ресурсу. Определены значения:
  - “none” – не требуется интерфейс пользователя  
  - “login” – серверу авторизации рекомендуется запросить повторную аутентификацию
  - “consent” – серверу авторизации рекомендуется запросить у пользователя согласие на доступ к ресурсу  
  - “select_account” – серверу авторизации рекомендуется запросить у пользователя выбор учетной записи
- max_age: - максимальный срок аутентификации в секундах, прошедшее с момента последней активной аутентификации конечного пользователя сервером авторизации
  - Если истекшее время больше этого значения, сервер авторизации должен пытаться активно повторно аутентифицировать конечного пользователя. Если в запросе аутентификации присутствует параметр <max_age>, возвращаемый ID токен должен включать значение параметра <auth_time>.
- sid: - ?

## Security

- Секретный ключ длинный и менять периодически
- На стороне приложения __ограничить алгоритм подписи__
- Хранение
  - Сам Access токен [храним не в localStorage](https://climbtheladder.com/10-spa-authentication-best-practices/) как это обычно делают, а [в памяти](https://auth0.com/docs/secure/security-guidance/data-security/token-storage) клиентского приложения
  - Store AccessToken JWT [in Session Cookie](https://jcbaey.com/authentication-in-spa-reactjs-and-vuejs-the-right-way/)
    - When the SPA calls only an API that is served from a __domain that can share cookies__ with the domain of the SPA, __no tokens__ are needed. If you are using cookie-based authentication, they are stored in a cookie and sent to the server in every request.
    - When the SPA calls multiple APIs that reside in a __different domain__, __access, refresh tokens are needed__. If you are using token-based authentication, they are sent by the client in every request, typically in the HyperText Transfer Protocol (HTTP) header.
- Время жизни
  - Access Token Lifespan Срок действия токена доступа <= session idle timeout - 5 мин
    - Once expired, they cannot be used for authentication or API calls. A user will need to request a new access token using the __refresh token__ or by __re-authenticating__
  - session idle timeout Время ожидания сеанса единого входа - 30 мин
  - SSO Session Max - 1 день
