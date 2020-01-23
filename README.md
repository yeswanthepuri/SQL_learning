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
