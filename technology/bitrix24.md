# Bitrix24

## Зачем

## Функции

Интеграции:

- REST API
  - [TODO](https://apidocs.bitrix24.ru/access-to-rest-api.html)
  - [Лимиты REST API облачной](https://apidocs.bitrix24.ru/limits.html)
    - Enterprise - 5 RPS
    - Прочие - 2 RPS
  - [Release Notes](https://apidocs.bitrix24.ru/whats-new.html)
  - [Как быстро получить много данных](https://habr.com/ru/articles/537694/)
- Web Hooks
  - Входящие по Ключу авторизации
    - простой способ использования REST API Bitrix
    - подходит для "внутренних" интеграций, но не подходит для тиражных вариантов использования
  - [Исходящие](https://apidocs.bitrix24.ru/local-integrations/local-webhooks.html#ishodyashij-vebhuk) по Токену
