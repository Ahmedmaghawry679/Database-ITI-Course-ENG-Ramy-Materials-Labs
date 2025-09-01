use iti

go
alter view StGrade50 
with encryption
as
	select S.st_fname + ' ' + S.st_lname as FullName, C.crs_name, SC.grade
	from Student S Inner Join Stud_Course SC
	on S.St_Id = SC.St_Id
	Inner Join Course C
	on SC.Crs_Id = C.Crs_Id
	where grade > 50


go
Select * from StGrade50

Select FullName from StGrade50

go
sp_helptext StGrade50

go
create view InsDep
as
	Select I.ins_name, D.Dept_name
	from Instructor I inner join Department D
	on I.Dept_Id = D.Dept_Id
	where D.Dept_Name = 'SD' or D.Dept_Name = 'Java'


go 
Select * from InsDep

go
create view v1 

as 
	Select * from Student 
	where St_Address = 'Cairo' or St_Address = 'Alex'
	with check option


go 
update v1 set St_Address = 'Tanta'
where St_Address = 'Cairo'



use Company_SD

go
create view Employeesperproject
as
	Select P.pname , Count(W.ESSn) as NumOfEmployees
	from Works_for W inner join Project P
	on W.Pno = P.Pnumber
	group by P.Pname

go
Select * from Employeesperproject


use iti

go
create nonclustered index HireDateIndex on Department(manager_hiredate)

select * from Department where month(Manager_hiredate) = '01'


create unique index St_age_index on student(st_age)

insert into Student(St_Id, St_Fname, St_Age)
values(25, 'Ahmed', 22) -- Error Because Duplicate in age 

drop index st_age_index on student 


create table DailyTransaction
(
	id int primary key,
	quantity int 
)

create table LastTransaction
(
	id int primary key,
	quantity int 
)

insert into DailyTransaction values
(1,1000),
(2, 2000),
(3, 1000)

insert into LastTransaction values
(1,4000),
(2, 2000),
(3, 10000)

select * from DailyTransaction
select * from LastTransaction



merge into LastTransaction as T
using DailyTransaction as S
on T.id = S.id
when matched then
update set T.Quantity = S.Quantity
when not matched then
insert Values(S.id, S.Quantity);







