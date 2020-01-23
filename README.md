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
