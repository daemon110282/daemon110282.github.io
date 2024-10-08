# Шифрование канала связи (трафика)

## Зачем

Обеспечение [информационной безопасности](security.md) сетевого трафика.

## Технологии

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
