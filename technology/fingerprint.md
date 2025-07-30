# Deviceid Fingerprint

## Зачем

Уникальный ИД устройства.

## Технологии

Варианты:

- МП
  - Android
    - [fingerprintjs-android](https://github.com/fingerprintjs/fingerprintjs-android)
  - IOS
    - [fingerprintjs-ios](https://github.com/fingerprintjs/fingerprintjs-ios)
- WEB
	- BSL лицензия [с 4 версии fingerprintjs](https://github.com/fingerprintjs/fingerprintjs)
	- генерить самим и хранить в LocalStorage через crypto.randomUUID
	- инструменты веб аналитики:
    	- SDK amplitude.getDeviceId()
    	- Яндекс Метрика
        	- _ym_uid содержит Client ID, который и является идентификатором устройства для Яндекс.Метрики. Получать через [SDK YM](https://yandex.ru/support/metrica/ru/objects/get-client-id.html)
        	- автоматически [присваивает ClientID](https://yandex.ru/support/metrica/ru/general/clientid-userid) каждому уникальному посетителю сайта. Этот идентификатор — анонимный: он создается случайным образом и определяет браузер, в котором посетитель просматривает сайт. Таким образом, если посетитель просматривал ваш сайт из двух разных браузеров, в Яндекс Метрике будет зафиксировано два разных ClientID.
