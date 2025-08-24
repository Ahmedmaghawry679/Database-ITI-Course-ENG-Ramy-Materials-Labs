select * from dependent 
select top 3 * from project
select top 3 * from Works_for

select D.Dependent_name , D.Sex, E.Fname 
from Dependent D Inner Join Employee E
on D.ESSN = E.SSN
where D.Sex = 'M' and E.Sex = 'M'
Union All
select D.Dependent_name , D.Sex, E.Fname 
from Dependent D Inner Join Employee E
on D.ESSN = E.SSN
where D.Sex = 'F' and E.Sex = 'F'


select Dependent_name , Sex 
from Dependent
group by Sex, Dependent_name 

select E.Fname, W.Pno, W.Hours
from Employee E Inner Join Works_for W
on E.SSN = W.ESSn

select * from employee
select * from Departments

select count(E.Dno) as NumOfEmployeesPerDept, E.Dno , D.*
from Employee E inner join Departments D
on E.Dno = D.Dnum
where Dno is not null
group by E.Dno, D.Dname, D.Dnum,D.MGRSSN, D.[MGRStart Date]


select D.*
from Departments D
join Employee E on D.Dnum = E.Dno
where E.SSN = (select min(SSN) from Employee) -- Chat GPT

select D.Dname,D.Dnum,min(E.Salary) as min_salary, max(E.Salary) as max_salary, avg(E.Salary) as avg_salary 
from Departments D Inner Join Employee E
on D.Dnum = E.Dno
group by D.Dnum, D.Dname

select E.Lname
from Employee E inner join Departments D
on E.SSN = D.MGRSSN
where E.SSN not in (select ESSN from Dependent)

insert into Departments
values('DP4', 40, 102672, 08-15-2022)


select D.Dname,D.Dnum,Count(E.SSN) as numofemps,avg(E.Salary) as avg_salary 
from Departments D Inner Join Employee E
on D.Dnum = E.Dno
group by D.Dnum, D.Dname
having avg(E.Salary) < (select avg(salary) from Employee)

select E.* , W.Pno 
from employee E inner join Works_for W
on E.SSN = W.ESSn
where E.Dno is not null and E.Fname is not null and E.lname is not null
order by E.Dno, E.Fname, E.Lname

select E.fname+' '+ E.lname as full_name
from employee E
where exists (select 1 from Dependent D where E.fname + ' ' + E.lname like '%' + D.Dependent_name + '%')


Select E.Fname , E.Salary, W.Pno, P.Pname
from Employee E inner join Works_for W
on E.SSN = W.ESSN
inner join Project P
on W.Pno = P.Pnumber
where p.Pname = 'Al Rabwah'

update employee set salary = salary * 1.3
from Employee E inner join Works_for W
on E.SSN = W.ESSN
inner join Project P
on W.Pno = P.Pnumber
where p.Pname = 'Al Rabwah'


SELECT E.Fname, E.Lname
FROM Employee E
WHERE EXISTS (
    SELECT 1
    FROM Dependent D
    WHERE D.Essn = E.SSN
);

select * from Departments

insert into Departments
values('Dept IT', 100, 112233, 11-01-2006)

update Departments set MGRSSN = 968574
where Dnum = 100

update Departments set MGRSSN = 102672
where Dnum = 20

select * from employee where ssn = 102660 

update employee set dno = 20
where ssn = 102660 

delete Dependent where Essn = 223344
delete Works_for where Essn = 223344
update Departments set MGRSSN = 102672 where MGRSSN = 223344
update Employee set Superssn = null where Superssn = 223344
delete employee where SSN = 223344