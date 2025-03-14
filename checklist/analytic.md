# Аналитика

![ФТ-НФТ](../img/ba/ft-nft.jpg)

Checklist:

- PP Предпроектная подготовка
  - Цели
  - [Стейкхолдеры](https://systems.education/requirements-never-changes) (кто принимает решение)
  - Эксперты
  - [Impact mapping](../analytic/analytica.md#карта-влияния-impact-mapping)
  - Команда, роли
  - Существующая инфраструктура, ит-ландшафт
  - Бюджет (эконом, mvp или сразу качественно, масштабируемо)
  - Связь с заказчиком, формат работы
  - Критерии готовности, успешности решения\проекта
- AN Нормативная документация
  - Термины
  - SLA
  - Нормативно правовые акты (НПА)
- BT Бизнес-требования
  - Проблемная (предметная) область (domain)
    - [Customer Journey Map](../analytic/cjm.md) (CJM)
  - Бизнес цели (БЦ)
  - [Бизнес процессы (БП)](../analytic/analytica.md#бизнес-процесс-бп) AS-IS, TO-BE
  - Бизнес правила
  - Бизнес требования пользователей для достижения БЦ в контексте БП - __ЧТО надо бизнесу__
    - User Story US
    - User Stoty Map
    - UC [use-case](../analytic/analytica.md#use-case-uc-сценарии-использования), клик-событие, акторы
    - [Event Storming](../arch/pattern/system.design/event.storming.md)
- FT Функциональные требования __по ИС__ - функции ИС - __ЧТО ИС должна__ уметь делать для выполнения БЦ, БП, БТ
  - Анализ существующих Функциональных возможностей ИС
  - DB Доменная модель
    - Доменные объекты (Бизнес Сущности): Аттрибуты, Правила валидации, Связи
    - Статусная модель
    - Доменные события
    - [Инварианты агрегата](../arch/pattern/system.design/ddd.md#агрегат-aggregate-root)
    - Проверка на полноту: [CRUD LSHAX](https://systems.education/requirements-never-changes)
  - Алгоритмы Процессы
  - Отчетность
    - ПФ, Макросы
  - Регулярные процессы (по расписанию)
  - Мониторинг, администрирование, обслуживание
- Справочники
- Настройки (UC, FT, Название, Назначение, Значение по умолчанию)
- Метрики
- Прикладная защита (RBAC, ABAC и тп)
  - Ролевой доступ
- Ограничения, Допущения
  - Границы проекта (scope)\системы\решения (что включаем в автоматизацию на текущем этапе)
  - Бэклог
  - Этапы (MVP), Фазы
- Риски: вероятность, шаги минимизации
- НФТ
  - Протоколирование и бизнес мониторинг
  - Атрибуты качества
  - ИБ (ПДН ФЗ-152)
- Требования к запуску
- TD Технический дизайн - __КАК надо сделать ФТ__
  - Операции обработки данных, функции
  - [Архитектура](../arch/arch.md)
    - Стиль
    - Компоненты ИС (web, back, process, и тп)
    - Атрибуты качества
    - Технологический стек
  - Интеграции
    - События, Команды, Запросы
      - Входящие\исходящие
    - [API](../api/api.md)
    - Схемы взаимодействия (SQD)
  - UI UX
    - [Спецификация ЭФ](../analytic/ui-ux.md), Макеты\Прототипы
  - База данных: ХП, функции, таблицы
  - Локализация
- Проверка на [полноту требований](https://systems.education/requirements-never-changes)
  - UC Контекстный анализ
  - Маппинг ФТ на ТД: Связь потребностей (UC), требований (FT) и решений (TD)
  - ЭФ, Карта экранов
- Демо, обсуждение с разработчиками
- Консультации на этапе реализации
- Демо
  - от разработчиков
  - заказчику
- Консультации на этапе ОПЭ
- Документация для передачи в эксплуатацию: РП, мониторинг, метрики, логи, описание ИС
- Актуализация документации: ПЗ, ТД, API, РИПВ
