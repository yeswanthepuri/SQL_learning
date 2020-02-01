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
