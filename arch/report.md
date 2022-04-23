# Report

reporting database has a number of advantages:

The structure of the reporting database can be specifically designed to make it easier to write reports.
You don't need to normalize a reporting database, because it's read-only. Feel free to duplicate data as much as needed to make queries and reporting easier.
The development team can refactor the operational database without needing to change the reporting database.
Queries run against the reporting database don't add to the load on the operational database.
You can store derived data in the database, making it easier to write reports that use the derived data without having to introduce a separate set of derivation logic.
You may have multiple reporting databases for different reporting needs.

https://martinfowler.com/bliki/ReportingDatabase.html

## MS SSRS
- PosgreSQL ODBC Driver
  - http://blog.i-m-code.com/2013/06/03/connect-ssrs-to-postgresql-database/

## BI

### Alpha BI 
- https://bars-alpha.bi/

### MS Power BI

## Other
* [online pivot tables (BI tool)](https://www.seektable.com/) - $$

## Links
