use Company_SD;
select * from dbo.Employee;

---------------------------------
select dbo.Employee.Fname, dbo.Employee.Lname, dbo.Employee.Salary ,
 dbo.Employee.Dno from dbo.Employee

------------------------------------
select Pname ,Plocation,Dnum from dbo.Project;

------------------------------------
select * from dbo.Employee;
select Salary + 0.1*Salary as 'ANNUAL COMM' from dbo.Employee;

-------------------------
select SSN from dbo.Employee
where Salary > 1000;

---------------------------
select SSN from dbo.Employee
where Salary*12 > 1000;

----------------------------
select Fname,Lname,Salary from dbo.Employee
where Sex = 'F';

-----------------------------
select Dname,Dnum from dbo.Departments
where MGRSSN = 968574;
-----------------------------
select * from dbo.Project;
select Pnumber,Pname from dbo.Project
where Dnum = 10;