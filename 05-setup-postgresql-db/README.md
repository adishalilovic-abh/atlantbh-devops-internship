# Setup PostgreSQL database

# Table of contents 
1. [Task description](#task)
2. [Install PostgreSQL](#install_psql)
3. [PostgreSQL service](#postgresql_service)
4. [psql](#psql)
5. [psql basics](#psql_basics)
6. [SQL basics](#sql)

## Task <a name="task"></a>
[Spring petclinic rest app](https://github.com/spring-petclinic/spring-petclinic-rest) uses in memory storage by default. There is option to persist data beyond restarts using database. Create local PostgreSQL database which will be used for data persistence.

## Install PostgreSQL <a name="install_psql"></a>

If you haven't already, download and install PostgreSQL on your local machine. You can get the latest version from the [official PostgreSQL website](https://www.postgresql.org/download/).

```
$ brew update #update Homebrew to ensure you have the latest package information
$ brew install postgresql@16
```


<details>
  <summary>Message after installation:</summary>

```
This formula has created a default database cluster with:
  initdb --locale=C -E UTF-8 /usr/local/var/postgresql@16
For more details, read:
  https://www.postgresql.org/docs/16/app-initdb.html

postgresql@16 is keg-only, which means it was not symlinked into /usr/local,
because this is an alternate version of another formula.

If you need to have postgresql@16 first in your PATH, run:
  echo 'export PATH="/usr/local/opt/postgresql@16/bin:$PATH"' >> /Users/adinpilavdzija/.bash_profile

For compilers to find postgresql@16 you may need to set:
  export LDFLAGS="-L/usr/local/opt/postgresql@16/lib"
  export CPPFLAGS="-I/usr/local/opt/postgresql@16/include"

To start postgresql@16 now and restart at login:
  brew services start postgresql@16
Or, if you don't want/need a background service you can just run:
  LC_ALL="C" /usr/local/opt/postgresql@16/bin/postgres -D /usr/local/var/postgresql@16
==> Summary
🍺  /usr/local/Cellar/postgresql@16/16.0: 3,778 files, 66.5MB
==> Running `brew cleanup postgresql@16`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
```
</details>
<br>

If you need to have postgresql@16 first in your PATH, run:
```
$ echo 'export PATH="/usr/local/opt/postgresql@16/bin:$PATH"' >> /Users/adinpilavdzija/.bash_profile
```

Check the Postgres server version:
```
$ brew list | grep postgres #check if postgres is installed or not

$ postgres --version
```

## PostgreSQL service <a name="postgresql_service"></a>

Start the PostgreSQL service:
```
$ brew services start postgresql@16
```

Stop the PostgreSQL service:
```
$ brew services stop postgresql@16
```

## psql <a name="psql"></a>

When you get a connection to PostgreSQL it is always to a particular database. To access a different database, you must get a new connection.

```
$ psql postgres #connects to the PostgreSQL database named postgres
```

Create PostgreSQL database:
```
$ CREATE DATABASE petclinic;
```

Create user:
```
$ CREATE USER adinp WITH PASSWORD 'pass123';
```

If user is not superuser, application fail to build.

Grant superuser privileges to a user:
```
$ ALTER USER adinp WITH SUPERUSER;
```

Change password if needed:
```
$ ALTER USER adinp WITH PASSWORD 'pass123';
```

## psql basics <a name="psql_basics"></a>

- Connect to a Database: “psql -d db_name -U user_name”.
- Check Postgres Version: “SELECT VERSION();”.
- List All Databases: “\l”.
- Access or Switch a Database: “\c db_name”.
- List All Tables: “\dt”.
- Describe All Tables: “\d”.
- Describe a Specific Table: “\d tab_name”.
- List All Schemas: “\dn”.
- List All Views: “\dv”.
- List All Functions: “\df”.
- List All Users: “\du”.
- Show Commands History: “\s”
- Save Query’s Results to a Specific File: “\o file_name”.
- Run psql Commands/queries From a Particular File: “\i file_name”.
- Execute Previous Command: “\g”.
- Show Query Execution Time: “\timing”.
- Get Output in HTML Format: “\H”.
- Align Columns Output: “\a”.
- Get Help: “\h”.
- Get All psql Commands: “\?”.
- Clear Screen: “\! cls”.
- Quit psql: “\q”.

## SQL basics <a name="sql"></a>

SQL keywords are NOT case sensitive: select is the same as SELECT.  
Semicolon is the standard way to separate each SQL statement in database systems that allow more than one SQL statement to be executed in the same call to the server.

- SELECT - extracts data from a database
- UPDATE - updates data in a database
- DELETE - deletes data from a database
- INSERT INTO - inserts new data into a database
- CREATE DATABASE - creates a new database
- ALTER DATABASE - modifies a database
- CREATE TABLE - creates a new table
- ALTER TABLE - modifies a table
- DROP TABLE - deletes a table
- CREATE INDEX - creates an index (search key)
- DROP INDEX - deletes an index

<details>
<summary>See more SQL commands</summary>

| Command                                                                                       | Syntax                                                                                                                | Description                                                                                                                                                         |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ALTER table                                                                                   | ALTER TABLE table_name ADD column_name datatype;                                                                      | It is used to add columns to a table in a database                                                                                                                  |
| AND                                                                                           | SELECT column_name(s)FROM table_nameWHERE column_1 = value_1  AND column_2 = value_2;                                 | It is an operator that is used to combine two conditions                                                                                                            |
| AS                                                                                            | SELECT column_name AS ‘Alias’FROM table_name;                                                                         | It is a keyword in SQL that is used to rename a column or table using an alias name                                                                                 |
| AVG                                                                                           | SELECT AVG(column_name)FROM table_name;                                                                               | It is used to aggregate a numeric column and return its average                                                                                                     |
| [SQL BETWEEN](https://intellipaat.com/blog/tutorial/sql-tutorial/sql-between/)                | SELECT column_name(s)FROM table_nameWHERE column_name BETWEEN value_1 AND value_2;                                    | It is an operation used to filter the result within a certain range                                                                                                 |
| CASE                                                                                          | SELECT column_name,CASEWHEN condition THEN ‘Result_1’WHEN condition THEN ‘Result_2’ELSE ‘Result_3’ENDFROM table_name; | It is a statement used to create different outputs inside a SELECT statement                                                                                        |
| COUNT                                                                                         | SELECT COUNT(column_name)FROM table_name;                                                                             | It is a function that takes the name of a column as an argument and counts the number of rows when the column is not NULL                                           |
| Create TABLE                                                                                  | CREATE TABLE table_name (  column_1 datatype,   column_2 datatype,   column_3 datatype);                              | It is used to create a new table in a database and specify the name of the table and columns inside it                                                              |
| DELETE                                                                                        | DELETE FROM table_nameWHERE some_column = some_value;                                                                 | It is used to remove the rows from a table                                                                                                                          |
| GROUP BY                                                                                      | SELECT column_name, COUNT(\*)FROM table_nameGROUP BY column_name;                                                     | It is a clause in SQL used for [aggregate functions](https://intellipaat.com/blog/tutorial/sql-tutorial/sql-functions/) in collaboration with the SELECT statement  |
| HAVING                                                                                        | SELECT column_name, COUNT(\*)FROM table_nameGROUP BY column_nameHAVING COUNT(\*) > value;                             | It is used in SQL because the WHERE keyword cannot be used in aggregating functions                                                                                 |
| [INNER JOIN](https://intellipaat.com/blog/tutorial/sql-tutorial/inner-join-in-sql/)           | SELECT column_name(s)FROM table_1JOIN table_2  ON table_1.column_name = table_2.column_name;                          | It is used to combine rows from different tables if the Join condition goes TRUE                                                                                    |
| INSERT                                                                                        | INSERT INTO table_name (column_1, column_2, column_3) VALUES (value_1, ‘value_2’, value_3);                           | It is used to add new rows to a table                                                                                                                               |
| IS NULL/ IS NOT NULL                                                                          | SELECT column_name(s)FROM table_nameWHERE column_name IS NULL;                                                        | It is an operator used with the WHERE clause to check for the empty values                                                                                          |
| [LIKE](https://intellipaat.com/blog/tutorial/sql-tutorial/like-and-between-operators-in-sql/) | SELECT column_name(s)FROM table_nameWHERE column_name LIKE pattern;                                                   | It is a special operator used with the WHERE clause to search for a specific pattern in a column                                                                    |
| LIMIT                                                                                         | SELECT column_name(s)FROM table_nameLIMIT number;                                                                     | It is a clause to specify the maximum number of rows the result set must have                                                                                       |
| MAX                                                                                           | SELECT MAX(column_name)FROM table_name;                                                                               | It is a function that takes a number of columns as an argument and returns the largest value among them                                                             |
| MIN                                                                                           | SELECT MIN(column_name)FROM table_name;                                                                               | It is a function that takes a number of columns as an argument and returns the smallest value among them                                                            |
| OR                                                                                            | SELECT column_nameFROM table_nameWHERE column_name = value_1   OR column_name = value_2;                              | It is an operator that is used to filter the result set to contain only the rows where either condition is TRUE                                                     |
| ORDER BY                                                                                      | SELECT column_nameFROM table_nameORDER BY column_name ASC | DESC;                                                     | It is a clause used to sort the result set by a particular column either numerically or alphabetically                                                              |
| [OUTER JOIN](https://intellipaat.com/blog/tutorial/sql-tutorial/full-join-sql/)               | SELECT column_name(s)FROM table_1LEFT JOIN table_2  ON table_1.column_name = table_2.column_name;                     | It issued to combine rows from different tables even if the condition is NOT TRUE                                                                                   |
| ROUND                                                                                         | SELECT ROUND(column_name, integer)FROM table_name;                                                                    | It is a function that takes the column name and an integer as an argument and rounds the values in a column to the number of decimal places specified by an integer |
| SELECT                                                                                        | SELECT column_name FROM table_name;                                                                                   | It is a statement that is used to fetch data from a database                                                                                                        |
| [SELECT DISTINCT](https://intellipaat.com/blog/tutorial/sql-tutorial/sql-distinct/)           | SELECT DISTINCT column_nameFROM table_name;                                                                           | It is used to specify that the statement is a query that returns unique values in specified columns                                                                 |
| SUM                                                                                           | SELECT SUM(column_name)FROM table_name;                                                                               | It is a function used to return the sum of values from a particular column                                                                                          |
| [UPDATE](https://intellipaat.com/blog/tutorial/sql-tutorial/update-query/)                    | UPDATE table_nameSET some_column = some_valueWHERE some_column = some_value;                                          | It is used to edit rows in a table                                                                                                                                  |
| [WHERE](https://intellipaat.com/blog/tutorial/sql-tutorial/where-clause/)                     | SELECT column_name(s)FROM table_nameWHERE column_name operator value;                                                 | It is a clause used to filter the result set to include the rows where the condition is TRUE                                                                        |
| WITH                                                                                          | WITH temporary_name AS (SELECT \*FROM table_name)SELECT \*FROM temporary_nameWHERE column_name operator value;        | It is used to store the result of a particular query in a temporary table using an alias                                                                            |
</details>

