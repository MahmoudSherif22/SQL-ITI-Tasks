

----------------------------------------
--1 
CREATE VIEW Vstd
AS 
SELECT CONCAT(s.St_Fname ,' ',s.St_Lname) AS FullName , c.Crs_Name
FROM dbo.Student s 
INNER JOIN dbo.Stud_Course sc
ON s.St_Id = sc.St_Id
INNER JOIN dbo.Course c
ON c.Crs_Id = sc.Crs_Id
WHERE sc.Grade > 80 ;


SELECT *
FROM Vstd
-------------------------------------------
--2
CREATE VIEW  man_topic  WITH ENCRYPTION AS
SELECT i.Ins_Name , t.Top_Name FROM Instructor i 
JOIN Department d 
ON i.Ins_Id = d.Dept_Manager 
JOIN Ins_Course ic on ic.Ins_Id = i.Ins_Id 
JOIN Course c on c.Crs_Id = ic.Crs_Id 
JOIN Topic t on t.Top_Id =c.Top_Id

SELECT *
FROM man_topic;

--------------------------------------------------
--3
SELECT *
FROM Department

CREATE VIEW Get_ins
AS
SELECT i.Ins_Name ,d.Dept_Name
FROM dbo.Department d 
INNER JOIN dbo.Instructor i ON d.Dept_Id = I.Dept_Id
WHERE d.Dept_Name = 'Java' OR d.Dept_Name ='SD';

SELECT * 
FROM Get_ins
---------------------------------------
--4
CREATE VIEW V1 
AS 
SELECT * 
FROM dbo.Student
WHERE St_Address = 'Cairo' OR St_Address = 'Alex'
with check option;

-----------------------------------------
--5 
CREATE VIEW get_data
AS 
SELECT p.Pname,COUNT(e.SSN) AS NumberofEmployee
FROM Company_SD.dbo.Employee  e
INNER JOIN Company_SD.dbo.Project p 
ON e.Dno = p.Dnum
GROUP BY P.Pname


CREATE VIEW get_dataa
AS 
SELECT p.Pname,COUNT(w.ESSn) AS TOTAL
FROM Company_SD.dbo.Works_for W
INNER JOIN Company_SD.dbo.Project p 
ON W.Pno = p.Pnumber
GROUP BY p.Pname;

-----------------------------------------
--6
USE ITI;
CREATE UNIQUE INDEX idx_hire
ON dbo.Department(Manager_hiredate)  
--result:
--The CREATE UNIQUE INDEX statement terminated because a duplicate key was found for the object
--name 'dbo.Department' and the index name 'idx_hire'. The duplicate key value is (<NULL>).
-----------------------------------------
--7 


-------------------------------------------
--8

CREATE TABLE daily_transaction (id INT , amount INT ) 
CREATE TABLE last_transaction (id INT ,amount INT )

INSERT INTO daily_transaction VALUES(1,1000),(2,2000),(3,1000)
INSERT INTO last_transaction VALUES(1,4000),(4,2000),(2,1000)

MERGE INTO last_transaction AS L
USING daily_transaction AS S 
ON L.id = S.id 
WHEN MATCHED THEN 
UPDATE SET L.amount = S.amount 
WHEN NOT MATCHED THEN 
INSERT(id,amount) 
VALUES(id , amount);


----------------------------------------
--9 

SELECT 
leadd = LEAD(CONCAT(S.St_Fname,' ',S.St_Lname)) OVER(ORDER BY sc.GRADE),
LAGG = LEAD(CONCAT(S.St_Fname,' ',S.St_Lname)) OVER(ORDER BY sc.GRADE)
FROM dbo.Student S 
INNER JOIN dbo.Stud_Course sc 
ON S.St_Id = sc.St_Id
INNER JOIN dbo.Course c 
ON c.Crs_Id =sc.Crs_Id


