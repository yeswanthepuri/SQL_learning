# SQL_learning
this is for learning SQL
how to add a default constraint, and its used for making sure some value is getting inserted insturd blank value when no value is provided.

syntax:
add:(Existing column)
Alter Table TableName
Add Constraint Constrsint_name_DF value for coulmn name;
add(New Column)
alter table tablename
add Columnname type (null|not Null)
constraint constraint_name Default value
drop:
alter table tablename
drop constraint constraintname

Cascading referential integrity constraint:
they are 4 options t do this:
1.Set Default: if an atempt is made to delete or alter which is referenced by forigen key then the column is set to default.

2.Noaction:if an atempt is made to delete or alter which is referenced by forigen key will not allow us to delete

3.Cascade:if an atempt is made to delete or alter which is referenced by forigen key it will delete the columns in the other table in which the reference is present.

4.Set Null:if an atempt is made to delete or alter which is referenced by forigen key set to null.


Adding a check Constraint:
  this allowes us to add some check logic:
syntax:
alter TABLE tbluser
add CONSTRAINT ck_tbluser_age CHECK (Age>0 and Age<150)

Identity:
if a column is added with identity then.
Alter Table Names
Add Id_new Int Identity(1, 1)
Go
in case if we want to turn off identity to insert some value in column then
SET IDENTITY_INSERT dbo.Tmp_Names ON
insert with value then turn it off back
SET IDENTITY_INSERT dbo.Tmp_Names OFF
  
 this is to see the identity after droping some columns and to make use of those numbers
 DBCC CHECKIDENT(tblPerson, RESEED, 0)
 
 SCOPE_IDENTITY() - SAME SESSION AND SAMESCOPE
 @@IDENTITY() - SAME SESSION AND ANY SCOPE
 IDENTITY_CURRENT('TABLENAME') - SPECIFIC TABLE ACROSS ANY TABLE AND ANY SCOPE.
 
 
 UNIQ KEY :
ALTER TABLE TABLE_NAME
ADD CONSTRAINT UQ_TABLENAME_COLUMNNAME UNIQUE COLUMNNAME
--SINGLE TABLE CAN HAVE MULTIPLE UNIQUE KEYS

group by:
Group by works with combination of aggregrate function and column.
Example : select sum(age) as AgeSum,Gender from tbluser GROUP BY Gender

select sum(age) as AgeSum,count(Gender),Gender from tbluser 
where gender = 'eb6e93f0-a836-4d65-8f51-1aae29a9dd8b'
GROUP BY Gender 

select sum(age) as AgeSum,count(Gender),Gender from tbluser 
GROUP BY Gender 
Having gender = 'eb6e93f0-a836-4d65-8f51-1aae29a9dd8b'

-- in both the cases the we get the same result but in where we only sum the results on gender
-- but in having we first aggrigate and then filter

<h1>Types of Joins in SQL</h1>
-<b>inner join</b>: Only matching rows between both the tables will be coming
select * from tbluser inner join tbldepartment 
on tbluser.DptID = tbldepartment.ID
(or)
select * from tbluser join tbldepartment 
on tbluser.DptID = tbldepartment.ID
-<b>outer join</b>
  -left outer join: Returns all the rows from left and  matching from right table
  select * from tbluser Left Outer join tbldepartment 
  on tbluser.DptID = tbldepartment.ID
  (or)
  select * from tbluser Left join tbldepartment 
  on tbluser.DptID = tbldepartment.ID
  -right outer join: Returns all the rows from right  and  matching from left table
  select * from tbluser right Outer join tbldepartment 
  on tbluser.DptID = tbldepartment.ID
  (or)
  select * from tbluser right join tbldepartment 
  on tbluser.DptID = tbldepartment.ID
  -<b>full join</b>: Returns all the rows from right and  all from left table
  select * from tbluser FULL Outer join tbldepartment 
  on tbluser.DptID = tbldepartment.ID
  (or)
  select * from tbluser FULL join tbldepartment 
  on tbluser.DptID = tbldepartment.ID
-<b>cross join</b>: provides the cartigen product of both the tables, No 'On' should be used for cross join.
Result of join = number of rows in table1 * number of rows in table2
  select * from tbluser Cross join tbldepartment 
  -<b>Self join</b>: A join that gets join to it self it's called self join
   select * from tbluser self join tbluser on tbluser.managerID =tbluser.ID


<h4>Replacing Null in SQL</h4>
<br/>
<b>ISNULL() function</b>:
select name,ISNULL(name,'No Manager') as managername from tbluser asuser join tbluser manager
on user.ManagerID = Manager.ID
<br/>
<b>CASE statment</b>:
select name,
case
WHERE manager.name is null then 'No Manager' else manager.Name
as managername from tbluser asuser join tbluser manager
on user.ManagerID = Manager.ID
<br/>
<b>COALESCE() function</b>: this is used for getting the first non null value.
select name,COALESCE(name,'No Manager') as managername from tbluser asuser join tbluser manager
on user.ManagerID = Manager.ID
<br/>
<h2>Union and Union All</h2>
for union and union all to work the datatype and sequence of the order of solumns should be the same.
<b>Union: </b>
Return all the distinct result from two different table and also sorts the data.
Union is slow compare to union all as it should perform distint sort
ex:
select sum(age) as AgeSum,count(Gender),Gender from tbluser 
where gender = 'eb6e93f0-a836-4d65-8f51-1aae29a9dd8b'
GROUP BY Gender 
union
select sum(age) as AgeSum,count(Gender),Gender from tbluser 
GROUP BY Gender 
Having gender = 'eb6e93f0-a836-4d65-8f51-1aae29a9dd8b'
<br/>
<b>Union All: </b>
return all the results from two tables including the duplicates
ex:
select sum(age) as AgeSum,count(Gender),Gender from tbluser 
where gender = 'eb6e93f0-a836-4d65-8f51-1aae29a9dd8b'
GROUP BY Gender 
union all
select sum(age) as AgeSum,count(Gender),Gender from tbluser 
GROUP BY Gender 
Having gender = 'eb6e93f0-a836-4d65-8f51-1aae29a9dd8b'
<br/>
<b>Difference between Union and Join</b>
union combines result set of two select query where as join will return the logical grouping of two tables.
<br/>
<h2>Store Procedure</h2>
Store procedure is a group of transaction statment, this keep the query constrected an make the execution if the same query is used over and over.
<br/>
Syntax EX: 
<br/>
CREATE PROCEDURE spGetagegroupedbyGender
AS
BEGIN
select sum(age) as AgeSum,count(Gender),Gender from tbluser 
where gender = 'eb6e93f0-a836-4d65-8f51-1aae29a9dd8b'
GROUP BY Gender 
END
<br/>
<h2>Store Procedure with input and output paramater</h2>
<br />
<h5>Creating SP with input and output paramater</h5>
<br/>
CREATE PROCEDURE spGetagegroupedbyGender
@Gender UNIQUEIDENTIFIER,
@EmployCount int output
AS
BEGIN
select @EmployCount = count(Gender) from tbluser 
where gender = @Gender
GROUP BY Gender 
END
<br/>
<h5>Execute SQL</h5>
-- to execute this output paramater the data type shoul match.
DECLARE @EmployCount INT
EXEC spGetagegroupedbyGender 'eb6e93f0-a836-4d65-8f51-1aae29a9dd8b', @EmployCount output
PRINT @EmployCount
<br/>
sp_help procedure_name - view the info of the storeprocedure.
<br />
sp_helptext procedure_name - view the text of the sp
<br />
sp_depends procedure_name - showes the depedency ex: any sp or tables that is refering this SP.
 <br/>
if no output paramater is declared the the value @EmployCount wil be null.
<br/>
<h2>return and output paramater</h2>
return - statment can return only intiger value and only one value and mostly used for success or fail
<br/>
output - statment return any type of value and more then one result and used to return values like name, count etc.
<br/>
<h2>Advantages of store procedures</h2>
<ul>
  <li> Execution plan retention and reusability</li>
  <li> reduces network traffic</li>
  <li> code reusability and better maintainablity</li>
  <li> better security</li>
  <li> avoids scripting attack</li>
</ul>
<br/>
<h2>Functions</h2>
they are 2 types of functions 
1. user define function
2. system functions

System defined functions are the one that are exising in SQL server and are used for data manipulation. below are the example of some of the functions

1. ASCII(Character_Expression) - Returns the ASCII code of the given character expression.
2. CHAR(Integer_Expression) - Converts an int ASCII code to a character. The Integer_Expression, should be between 0 and 255.
3. LTRIM(Character_Expression) - Removes blanks on the left handside of the given character expression.
4. RTRIM(Character_Expression) - Removes blanks on the right hand side of the given character expression.
5. LOWER(Character_Expression) - Converts all the characters in the given Character_Expression, to lowercase letters.
6. UPPER(Character_Expression) - Converts all the characters in the given Character_Expression, to uppercase letters.
7. REVERSE('Any_String_Expression') - Reverses all the characters in the given string expression.
8. LEN(String_Expression) - Returns the count of total characters, in the given string expression, excluding the blanks at the end of the expression.
9. LEFT() - LEFT('strig',number of left we need) ex:LEFT('sample',2) o/p:sa
10. RIGHT() - RIGHT('strig',number of right we need) ex:RIGHT('sample',2) o/p:le
11. CHARINDEX() -  CHARINDEX('string to search','string','[optional] start index') ex: CHARINDEX('@','sample@sam.com') o/p:7
12. SUBSTRING() - SUBSTRING('string','starting position','end positopn') EX: SUBSTRING('sample@sam.com',1,5) o/p: sample
13. Replicate - replicate a given string the number times as requested
SELECT [NAMES],
 Lower(SUBSTRING(email,1,2))
  + REPLICATE('*',5) + 
   SUBSTRING(email, CHARINDEX('@',email),LEN(email)- CHARINDEX(email,'@')) as email_display
 from tbluser 
14. Space - insert spaces as we require
15. Patindex - pat index is same as char index. in patIndex we can use wildcard where as in char index we can't use whildcard 
ex:CHARINDEX('%@gmai%',email) - this generated whild card result
16. Replace - replace what every you ant using this
ex: select email, REPLACE(email, '.com','.net') as convertedemail from tbluser
.com in this example can also be a whild card.  like '%.com'
17. Stuff -- stuff something  Stuff('string',start,end,'stuff something')
ex: 
SELECT [NAMES],
 stuff(email,
  2 ,CHARINDEX('@', email)-2,
   REPLICATE('*',5)
   ) as email_display
 from tbluser
<h2>Date  functions</h2>
1. DateTime data types
2. DateTime functions available to select the current system date and time
3. Understanding concepts - UTC time and Time Zone offset
<br/>
creating a table with different date types
CREATE TABLE [tblDateTime]
(
 [c_time] [time](7) NULL,
 [c_date] [date] NULL,
 [c_smalldatetime] [smalldatetime] NULL,
 [c_datetime] [datetime] NULL,
 [c_datetime2] [datetime2](7) NULL,
 [c_datetimeoffset] [datetimeoffset](7) NULL
)

<br/>
datetimeoffset : will give the offset of UTC.
UTC(Coordinated universal time)
Funcations in date time 
Function	    Date Time     Format	      Description
GETDATE()	    2012-08-31    20:15:04.543	Commonly used function
CURRENT_TIMESTAMP	2012-08-31 20:15:04.543	ANSI SQL equivalent to GETDATE
SYSDATETIME()	2012-08-31 20:15:04.5380028	More fractional seconds precision
SYSDATETIMEOFFSET()	2012-08-31 20:15:04.5380028 + 01:00	More fractional seconds precision + Time zone offset
GETUTCDATE()	2012-08-31 19:15:04.543	UTC Date and Time
SYSUTCDATETIME()	2012-08-31 19:15:04.5380028	UTC Date and Time, with More fractional seconds precision
<br/>
ISDATE() - Checks if the given value, is a valid date, time, or datetime. Returns 1 for success, 0 for failure.

Examples:
Select ISDATE('PRAGIM') -- returns 0
Select ISDATE(Getdate()) -- returns 1
Select ISDATE('2012-08-31 21:02:04.167') -- returns 1
<br/>
Day() - Returns the 'Day number of the Month' of the given date

Examples:
Select DAY(GETDATE()) -- Returns the day number of the month, based on current system datetime.
Select DAY('01/31/2012') -- Returns 31

Month() - Returns the 'Month number of the year' of the given date

Examples:
Select Month(GETDATE()) -- Returns the Month number of the year, based on the current system date and time
Select Month('01/31/2012') -- Returns 1

Year() - Returns the 'Year number' of the given date

Examples:
Select Year(GETDATE()) -- Returns the year number, based on the current system date
Select Year('01/31/2012') -- Returns 2012

DateName(DatePart, Date) - Returns a string, that represents a part of the given date. This functions takes 2 parameters. The first parameter 'DatePart' specifies, the part of the date, we want. The second parameter, is the actual date, from which we want the part of the Date.
Ex:
Select DATENAME(Day, '2012-09-30 12:43:46.837') -- Returns 30
Select DATENAME(WEEKDAY, '2012-09-30 12:43:46.837') -- Returns Sunday
Select DATENAME(MONTH, '2012-09-30 12:43:46.837') -- Returns September
<br/>
DatePart(DatePart, Date) - Returns an integer representing the specified DatePart. This function is simialar to DateName(). DateName() returns nvarchar, where as DatePart() returns an integer. The valid DatePart parameter values are shown below.
Examples:
Select DATEPART(weekday, '2012-08-30 19:45:31.793') -- returns 5
Select DATENAME(weekday, '2012-08-30 19:45:31.793') -- returns Thursday
<br/>
DATEADD (datepart, NumberToAdd, date) - Returns the DateTime, after adding specified NumberToAdd, to the datepart specified of the given date.

Examples:
Select DateAdd(DAY, 20, '2012-08-30 19:45:31.793') 
-- Returns 2012-09-19 19:45:31.793
Select DateAdd(DAY, -20, '2012-08-30 19:45:31.793') 
-- Returns 2012-08-10 19:45:31.793

DATEDIFF(datepart, startdate, enddate) - Returns the count of the specified datepart boundaries crossed between the specified startdate and enddate.

Examples:
Select DATEDIFF(MONTH, '11/30/2005','01/31/2006') -- returns 2
Select DATEDIFF(DAY, '11/30/2005','01/31/2006') -- returns 62
<br/>
<h3>User define function </h3>
CREATE FUNCTION fnComputeAge(@DOB DATETIME)
RETURNS NVARCHAR(50)
AS
BEGIN

DECLARE @tempdate DATETIME, @years INT, @months INT, @days INT
SELECT @tempdate = @DOB

SELECT @years = DATEDIFF(YEAR, @tempdate, GETDATE()) - CASE WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())) THEN 1 ELSE 0 END
SELECT @tempdate = DATEADD(YEAR, @years, @tempdate)

SELECT @months = DATEDIFF(MONTH, @tempdate, GETDATE()) - CASE WHEN DAY(@DOB) > DAY(GETDATE()) THEN 1 ELSE 0 END
SELECT @tempdate = DATEADD(MONTH, @months, @tempdate)

SELECT @days = DATEDIFF(DAY, @tempdate, GETDATE())

DECLARE @Age NVARCHAR(50)
SET @Age = Cast(@years AS  NVARCHAR(4)) + ' Years ' + Cast(@months AS  NVARCHAR(2))+ ' Months ' +  Cast(@days AS  NVARCHAR(2))+ ' Days Old'
RETURN @Age

End

executing the function

Select Id, Names, DateOfBirth, dbo.fnComputeAge(DateOfBirth) as Age from TBLUSER

<br/>
<h2>Cast and Convert functions</h2>
CAST ( expression AS data_type [ ( length ) ] )
CONVERT ( data_type [ ( length ) ] , expression [ , style ] )
<br/>
To get just the date part, from DateTime
SELECT CONVERT(VARCHAR(10),GETDATE(),101)

In SQL Server 2008, Date datatype is introduced, so you can also use
SELECT CAST(GETDATE() as DATE)
SELECT CONVERT(DATE, GETDATE())

