# ШБД

- Онлайн по триггеру/событию
- Пачка раз/д
  - инкремент select
  - Insert через dblink на больших объемах тормозит и при сбоях откат транзакций долгий. Поэтому потребитель select из источника
- Сущности по операциям (только вставка или возможны обновления в ШБД)

[Схемы](https://docs.google.com/document/d/11PG0EhGHzrlkK_pdCI59aFuy95DoZ7SkIqeX0E3-vwE/edit?usp=sharing)

- Выбор
  - Только вставка - одна таблица общая в шбд
  - Вставка и обновления - раздельные таблицы источника и потребителя в шбд
  - There are frameworks out there designed to help with this, like Microsoft BizTalk or Scribe Insight. These are cumbersome and expensive, though.
- The Business Rules are the Hard Part
	- One-way sync? Two-way sync?
	- Real-time push? Nightly updates?
	- Dump and reload?
	- Compare and update?
	- Conflict resolution? Which side wins?
	- Push read-only info one way, and order info the other way?
	- What about changes/cancellations/etc?
	- Do order statuses get pushed back?
- Bulk load night
	- ШТ нужна чтобы быстро извлечь данные из источника.
	- Insert by dblink slow. Select good
	- Затем идет upd, INS в целевой таблице получателя
	- И маппинг трансформация
	- del или softdel
- various types of synchronization:
  - Insert Synchronization
  - Update Synchronization
  - Drop Synchronization
  - Mixed Synchronization

## Технологии

- Microsoft BizTalk 
- Scribe Insight