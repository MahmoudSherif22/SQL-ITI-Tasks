use Company_SD;

select * 
from dbo.Departments

select*
from dbo.Project

select p.Dnum ,Dname ,Pnumber
from dbo.Departments d ,dbo.Project p
where d.Dnum = p.Dnum;
---------------------------------
select Dname ,p.Pname
from dbo.Departments d ,dbo.Project p
where d.Dnum = p.Dnum;

---------------------------------
select e.fname,Dependent_name
from dbo.Dependent d ,dbo.Employee e
where d.ESSN = e.SSN

---------------------------------
select *
from dbo.Project
where pname Like 'a%' ;

--------------------------------
select * 
from dbo.Departments d,dbo.Employee e 
where e.Salary > 1000 and e.Salary < 2000;

--------------------------------
select * 
from dbo.Employee e inner join dbo.Works_for w
on e.SSN = w.ESSn
inner join dbo.Project p
on w.Pno = p.Pnumber 
where w.Hours >= 10 and p.Pname = 'AL Rabwah' and e.Dno =10 ; 

--------------------------------------
-- Self join
select e1.Fname 
from Employee e1 inner join Employee e2 
on e2.ssn = e1.Superssn
where e2.fname ='Kamel' and e2.Lname = 'mohamed'
----------------------------------------
-- self join 
select * from 
Employee
select e1.fname as student_name , e2.fname as instructor_name
from employee e1 , employee e2 
where e2.ssn = e1.superssn

----------------------------------------
select fname,lname,Pname
from Employee e inner join Works_for w
on e.SSN = w.ESSn
inner join Project p
on p.Pnumber = w.Pno
order by Pname

------------------------------------
select pnumber,pname ,e.Lname
from Project p inner join Departments d
on p.Dnum = d.Dnum
inner join Employee e
on d.MGRSSN = e.SSN
-------------------------------
select e.*
from Employee e inner join Departments d
on e.SSN = d.MGRSSN

-------------------------------------
select *
from Employee e left outer join Dependent d
on e.SSN = d.ESSN

------------------------------------
select * 
from Employee
insert into Employee (Fname,Lname,SSN) values('Mahmoud','Sherif',112);

--------------------------------------