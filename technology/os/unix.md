# UNIX системы

# Ввод в домен, доменная авторизация, синхронизация учетных записей из домена на unix

Зачем:

1. Предоставить доступ к сервисам на Linux сервере пользователям домена.
2. Пустить на Linux сервер администраторов под своими доменными учётными данными.
3. Настроить вход на Linux рабочую станцию для пользователей домена, причём желательно SSO (чтобы часто не вводить длинный пароль).
4. [Postgresql доменная авторизация](https://blog.ololo.cc/kerberos) 

Сокращения:

ПКу - Unix pc
ПКд - windows PC domain controller
ПКв - windows pc

- [SSO](https://habr.com/ru/company/nixys/blog/563244/) - single sign-on
- AD active directory - сервер функций, таких как аутентификация, управление группами и пользователями, администрирование политик и многое другое. это база данных служб каталогов.
- LDAP - один из протоколов, которые вы можете использовать для общения с AD. LDAP is used for holding authoritative information about the accounts, such as what they're allowed to access (authorization).
- Kerberos другой протокол к AD. 

Порядок настройки:

1. [Клиент Протокола **Kerberos** для подключения](https://help.ubuntu.ru/wiki/%D0%B2%D0%B2%D0%BE%D0%B4_%D0%B2_%D0%B4%D0%BE%D0%BC%D0%B5%D0%BD_windows#%D0%BE%D1%84%D1%84-%D0%BB%D0%B0%D0%B9%D0%BD_%D0%B0%D0%B2%D1%82%D0%BE%D1%80%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F) к домену AD через ПКд, в ответ от домена билет Kerberos
2. **Samba** сервер для входа в домен по протоколу **SMB**. В AD должны увидеть ПКу.
3. Просмотр ресурсы(ПКв) в домене: **smbclient** по билету Kerberos
4. **Winbind** специальный демон, служащий для связи локальной системы управления пользователями и группами Linux с сервером Active Directory.
Позволит назначать пользователей домена владельцами папок и файлов на ПКу.
Использовать Winbind как дополнительный источник информации о пользователях и группах из ПКд на ПКу.
	- Альтернативы:
		- библиотеки nss для работы с контроллером домена Active Directory по LDAP протоколу
		- [PowerBroker Identity Services](https://habr.com/ru/post/174407/)
5. PAM на работу с Winbind [для авторизации на ПКу под доменными пользователями](https://blog.it-kb.ru/2014/07/06/authentication-authorization-in-active-directory-connecting-to-ubuntu-server-14-04-lts-with-winbind-pam/).

