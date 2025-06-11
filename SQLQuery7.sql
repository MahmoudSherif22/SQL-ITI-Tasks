-------------------------------------------------
--1 

CREATE FUNCTION Get_Month(@date date)
RETURNS VARCHAR(20)
AS
BEGIN 
    DECLARE @month_name VARCHAR(20) 
	SET @month_name = DATENAME(MONTH,@date);
	RETURN @month_name;
END;


SELECT dbo.Get_Month('2007.01.01');

--------------------------------------------------
--2 
CREATE FUNCTION Get_values(@num1 INT , @num2 INT)
RETURNS @t table 
              (nums INT)
AS 
BEGIN 

WHILE(@num2 > @num1)
  BEGIN
    INSERT INTO @t(nums) VALUES(@num2-1)
    SET @num2 -=1
  END;

 RETURN
END 
 
 SELECT * from dbo.Get_values(1,9);

 -------------------------------------------
 --3 
 SELECT * 
 FROM Student
 SELECT *
 FROM Department

 CREATE FUNCTION Get_info(@id INT)
 RETURNS TABLE 
 AS 
 RETURN(
 SELECT CONCAT(St_Fname ,' ',St_Lname) AS FullName
 FROM dbo.Student S INNER JOIN dbo.Department D
 ON S.Dept_Id = D.Dept_Id
 WHERE D.Dept_Id = @id);

 SELECT * from dbo.Get_info(10);
 -------------------------------------
 --4
CREATE FUNCTION Get_message(@st_id INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @message VARCHAR(50)

    SELECT @message = 
        CASE 
            WHEN S.St_Fname IS NULL AND S.St_Lname IS NULL THEN 'First name & last name are null'
            WHEN S.St_Fname IS NULL THEN 'First name is null'
            WHEN S.St_Lname IS NULL THEN 'Last name is null'
            ELSE 'First name & last name are not null'
        END
    FROM dbo.Student S
    WHERE S.St_Id = @st_id

    RETURN @message
END

SELECT dbo.Get_message(13);
------------------------------------------------
--5
CREATE FUNCTION Get_mang_info(@mang_id INT)
RETURNS TABLE
AS 
RETURN(
SELECT D.Dept_Name,D.Dept_Manager,D.Manager_hiredate
FROM Department D 
INNER JOIN Instructor I ON d.Dept_Manager = i.Ins_Id
WHERE D.Dept_Manager = @mang_id);

select *from dbo.Get_mang_info(1)

-----------------------------------------------
--6 

CREATE FUNCTION getStud(@s VARCHAR(20))
RETURNS @t TABLE (st_name VARCHAR(50))
AS
BEGIN
    IF @s = 'first name'
    BEGIN
        INSERT INTO @t (st_name)
        SELECT St_Fname FROM Student
    END
    ELSE IF @s = 'last name'
    BEGIN
        INSERT INTO @t (st_name)
        SELECT St_Lname FROM Student
    END

    RETURN
END
