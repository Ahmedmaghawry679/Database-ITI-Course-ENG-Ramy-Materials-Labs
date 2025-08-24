select * from Departments
select * from Employee
select * from project
select * from Works_for

select Dnum, Dname, SSN as MGR_SSN, Fname as MGR_Fname
from Departments D, Employee E -- Cross Join (Cartesian Product)

select Dnum, Dname, SSN as MGR_SSN, Fname as MGR_Fname
from Departments D, Employee E
where D.MGRSSN = E.SSN         -- Inner Join (Equi Join)

select Dname , Pname 
from Departments D inner join Project P 
on D.Dnum = P.Dnum

select E.Fname, D.*
from Employee E inner join Dependent D
on E.SSN = D.ESSN

select p.* 
from Project p
where p.City = 'Cairo' or p.City = 'Alex'

select p.* 
from Project p
where p.Pname like 'a%' -- Note It's Not Case Sensitive a = A

select E.*
from Employee E
where E.Dno = 30 and E.Salary Between 1000 And 2000

select E.Fname
from Employee E , Project P, Works_For W
where E.SSN = W.ESSn
and P.Pnumber = W.Pno
and P.Pname = 'Al Rabwah'
and W.Hours >= 10
and E.Dno = 10

Select E.Fname
from Employee E, Employee M
where E.superssn = M.SSN and M.Fname = 'Kamel' -- Self Join

select E.Fname, P.Pname 
from Employee E, Project P, Works_for W
where E.SSN = W.ESSn
and W.Pno = P.Pnumber
order by P.Pname

select P.Pnumber, D.Dname, E.Lname , E.Address, E.Bdate
from Project P, Departments D, Employee E
where P.Dnum = D.Dnum
and D.MGRSSN = E.SSN
and P.City = 'Cairo'

select distinct M.*
from Employee M , Departments D, Employee E
where D.MGRSSN = M.SSN
or E.Superssn = M.SSN


select E.* , D.*
from Employee E left join Dependent D
on E.SSN = D.ESSN

insert into Employee Values ('Ahmed', 'Maghawry', 102672,1-8-2005, 'Salam City Cairo', 'M' , 3000, 112233,30)
insert into Employee Values ('Hassan', 'Mohamed', 102660,9-13-2004, 'Salam City Cairo', 'M' , NULL, NULL,30)

update Employee 
set salary = salary*1.2
where SSN = 102672




