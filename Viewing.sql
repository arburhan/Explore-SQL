-- create DEPT table
CREATE TABLE DEPT (
  deptId int primary key,
  name varchar(50)
);
GO

-- insert into DEPT table
INSERT INTO DEPT(deptId, name) VALUES (101, 'AR');
INSERT INTO DEPT(deptId, name) VALUES (102, 'BR');
INSERT INTO DEPT(deptId, name) VALUES (103, 'CR');
GO

-- create EMPLOYEE table
CREATE TABLE EMPLOYEE (
  empId int,
  name varchar(15),
  deptId int,
  FOREIGN KEY (deptId) REFERENCES DEPT(deptId)
);
GO

-- insert into EMPLOYEE table
INSERT INTO EMPLOYEE(empId, name, deptId) VALUES (1, 'Clark',  101);
INSERT INTO EMPLOYEE(empId, name,deptId) VALUES (2, 'Dave', 102);
INSERT INTO EMPLOYEE(empId, name,deptId) VALUES (3, 'Ava',  103);
GO

-- fetch from EMPLOYEE table
SELECT * FROM EMPLOYEE;
GO
/*
view হল  এক বা একধাদিক table e এর মধ্যে ভার্চুয়াল রিলেশনশিপ । 
এর মাধ্যমেআমরা টেবিলের যেকোন কলাম থেকে ডাটা নিয়ে দেখাতে পারি । 
*/
-- create view
CREATE VIEW testView
AS
SELECT name
FROM EMPLOYEE;
GO

-- select from view
SELECT * FROM testView;
GO

-- update view
ALTER VIEW testView
AS
SELECT name, deptId
FROM EMPLOYEE;
GO

-- select from updated view
SELECT * FROM testView;
GO

-- drop view
DROP VIEW testView;
GO


--- view with join table
CREATE VIEW joinView
AS
SELECT EMPLOYEE.empId, EMPLOYEE.name 

FROM EMPLOYEE 
JOIN DEPT
ON EMPLOYEE.deptId = DEPT.deptId;
GO

SELECT * FROM joinView;
GO

--  update on column VALUE
update joinView 
set name = 'AR'
where empId = 1;
GO
SELECT * FROM joinView;

GO

-- meterialized VIEW
-- create indexed view
SET QUOTED_IDENTIFIER ON; 
GO
CREATE VIEW meterializedView
WITH SCHEMABINDING
AS 
SELECT EMPLOYEE.name AS empName, DEPT.name AS deptName
FROM dbo.EMPLOYEE 
JOIN dbo.DEPT
ON dbo.EMPLOYEE.deptId = dbo.DEPT.deptId;
GO

-- create unique clustered index on the view
CREATE UNIQUE CLUSTERED INDEX metaClusterViewIndex
ON meterializedView(empName);
GO

-- select from the view
SELECT * FROM meterializedView;
GO

