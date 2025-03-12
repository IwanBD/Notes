---
favorited: true
title: PostgreSQL
created: '2022-10-01T20:21:47.262Z'
modified: '2022-10-16T16:56:12.459Z'
---

# PostgreSQL

## What is a database ?
A place where we can:
- store
- manipulate
- retrieve
all about data.


## Installation of PostgreSQL
`sudo apt install postgresl postgresql-contrib`

## Login as the default user
`sudo -i -u postgres`

## start using *psql*
`psql`

## list all databases
`\l`

## see all commands
`\?`

## exit the *psql*
`\q`

## list all users
`\du`

## List of privileges

Superuser - Create role - Create DB - Replication - Bypass RLS

## create new user
```sql
CREATE USER [username] WITH <privilege> PASSWORD 'postgres';
```
## Give privileges

```sql
GRANT ALL PRIVILEGES ON [database] TO [username];
```

## Update a user password
```sh
alter user [username] with password ['newpassword']
```

## create database
```sql
CREATE DATABASE [dbname] ;
```

## Connect to the database

> When you are not logged in as a database user.
```sh
psql -h [ipadress] -p [port] -U [username] [dbname]
```
> when you are already looged in as a postgres database user
```sh
\c [dbname]
```

## Delete a database (Very dangerous command)
```sql
DROP DATABASE [dbname];
```

## Create a table

```sql
CREATE TABLE [tablename] (
  [tablename] [datatype] <constraints>
)
```

## Describe all tables in the databse
```sh
\d
```

## Get the description of a specific table
```sh
\d [tablename]
```

## Delete a table

```sql
DROP TABLE [tablename];
```

## Insert in to

```sql
INSERT INTO [tablename] (col1, ... ,colx) VALUES (val1, ..., valx);
```
> NB:  the string values must be framed by single-quotes `'` and not double-quotes `"`


## Execute commands from a file
```sh
\i [path to the sql file]
``` 

## Select From
```sql
SELECT * FROM [tablename];
```

## Select a column
```sql
SELECT [colx] <, coly, colz> FROM [tablename];
```

## Order By
```sql
SELECT * FROM [tablename] ORDER BY [colx, ..., coly] <ASC|DESC>;
```

## Distinct
```sql
SELECT DISTINCT [colname] FROM [tablename];
```

## WHERE / AND [OR] clause
```sql
SELECT * FROM person WHERE condition [AND conditionx, ... AND conditionz]
```
*ex: `SELECT *FROM person WHERE gender = 'Male' AND (country = 'Poland' OR country = 'China');`*

## Operators

> They allows to do arithmetics operations like comparisons, bitwise and logical operations

**Arithmetic Operators**
|Operator |Descrtiption|
|---|---|
|+| Add|
|-| Substract|
|*| Multiply|
|/|Divide|
|%|Modulo|

**Bitwise Operators**
|Operator|Description|
|--|--|
|&|Bitwise AND|
|`|`|Bitwise OR|
|^|Bitwise exclusive OR|

**Comparison Operators**
|Operator |	Description|
|---|---|
|= 	|Equal to |	
|> |	Greater than 	|
|< |	Less than 	|
|>= |	Greater than or equal to 	|
|<= |	Less than or equal to |	
|<>| 	Not equal to|

## LIMIT / OFFSET
```sql
SELECT * FROM [tablename] LIMIT [max rows to display]; 
```
```sql
SELECT * FROM [tablename] OFFSET [x]; //selects all from the table and displays rows after the x first ones;
```
```sql
SELECT * FROM [tablename] OFFSET [x] LIMIT [n] ; //selects all from the table and displays only the n first rows after x rows;
**or**
SELECT * FROM [tablename] OFFSET [X] FETCH FIRST n ROW ONLY;
```

## IN

```sql
SELECT * FROM [tablename] WHERE colx = val1 OR colx = val2 OR colx = valn;
//could be replaced by
SELECT * FROM [tablename] WHERE colx IN (val1, val2, valn);
```

## BETWEEN
> Used to select data between a range of data
```sql
SELECT * FROM [tablename] WHERE [colx] BETWEEN [firtlimit] AND [lastlimit];
```
**ex: *`select * from person
where date_of_birth 
between DATE '2000-01-01' and DATE '2022-01-01';`* **

## LIKE / ILIKE
> the like keyword is used to find data matching a pattern of string
```sql
SELECT * FROM [tablename] WHERE colx LIKE '%remaining_pattern'; 
```
```sql
SELECT * FROM [tablename] WHERE colx LIKE '___pattern%';
/*
the underscore is used to find only one character. 
So the number of underscores here represents exactly the number of characters to search.
*/
```
**NB**:
- the place of the `%` in the pattern depends on what we need exactly to be returned
- the `ILIKE` keyword functions as the `LIKE`, but is case insensitive

## GROUP BY
> Allows to group data based on a column
```sql
SELECT * FROM [tablename] GROUP BY [colx];
```

## GROUP BY HAVING
> > Allows to group data based on a column fulling a certain condition
```sql
SELECT * FROM [tablename] GROUP BY [colx] HAVING [condition];
```
## AGGREGATE FUNCTIONS
An aggregate function in SQL performs a calculation on multiple values and returns a single value. SQL provides many aggregate functions that include avg, count, sum, min, max, etc. An aggregate function ignores NULL values when it performs the calculation, except for the count function. 
An aggregate function in SQL returns one value after calculating multiple values of a column. We often use aggregate functions with the GROUP BY and HAVING clauses of the SELECT statement.

`MAX()` **=>** `returns the maximum value from a column`
`MIN()` **=>** `returns the minimum value from a column`
`COUNT()` **=>** `returns the number of values from a column`
`AVG()` **=>** `returns the average value from a column`
`ROUND()` **=>** `returns the rounded value of a numeric data`
`SUM()` **=>** `returns the summed value of data from a column`

## ALIASES
> SQL aliases are used to give a table, or a column in a table, a temporary name. Aliases are often used to make column names more readable. An alias only exists for the duration of that query.

**Alias column**
```sql
SELECT ]colname] AS [aliasname]
FROM [tablename];
```
**Alias Table**
```sql
SELECT [colname] AS [aliasname]
FROM [tablename];
```
## COALESCE
> Allows to add a default value in the case a value is missing (null)
```sql
SELECT * FROM person WHERE COALESCE(colname, firstreplecant, secondreplacant, ...);
```

## NULLIF
It is a function that takes two arguments and returns the first one if it different from the second the returned otherwise it will return `null`.
It may be usefull when we want to handle the division by zero error.
`A number divided by null returns null in postgresql`;
**use case**
```sql
SELECT 10 / NULLIF(0, 0); // returns null.
// manage to return a user-defined output with coalesce
SELECT COALESCE (SELECT 10 / NULLIF(0, 0), 0)
```

## TIMESTAMPS AND DATES
**Get current date**
```sql
SELECT NOW();// returns the timestamps (yyyy-mm-d hh:mm:ii)
SELECT NOW()::DATE;// returns the date only
SELECT NOW()::TIME;// returns the time only
```
**Add / substract dates**
```sql
SELECT NOW() [+|-] INTERVAL '[n] [unit]';
// the units can be: YEAR(s), DAY(s), MONTH(s), HOUR(s), MINUTE(s), SEC
```
**EX:**
``` 
select (now() - interval '3 month')::DATE;
// returns the date resulting from the substraction
```

## EXTRACT
Allows to extract a specific section of a date.

```sql
SELECT EXTRACT(unit FROM NOW());
// the units can be: CENTURY, YEAR, DAY, MONTH, HOUR, MINUTE, SEC
```

## AGE
This function allows to compute the difference between two dates.
```sql
SELECT date_col <, colx, coln> AGE(recent_date, date_col) from [tablename]
```

## PRIMARY KEYS
The PRIMARY KEY constraint uniquely identifies each record in a table. Primary keys must contain UNIQUE values, and cannot contain NULL values. A table can have only ONE primary key; and in the table, this primary key can consist of single or multiple columns (fields).
In Postgresql, the `BIGSERIAL` is pretty fine.

**Drop a constraint**
```sql
ALTER TABLE [tablename] DROP CONSTRAINT [constraintname];
```
 **Add a constraint**
 ```sql
 ALTER TABLE [tablename] ADD CONSTRAINT <constraintname> PRIMARY KEY (col1 <, col2>) ;
 ```

**Unique constraint**
The UNIQUE constraint ensures that all values in a column are different.
Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns.
A PRIMARY KEY constraint automatically has a UNIQUE constraint.

However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.
```sql
ALTER TABLE [tablename] ADD CONSTRAINT [constraintname] UNIQUE (colname);
//or
ALTER TABLE [tablename] ADD UNIQUE (colname); // lets the rdbms to chose the name
```

**Check constraints**
A CHECK constraint is a kind of constraint that allows you to specify if values in a column must meet a specific requirement.
The CHECK constraint uses a Boolean expression to evaluate the values before they are inserted or updated to the column.

If the values pass the check, PostgreSQL will insert or update these values to the column. Otherwise, PostgreSQL will reject the changes and issue a constraint violation error.
```sql
ALTER TABLE [tablename] ADD CONSTRAINT [constraintname] CHECK (condition);
```
**EX:** `alter table person add constraint gender_constraint check(gender='Female' OR gender = 'Male');`

## DELETE 
```sql
DELETE FROM [tablename]; //deletes all
DELETE FROM [tablename] WHERE [condition] <LIMIT x>// deletes according to a condedition. If the limit is passed, it deletes only the x first rows.
```

## UPDATE
```sql
UPDATE [tablename] SET [colx = valx] <, coln = valn> WHERE [condition]
```

## ON CONFLICT
ON CONFLICT DO NOTHING simply avoids inserting a row as its alternative action. ON CONFLICT DO UPDATE updates the existing row that conflicts with the row proposed for insertion as its alternative action. 
> NB: it works only when the field that may rise an exception is `UNIQUE`.
```sql
INSERT INTO users (id, level)
VALUES (1, 0)
ON CONFLICT (id) DO [UPDATE
SET level = users.level + 1 | NOTHING];
```

## INNER JOINS
```sql
SELECT * FROM [tablename1] JOIN [tablename2] ON [tablename1.fk] = [tablename2.pk];
```

## LEFT JOINS
```sql
SELECT * FROM [tablename1] LEFT  JOIN [tablename2] ON [tablename1.fk] = [tablename2.pk];
```

**To Sum Up**


> An SQL JOIN clause is used to combine rows from two or more tables, based on a common field between them.

There are different types of joins available in SQL:

__`INNER JOIN`__: returns rows when there is a match in both tables.

__`LEFT JOIN`__: returns all rows from the left table, even if there are no matches in the right table.

__`RIGHT JOIN`__: returns all rows from the right table, even if there are no matches in the left table.

__`FULL JOIN`__: combines the results of both left and right outer joins.

The joined table will contain all records from both the tables and fill in NULLs for missing matches on either side.

SELF JOIN: joins a table to itself as if the table were two tables, temporarily renaming at least one table in the SQL statement.

CARTESIAN JOIN: returns the Cartesian product of the sets of records from the two or more joined tables.


## EXPORT DATA TO CSV
```sh
\copy ([SQL REQUEST]) TO [path_to_csv_file] DELIMITER [','|';'|'|']  CSV HEADER;
```

## SERIAL AND SEQUENCES
In PostgreSQL, a sequence is a special kind of database object that generates a sequence of integers. A sequence is often used as the primary key column in a table.
PostgreSQL provides three serial pseudo-types `SMALLSERIAL`, `SERIAL`, and `BIGSERIAL` with the following characteristics:
|Name	|Storage Size	|Range|
|---|---|---|
|SMALLSERIAL|	2 bytes|	1 to 32,767|
|SERIAL|	4 bytes|	1 to 2,147,483,647|
|BIGSERIAL|	8 bytes|	1 to 9,223,372,036,854,775,807|

**Call the next value of the sequence**
```sql
SELECT nextval(['seq'::regclass]);
```
**Get the cuurrent value of a sequence**
```sql
SELECT currval(['seq'::regclass]);
```
**Reset the sequence's value**
```sql
ALTER SEQUENCE [seq] RESTART WITH n;
```

## EXTENSIONS
**View available extensions**
```sql
SELECT * FROM pg_available_extensions;
```
**Create an extension**
```sql
CREATE EXTENSION IF NOT EXISTS ["extension_name"];
```
**View the available functions**
```sh
\df
```
**Call a function (here from uuid)**
`SELECT uuid_generate_v4();`

