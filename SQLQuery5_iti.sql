
--------------------------------------------------
-- 1 1
SELECT COUNT(st_age)
FROM Student
-- 2 

SELECT DISTINCT(Ins_Name)
FROM dbo.Instructor

-- 3 

SELECT *
FROM ( SELECT st.St_Id AS [Student Name], st.St_Fname + ' ' +st.St_Lname AS [Student Full Name] ,db.Dept_Name AS [Department Name]
       FROM dbo.Student AS st inner join dbo.Department AS db 
       ON st.Dept_Id = db.Dept_Id) AS new_t

WHERE new_t.[Student Full Name] is not null;

-------------------------------------------------
-- 4 

SELECT Ins.Ins_Name As [Instructor Name] ,db.Dept_Name AS [Department Name] 
FROM dbo.Instructor AS Ins LEFT OUTER JOIN dbo.Department AS db 
ON Ins.Dept_Id = db.Dept_Id

-------------------------------------------------
--5 
SELECT 
    std.St_Fname + ' ' +std.St_Lname AS [Student Name] ,
	crs.Crs_Name AS [COURSE NAME]
FROM dbo.Course AS crs
INNER JOIN dbo.Stud_Course AS std_crs ON crs.Crs_Id = std_crs.Crs_Id
INNER JOIN dbo.Student AS std ON std.St_Id = std_crs.St_Id

---------------------------------------------------
-- 6 

SELECT Top_Name ,COUNT(crs.Crs_Name) AS [Number of Courses]
FROM dbo.Topic AS tp 
INNER JOIN dbo.Course AS crs ON tp.Top_Id =crs.Top_Id
GROUP BY tp.Top_Name

-------------------------------------------------
--7 

SELECT Max(Ins.Salary) AS MAX_SALARY, MIN(Ins.Salary) AS [MIN_SALARY]
FROM dbo.Instructor AS Ins

-------------------------------------------------
-- 8 
SELECT *
FROM dbo.Instructor AS Ins
WHERE Ins.Salary < (SELECT AVG(Ins.Salary)
                    FROM dbo.Instructor AS Ins)

-------------------------------------------------
--9 

SELECT db.Dept_Name
FROM dbo.Department AS db 
INNER JOIN dbo.Instructor AS Ins ON db.Dept_Id = Ins.Dept_Id
WHERE Ins.Salary = (SELECT MIN(SALARY)
                    FROM dbo.Instructor)

-------------------------------------------------
--10 

SELECT *
FROM (SELECT *, ROW_NUMBER() OVER(ORDER BY Ins.Salary DESC) AS RN
      FROM dbo.Instructor AS Ins ) AS t1
WHERE T1.RN = 1 OR T1.RN = 2 ;

-- SECOND SOLUTION 
SELECT TOP(2) SALARY 
FROM dbo.Instructor

-------------------------------------------------

--11 
SELECT Ins.Ins_Name,COALESCE(CONVERT(nvarchar(20),Ins.Salary),'Instructor bonus') 
FROM dbo.Instructor AS Ins 

-------------------------------------------------
--12 
SELECT AVG(Ins.Salary) AS AvgSalary 
FROM dbo.Instructor AS Ins 
-------------------------------------------------
--13 
SELECT *
FROM dbo.Student Std 

SELECT std.St_Fname,super.*
FROM dbo.Student AS std 
INNER JOIN dbo.Student AS super
ON super.St_Id = std.St_super;
-------------------------------------------------
--14 
SELECT *
FROM dbo.Instructor Std 

SELECT *
FROM (SELECT * ,ROW_NUMBER() OVER(PARTITION BY db.Dept_Id order by Salary) AS RN
      FROM dbo.Instructor AS db ) AS t2
WHERE t2.RN = 1 OR t2.RN = 2 
-------------------------------------------------