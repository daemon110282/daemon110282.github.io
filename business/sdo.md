# СДО

Сдо архитектура

- Для всех каналов [реализована единая логика получения и агрегации информации из бэк-офисных систем](https://www.softlab.ru/solutions/interbank/5224/), а также единая логика выполнения операций.
  - Например, если для исполнения платежа с карты в адрес поставщика услуг требуется на уровне InterBank RS и агрегатором платежей, то эта логика реализуется в InterBank RS один раз и доступна для всех каналов, предоставляющих такую возможность.
- консолидирует данные о клиенте из бэк-систем и выводит их на все форм-факторы клиентов дбо
- При разработке нового ДБО мы реализовали версионирование и возможность выпускать релизы без риска, что приложение перестанет работать у большой части клиентов.
- распределенная независимая API-базированная архитектура back и front слоев ДБО
- single core реализация с уклоном на mobile first сценарии взаимодействия с клиентом - омниканальность
