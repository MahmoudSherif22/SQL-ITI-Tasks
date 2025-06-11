
--------------------------------------------------------------------
--1 
-- Department table
CREATE TABLE Department(
DeptNo varchar(10) Primary key,
DeptName varchar(20),
Location varchar(10)
)

CREATE RULE r3 AS @x in ('NY','DS','KW');
sp_bindrule 'r3' , 'Department.Location'


INSERT INTO Department(DeptNo,DeptName,Location) VALUES('d1','Research','NY');
INSERT INTO Department(DeptNo,DeptName,Location) VALUES('d2','Accounting','DS');
INSERT INTO Department(DeptNo,DeptName,Location) VALUES('d3','Marketing','KW');

----- Employee Table

CREATE TABLE Employee(
    EmpNo int ,
    EmpFname varchar(50) NOT NULL,
    EmpLname varchar(50) NOT NULL,
    DeptNo varchar(10),
    Salary int,
    CONSTRAINT c1 PRIMARY KEY(EmpNo),
    CONSTRAINT c2 FOREIGN KEY(DeptNo) 
    REFERENCES Department(DeptNo),
    CONSTRAINT c3 UNIQUE(Salary)
)

CREATE RULE r11 AS 
    @x <6000;
sp_bindrule 'r11','Employee.Salary';

INSERT INTO Employee(EmpNo,EmpFname,EmpLname,DeptNo,Salary)
VALUES(25348,'Mathew','Smith','d3',2500);

INSERT INTO Employee(EmpNo,EmpFname,EmpLname,DeptNo,Salary)
VALUES(10102,'Ann','Jones','d3',3000);

INSERT INTO Employee(EmpNo,EmpFname,EmpLname,DeptNo,Salary)
VALUES(18316,'John','Barrimore','d1',2400);


INSERT INTO Employee(EmpNo,EmpFname,EmpLname,DeptNo,Salary)
VALUES(29346,'James','James','d2',2800);


INSERT INTO Employee(EmpNo,EmpFname,EmpLname,DeptNo,Salary)
VALUES(9031,'Lisa','Bertoni','d2',4000);


INSERT INTO Employee(EmpNo,EmpFname,EmpLname,DeptNo,Salary)
VALUES(2581,'Elisa','Hansel','d2',3600);

INSERT INTO Employee(EmpNo,EmpFname,EmpLname,DeptNo,Salary)
VALUES(28559,'Sybl','Moser','d1',2900);

select * from Employee;

----Project Table 


INSERT INTO Project(ProjectNo,ProjectName,Budget)
VALUES('P1','Apollo',120000);

INSERT INTO Project(ProjectNo,ProjectName,Budget)
VALUES('P2','Gemeni',95000);

INSERT INTO Project(ProjectNo,ProjectName,Budget)
VALUES('P3','Mercury',185600);

------Works_on table

INSERT INTO Works_on(ProjectNo,EmpNo,job,Enter_Date)
VALUES('P1',2581,'Engineer','')

INSERT INTO Works_on(ProjectNo,EmpNo,job,Enter_Date)
VALUES('P1',10102,'Engineer','')

-- in this queruy error as id 11111 no exist in emppoyee which references of f_k
insert into work_on values(11111,1,'analyst','')
--no row updated because there is no emp_no 11111 in empolyee table
--zero row afeccted
update work_on set emp_no = 11111 where  emp_no = 10102

----no row updated because there is no emp_no 11111 in empolyee table
--zero row afeccted 


-----Table Modification
ALTER TABLE Employee
ADD telephoneNumber int;

ALTER TABLE Employee
DROP COLUMN telephoneNumber;

---------------------------------------------------
--2 
CREATE SCHEMA Company;
ALTER SCHEMA Company TRANSFER dbo.DEPARTMENT;
CREATE SCHEMA HR;
ALTER SCHEMA HR TRANSFER dbo.Employee;


-- Moving data from table to another 
INSERT INTO Company.Project2
SELECT *
FROM dbo.Project;

--------------------
--3 
SELECT CONSTRAINT_NAME,CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME ='Employee'
--4 
CREATE SYNONYM Emp
FOR HR.Employee

Select * from Employee
Select * from HR.Employee
SELECT * FROM Emp
SELECT * FROM HR.Emp
----------------------------------
--5
UPDATE dbo.Project
SET Budget = Budget+(0.1*Budget)
WHERE ProjectNo = (SELECT TOP(1) ProjectNo
                   FROM Works_on
				   WHERE job = 'Engineer')

SELECT* FROM Works_on;
SELECT*FROM Project;
-------------------------------------
--6 
SELECT * 
FROM HR.Employee;
SELECT *
FROM Company.Department;

UPDATE Company.Department
SET DeptName = 'Sales'
WHERE DeptNo = (SELECT DeptNo
                FROM HR.Employee
				WHERE EmpFname = 'James')
----------------------------------------
--7 

SELECT *
FROM Works_on;
SELECT *
FROM HR.Employee
SELECT * 
FROM Company.Department;
UPDATE Works_on
SET Enter_Date = '12.12.2007'
WHERE ProjectNo = 'P1' AND EmpNo = (SELECT TOP(1) EmpNo
                                    FROM HR.Employee Emp INNER JOIN
									Company.Department Dep
									ON Emp.DeptNo = Dep.DeptNo
									WHERE DeptName = 'Sales'
--------------------------------------------------
--8
SELECT *
FROM HR.Employee;
SELECT * 
FROM Company.Department;
SELECT *
FROM Works_on;

DELETE 
FROM Works_on
WHERE EmpNo = (SELECT TOP(1) EmpNo
               FROM HR.Employee Emp INNER JOIN
			   Company.Department Dep
			   ON Emp.DeptNo = Dep.DeptNo
			   WHERE Location = 'KW')
-----------------------------------------------