# Data Mart

## Зачем

База данных, предназначенная для решения __специализированной задачи__ или набора задач из [__одной предметной области__](https://yandex.cloud/ru/docs/glossary/datamart) в архитектурном стиле [BigData](../../style/bigdata.md).

- содержатся только __однородные__ данные
- предъявляются высокие требования __по достоверности и оперативности обновления__
- важная часть [хранилища данных](../../system.class/store.md) Data Warehouse (подтип)
- ориентирован на __определенную группу__ бизнес пользователей
- обычно [менее 100гб](https://coderlessons.com/tutorials/bolshie-dannye-i-analitika/teoriia-khraneniia-dannykh/14-khranilishche-dannykh-protiv-data-mart)

## Технологии

- Витрины в [Yandex Data Lens](../../../technology/store/yandex.data.lens.md)
