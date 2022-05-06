# Report

reporting database has a number of advantages:

The structure of the reporting database can be specifically designed to make it easier to write reports.
You don't need to normalize a reporting database, because it's read-only. Feel free to duplicate data as much as needed to make queries and reporting easier.
The development team can refactor the operational database without needing to change the reporting database.
Queries run against the reporting database don't add to the load on the operational database.
You can store derived data in the database, making it easier to write reports that use the derived data without having to introduce a separate set of derivation logic.
You may have multiple reporting databases for different reporting needs.

https://martinfowler.com/bliki/ReportingDatabase.html

# Patterns
- требуется ли вообще транзакционность, или её можно отключить/понизить уровень изоляции на уровне БД? Уровень транзакции, мы пытаемся прийти к консенсусу в выборе между высокой согласованностью данных между транзакциями и скоростью выполнения этих самых транзакций.
- по умолчанию
  - MySQL - repeatable read 
  - PostgreSQL — read committed
- Уровни изоляции:
  - 1 read uncommitted 
    - самую высокую скорость выполнения и самую низкую согласованность имеет уровень 
    - феномен грязного чтения
    - PostgreSQL мог бы тоже использоваться, но он не поддерживает уровень изоляции read uncommitted, и использует вместо него уровень read committed.
    - Разные СУБД по-разному воспринимают уровни изолированности.
  - 2 Read committed
    - Для этого уровня параллельно исполняющиеся транзакции видят только зафиксированные изменения из других транзакций. 
  обеспечивает защиту от грязного чтения.
    - феномен неповторяющегося чтения, когда мы видим обновленные и удаленные строки (UPDATE, DELETE), и феномен чтения фантомов, когда мы видим добавленные записи (INSERT).
  - 3 Repeatable read
    - Уровень, позволяющий предотвратить феномен неповторяющегося чтения. Т.е. мы не видим в исполняющейся транзакции измененные и удаленные записи другой транзакцией. Но все еще видим вставленные записи из другой транзакции. 
    - Чтение фантомов никуда не уходит.
  - 4 serializable
    - Самую низкую скорость выполнения и самую высокую согласованность.
    - Уровень, при котором транзакции ведут себя как будто ничего более не существует, никакого влияния друг на друга нет. В классическом представлении этот уровень избавляет от эффекта чтения фантомов. Блокировка изменений в транзакции1 до завершения чтения в транзакции2. 
        
## Technology
[Report Systems](../technology/report.md)

## Links
- https://habr.com/ru/post/469415/
