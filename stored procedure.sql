
-- create
CREATE TABLE EMPLOYEE (
  empId int,
  name varchar(15),
  dept varchar(10)
);

-- insert
INSERT INTO EMPLOYEE(empId,name,dept) VALUES (1, 'Clark', 'Sales');
INSERT INTO EMPLOYEE(empId,name,dept) VALUES (2, 'Dave', 'Accounting');
INSERT INTO EMPLOYEE(empId,name,dept) VALUES (3, 'Ava', 'Sales');


GO

-- create PROCEDURE

CREATE PROCEDURE empProc
AS
BEGIN
    SELECT * 
    FROM EMPLOYEE
END;
GO

EXEC empProc;
GO

-- create with encryption

create PROCEDURE empProcEncrypt
with encryption
AS
BEGIN
SELECT * from EMPLOYEE
end;
GO

EXEC empProcEncrypt;
GO

-- with input parameter
create PROCEDURE procInput
@dept varchar(50)
AS
BEGIN
select name, dept
from EMPLOYEE
where dept = @dept
end;
GO

EXEC procInput 'Sales';
GO

-- with output parameter
create PROCEDURE procOutpt
@total int output
AS
BEGIN
select @total = count(*)
from EMPLOYEE
end;
GO

declare @total int
EXEC procOutpt @total output
print @total;
GO

-- sp text
/*
it return source codes 
but not give encryption codes
*/
sp_helptext procOutpt;
GO
sp_helptext empProcEncrypt;
GO

-- sp help
/*
it returns view details 
*/

sp_help procOutpt;
GO
sp_help EMPLOYEE;
GO
-- sp depends 
/*
returns all PROCEDURE name when choose TABLE
returns table name when select any PROCEDURE name
*/
sp_depends EMPLOYEE
GO
sp_depends procOutpt
GO


