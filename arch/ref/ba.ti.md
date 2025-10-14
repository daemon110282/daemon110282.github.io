# Брокерское приложение

По шаблону [CheckList аналитики](../../checklist/analytic.md).

- [Брокерское приложение](#брокерское-приложение)
  - [Цель](#цель)
  - [AN Термины](#an-термины)
  - [Ограничения, Допущения](#ограничения-допущения)
  - [Риски](#риски)
  - [BT](#bt)
    - [UC](#uc)
    - [US](#us)
    - [БП](#бп)
  - [FT](#ft)
    - [DB Доменная модель](#db-доменная-модель)
  - [НФТ](#нфт)
    - [Безопасность](#безопасность)
    - [Производительность](#производительность)
    - [Надежность](#надежность)
  - [TD](#td)
    - [UI](#ui)
    - [ADR](#adr)
      - [Tradeoffs Анализ вариантов](#tradeoffs-анализ-вариантов)
    - [Доменная модель](#доменная-модель)
    - [API](#api)
  - [Метрики](#метрики)
  - [Роли](#роли)
  - [Справочники](#справочники)

## Цель

## AN Термины

- [TODO](https://tinkoff.github.io/investAPI/glossary/)

## Ограничения, Допущения

- ТИ - брокер в отличии от форекс, ЦБ регулирует деятельность

## Риски

## BT

### UC

- [Рынок ценных бумаг](../../analytic/domain/invest.md)
  - Биржевой (СПБ, МСБ)
  - Внебиржевой
- [Каталог ценных бумаг](https://htc-cs.ru/portfolio/ecommerce/mobilnoe-prilozhenie-tinkoff-investitsii)
  - Биржевой стакан
  - Типы активов – валюта, акции, фонды, фьючерсы, облигации, структурные ноты
  - Акция - детали, обзор, прогнозы, показатели, дивиденды, купоны, новости, идеи, события и обсуждения
  - Рыночные котировки с биржи идут в брокер
- Инвестиционный Счет
  - Клиент Открыть
  - Клиент [Открыть ИИС](https://www.tadviser.ru/index.php/Продукт:Тинькофф_Инвестиции_Брокерская_платформа)
  - Клиент Пополнить с ЛБК и тп
  - Заявка сохраняет Операцию
- Инвестиционный Портфель
  - Клиент Создать
  - Клиент Просмотр Аналитики
- Лента новостей
  - Клиент Просмотр
- Профиль пользователя (Клиент)
  - Регистрация
  - Авторизация
  - Клиент Просмотр
  - Клиент Смена Тарифа (Базовый, [Премиум](https://brobank.ru/tinkoff-investicii/) и тп)
  - Инвестиционный профиль (отношение к риску)
- Робот-советник
- Заявки (Order)
  - Клиент Создать
  - Клиент Создать Тип заявки: лучшая цена, лимитная заявка, рыночная заявка, стоп-маркет, стоп-лимит и тейк-профит
  - Broker: обрабатывает Заявки, на достаточность средств, резервирование средств, отправка Заявки на биржу, после исполнения отражение в Операциях, учёт в позиции Клиента
- Маржинальная торговля
  - Клиент Подключить
- Соцсеть Инвесторов
- Инвестиционные Рекомендации
- Скринер для автоматического поиска акций
- Дарение Акций
- [Программного интерфейса](https://www.tadviser.ru/index.php/Продукт:Tinkoff_Invest_API) для __алгоритмического трейдинга__ (автоматизированной биржевой торговли)
  - [gRPC, REST, WebSocket](https://tinkoff.github.io/investAPI/)
- [Чат](https://brobank.ru/tinkoff-investicii/)

### US

- <Роль> [должен иметь возможность](https://scrumtrek.ru/blog/product-management/3364/user-story-instruktsiya-po-primeneniyu/) <возможность> в <показатель производительности> с <момент отсчета> в <условия эксплуатации>, чтобы <ценность>
- Как пользователь, я хочу иметь возможность войти в демо-аккаунт, чтобы получить доступ к MVP.
- Как пользователь, я хочу иметь возможность просматривать список лучших акций по рыночной капитализации.
- Как пользователь, я хочу иметь возможность просматривать список активов, которыми я владею.
- Как пользователь, я хочу иметь возможность выбирать активы и просматривать цену в режиме реального времени.
- Как пользователь, я хочу иметь возможность разместить лимитный или рыночный ордер на покупку актива.
- Как пользователь, я хочу иметь возможность разместить лимитный или рыночный ордер на продажу актива (если он у меня уже есть, короткие продажи пока не поддерживаются).

### БП

## FT

### DB Доменная модель

## НФТ

### Безопасность

- [Auth As Service on MVP](https://ryanccollins.com/stock-exchange-systems-design-case-study)
- Антифрод
  - на уровне биржи есть
  
### Производительность

- количество активных пользователей - 500к\день
- rps
  - ~100,000,000 requests per day
  - ~30 krps in a trading day
- количество ордер 1млн\день
- ~3000 transactions per second
  - Up to 10x during peaks = ~30,000 transactions per second
- Latency важна
  - мы не хотим, чтобы пользователь был удивлен резкими колебаниями цен, и должны приложить все усилия, чтобы обеспечить самую низкую цену.
  - 200-400мс на ордер
- Цены должны обновляться в режиме реального времени, чтобы пользователь мог принять решение, основываясь на уверенности в текущей рыночной цене.

### Надежность

- 24\7
- доступность 99,9%

## TD

### UI

- [Web Vital](https://ryanccollins.com/stock-exchange-systems-design-case-study#1b5425e2d55e4bf481debc94de36acbc)
- Internationalization

### ADR

- [TODO](https://habr.com/ru/companies/iticapital/articles/302990/)
- [TODO 2 order matching system](https://github.com/puncsky/system-design-and-architecture/blob/master/en/161-designing-stock-exchange.md)
- TODO [Designing Smart Notification of Stock Price Changes](https://github.com/puncsky/system-design-and-architecture/blob/master/en/162-designing-smart-notification-of-stock-price-changes.md)
- [Example](https://ryanccollins.com/stock-exchange-systems-design-case-study)
- Load Balancer
  - envoy?
- Task Queue
- Rate limit API
  - от объема комиссии ордер-заявка
  - envoy?
- Worker Cluster
- Lazy Loading
- Caching: Redis, Service Memory
  - По торговым статусам, last price
- API Protocol
  - WebSocket
  - Grpc
    - Api client generation
    - Version
    - Dedlain time request from client - stop execute
    - Grpc web
    	- Почему не веб сокеты? Grpc позволяет обернуть рест, веб сокеты в одном сервисе..?!
- СУБД
  - Postgrsql
- Тех стек
  - API : java (много на рынке)
    - ТИ - прослойка к брокеру
  - брокера: java, go, scala
- EDA
  - Консистентность в конечном счете
  
#### Tradeoffs Анализ вариантов

- [Web sockets](https://ryanccollins.com/stock-exchange-systems-design-case-study#1b8c52358bd64fae8e32d1b613b272bb) vs. Server-Sent Events (SSEs) vs. Polling

### Доменная модель

- [Trade](https://ryanccollins.com/stock-exchange-systems-design-case-study#4ecf94953b294ba391e258136bcd9f0d)
- Balance

### API

- [TODO](https://ryanccollins.com/stock-exchange-systems-design-case-study#47b459070e2d4426baddb9af27323b17)

## Метрики

- Продуктовые
  - стоимость сделки
- Сервисные
- Системные
- Аналитика: [Firebase](../../technology/ci-cd/firebase.md) Analytics, Crashlytics, AppsFlyer, Amplitude

## Роли

## Справочники
