select * 
from Dependent
select * 
from Employee
----------------------------------

SELECT Dependent_name,d.Sex
FROM Dependent d INNER JOIN Employee e
ON e.SSN = d.ESSN
WHERE d.Sex = 'F' AND e.Sex = 'F'

UNION ALL

SELECT Dependent_name,d.Sex
FROM Dependent d INNER JOIN Employee e
ON e.SSN = d.ESSN
WHERE d.Sex = 'M' AND e.Sex = 'M';

----------------------------------------------
SELECT * 
FROM Project
SELECT * 
FROM Works_for

SELECT pname,SUM(hours) as Total_hours
FROM project P  INNER JOIN Works_for W
ON P.Pnumber = W.Pno
GROUP BY Pname;

----------------------------------
SELECT * 
FROM Departments D
WHERE D.Dnum IN (SELECT E.Dno
                FROM Employee E
				WHERE E.SSN = ( SELECT MIN(ssn) 
				                FROM Employee E ))
-----------------------------------

SELECT D.Dname , MAX(E.SALARY) Max , MIN(E.SALARY) Min
FROM Departments D INNER JOIN Employee E
ON D.Dnum = E.Dno
GROUP BY D.Dname ;

-----------------------------------
SELECT *
FROM Employee E  

SELECT *--e.Lname 
FROM Employee e RIGHT OUTER JOIN Dependent D
ON E.SSN =D.ESSN 
WHERE E.Superssn IS NOT NULL AND D.ESSN IS NULL  ;

-----------------------------------
SELECT D.Dname,D.Dnum , COUNT(e.ssn) as numofemployees
FROM Employee E INNER JOIN Departments D 
ON E.Dno = D.Dnum
GROUP BY D.Dname ,D.Dnum
HAVING AVG(E.Salary) < (SELECT avg(salary)
                        from Employee)
---------------------------------------
SELECT E.Fname ,E.Lname ,P.Pname
FROM Employee E INNER JOIN Departments D 
ON E.Dno = D.Dnum
INNER JOIN Project P 
ON D.Dnum = P.Dnum
ORDER BY D.Dname , E.Fname , E.Lname ;

-----------------------------------------
-- 8 

SELECT * FROM Employee

SELECT TOP 2 salary
FROM Employee 
WHERE salary <= (SELECT MAX(Salary)
                FROM Employee)
ORDER BY SALARY DESC
---------------------------------------
SELECT Distinct E.Fname +' '+E.Lname FullName
FROM Employee E INNER JOIN 
Dependent D 
ON E.SSN = D.ESSN
WHERE D.Dependent_name LIKE '%'+ e.Fname+' '+e.Lname +'%'
--------------------------------------
SELECT E.Fname ,E.SSN
FROM Employee E
WHERE EXISTS (SELECT D.Dependent_name
              FROM Dependent D
			  WHERE E.SSN =D.ESSN)
-------------------------------------
INSERT INTO Departments(Dname,Dnum,MGRSSN,[MGRStart Date]) 
VALUES('DEPT IT',100,112233,'1-11-2006');
-------------------------------------
UPDATE Departments 
SET MGRSSN = 968574
WHERE Departments.Dnum = 100;
----------------------------------------------
UPDATE Departments 
SET MGRSSN = 112
WHERE Departments.Dnum = 20;
------------------------------------------
UPDATE Employee 
SET Superssn = 112
WHERE Employee.SSN = 102660 ;

-----------------------------
UPDATE Employee 
SET Superssn = 112
WHERE Employee.Superssn = 223344 ;

UPDATE Departments 
SET MGRSSN = 112
WHERE Departments.MGRSSN = 223344;

UPDATE Works_for 
SET ESSn = 112
WHERE Works_for.ESSn = 223344;

DELETE FROM Employee
WHERE Employee.SSN = 223344
------------------------
