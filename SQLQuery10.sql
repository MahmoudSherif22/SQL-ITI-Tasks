





------------------------------------------------

/* 
part2 

1-
- Batch is multiple statements sent together to 
  database but maybe not executed together 
  and if error happen in one of the statements 
  the other statements may run 
- transaction is a set of quries that sent together
  to DB and executed together if one raise and 
  error an automatic rollback will happen 
- script is a block of code that contain multiple
SQL statement such as batch ,transaction,comments


------------------------
2- 
- Stored Procedure is a set of SQL statements 
  That saved so could be reused again
- Trigger is a special type of stored procedure 
  thats called when event happens in table ,view
-------------------------
3-
- Stored procedure return only 1 paramater   
  of type integer , created to do action,cant
  be used in select statement
- Function can return paramter from with all 
  datatypes ,created to return value,can be used
  in select statment
--------------------------
4- 
- drop is DDL will delete the structure of table
- truncate will delete the content of table 
  cant use where with it and cant rollback,
  faster than delete
- delete will delete the content of table 
  i can use where with it and cant rollback
--------------------------
5-
- select statement gets data from one table or 
  more
- select into copy data from table to another 
  and create new table 
---------------------------
6- 
- Local variables are created by the user 
  using @ , Accessible only in current batch 
  ,Stored Procedure or function
- Global variables are predefined by the existed 
  system start with @@,holds system -level data
7- 
- convert convert a value from datatype to another 
  supports format styles (for dates/numbers)
- cast convert a values from datatype to another 
  doesnt supports format styles 
8-
DDL -> Data Definition Langauge used to change 
       the structure of tables ex(drop,Alter,create)
DML -> Data Manipulation Langague used to change
       or add new data (insert , delete,truncate)
DCL -> Data control Langauge used to control
       permssions on the server for user
	   eg. GRANT ,REVOKE 
DQL -> Data Query langauge used to retrive data
       from tables 
TCL -> Transaction Control Langauge used to control
       transaction in table ,ensuring data integrity
	   and consistency 
9- 

10 -
- inline table valued -> returns a table and allow one 
  select 
- multi statement function ->returns a table and 
  allow multiple statements ,you must create a table
  insert into it and return it 
11- 
-varchar(50) allows string consist of 50 character
-varchar(max) allows string with dynamic size change

12-
Datetime(3) -> Date + time not precise ,time can
               hold to 3.3 milliseconds ,dont hold
			   time zone info 
Datetime2(7) -> Date +time more precise ,time can
                hold to 7 millisecond(new version of datetime)
datetimeoffset(7) -> same as Datetime2(7) but with
                     time zone 
13-
Default instance -> allowed only one default instance 
                   per machine 
				   uses the computer name as the
				   servername
				   No need to specify instance name
				   when connecting 
Named instance -> You can have many named instances
                  on the same machine,
				  each instance has a custom name
				  you must specify the instance name 
				  when connecting 
14 -
Windows authentication 

Uses your Windows (Active Directory) account.

No need to enter username/password — it uses your Windows login.

More secure and easy to manage in companies.

Supports Integrated Security.

SQL Server Authentication 
You manually create a username & password inside SQL Server.

Credentials are stored in SQL Server, not in Windows.

Useful for external apps, cross-platform access, or non-Windows users. 
*/ 
