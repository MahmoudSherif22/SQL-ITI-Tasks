


---------------------------------------------------------
--1 
CREATE PROC getstd
as 
SELECT D.Dept_Name,COUNT(*)
FROM dbo.Student S
INNER JOIN dbo.Department D
ON S.Dept_Id = D.Dept_Id
GROUP BY D.Dept_Name;
----------------------------------------------------------
--2 
USE Company_SD;
CREATE PROC checkemp
AS
BEGIN
    DECLARE @x INT;

    -- Get the number of employees working on project p1
    SELECT @x = COUNT(*) 
    FROM dbo.Works_for w 
    INNER JOIN dbo.Employee E ON w.ESSn = E.SSN
    INNER JOIN dbo.Project p ON p.Pnumber = w.Pno
    WHERE p.Pnumber = 100;

    -- Use IF condition for logic
    IF @x >= 3
    BEGIN
        PRINT 'The number of employees in project p1 is 3 or more';
    END
    ELSE
    BEGIN
        PRINT 'The following employees work for project p1:';
        
        SELECT E.Fname, E.Lname
        FROM dbo.Works_for w 
        INNER JOIN dbo.Employee E ON w.ESSn = E.SSN
        INNER JOIN dbo.Project p ON p.Pnumber = w.Pno
        WHERE p.Pnumber = 'p1';
    END
END;
------------------------------------------------------------
--3
CREATE PROC change_emp (@old_emp_num INT , @new_emp_num INT  , @p_num INT) 
AS 
BEGIN 
UPDATE dbo.Works_for 
SET ESSn = @new_emp_num
WHERE ESSn = @old_emp_num AND  Pno = @p_num ;
END;
-------------------------------------------------------------
--4 
ALTER TABLE dbo.Project 
ADD budget int 
UPDATE dbo.Project
SET budget = 500

CREATE TABLE history
(
ProjectNo nvarchar(50) ,
UserName varchar(20) ,
ModifiedDate Date,
BudgetOld int ,
BudgetNew int 
)

CREATE TRIGGER t1 
ON dbo.Project 
INSTEAD OF UPDATE 
AS 
   IF(UPDATE(budget))
   BEGIN 
   DECLARE @new int ,@old int ,@PNO INT
   SELECT @old = Pnumber FROM deleted
   SELECT @new = Pnumber FROM inserted
   SELECT @PNO = Pnumber FROM deleted
   INSERT INTO dbo.history(ProjectNo,UserName,ModifiedDate,BudgetOld,BudgetNew)
   VALUES(@PNO,SUSER_NAME(),GETDATE(),@old,@new)
   END 
------------------------------------------
--5
USE ITI;
ALTER TRIGGER dbo.t3 
ON dbo.department 
INSTEAD OF insert 
AS
BEGIN
SELECT 'Not allowed'
END;
----------------------------------
--6
USE Company_SD;

ALTER TRIGGER t4 
ON dbo.Employee
AFTER INSERT 
AS 
IF FORMAT(GETDATE(),'MMMM') = 'March'
BEGIN
ROLLBACK TRANSACTION
END; 
------------------------------
--7


USE ITI;
CREATE TABLE stud_audit
(
Server_User_Name varchar(50),
Date date ,
Note varchar(70)
)
CREATE TRIGGER t5
ON dbo.Student 
AFTER insert 
AS 
BEGIN
INSERT INTO stud_audit(Server_User_Name,Date,Note)
SELECT USER_NAME(),GETDATE(),USER_NAME()+' insert new Row with key ='+CAST(St_Id AS varchar(50))
FROM inserted
END;
--------------------------------
--8 
CREATE TRIGGER t6 
ON dbo.Student 
INSTEAD OF DELETE
AS 
BEGIN
INSERT INTO stud_audit(Server_User_Name,Date,Note)
SELECT USER_NAME(),GETDATE(),USER_NAME()+'try to delete new Row with key ='+CAST(St_Id AS varchar(50))
FROM DELETED
END;