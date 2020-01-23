-- use TravelWheels
-- Create TABLE TBLUSER
-- (
--     ID UNIQUEIDENTIFIER,
--     NAMES VARCHAR(60),
--     Gender VARCHAR(5)
-- )
-- ALTER TABLE TBLUSER
-- alter COLUMN Gender UNIQUEIDENTIFIER

-- CREATE TABLE TBLGender
-- (
--    ID UNIQUEIDENTIFIER,
--    GenderNAMES VARCHAR(60),
-- )
--  ALTER TABLE TBLUSER
--  alter COLUMN ID UNIQUEIDENTIFIER not null
--  add CONSTRAINT TBLUSER_ID_PK PRIMARY KEY (ID)

--  ALTER TABLE TBLGender
--  add CONSTRAINT primary_ID PRIMARY KEY (ID)

-- ALTER TABLE TBLUSER ADD CONSTRAINT TblUser_Gender_FK
-- FOREIGN KEY (Gender) REFERENCES TBLGender(ID) 


-- use TravelWheels 
-- select * from TBLUSER;
-- select * from TBLGender

-- insert into TBLGender(ID,GenderNAMES) VALUES (NEWID(),'Male');
-- insert into TBLGender(ID,GenderNAMES) VALUES (NEWID(),'FeMale');
-- insert into TBLGender(ID,GenderNAMES) VALUES (NEWID(),'NeverMind');

-- INSERT into TBLUSER(ID,NAMES,Gender) VALUES (NEWID(),'Krithvika','eb6e93f0-a836-4d65-8f51-1aae29a9dd8b')

 --select * from tblgender;
--Default CONSTRAINT
--  ALTER TABLE TBLUSER
--  ADD CONSTRAINT DF_TBLUSER_GENDER DEFAULT 'eb5dfccf-267d-45f6-a104-ea61bdc5a107' FOR Gender


