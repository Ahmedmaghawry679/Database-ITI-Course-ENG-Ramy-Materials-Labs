use iti

go
create procedure StperDep
as
	Select Dept_Id, Count(St_Id) as NumOfStudents
	from Student
	group by Dept_Id

go 
StperDep



use SD
select * from Works_On

go
create procedure CheckP1
as
	if((select count(EmpNo) from Works_On where ProjectNo = 1)>=3)
		select 'The # Of Employees In Project P1 Is 3 or more'
	else 
		begin
		select 'The Following Employees Work For The Project P1'
		select E.*
		From Emp E inner join Works_On W
		on E.Enum = W.EmpNo
		where W.ProjectNo = 1
		end
	


go
CheckP1

go
create proc updateWork @oldEmp int , @newEmp int, @projNum int
as
	update Works_On 
	set EmpNo = @newEmp
	where EmpNo = @oldEmp and ProjectNo = @projNum

go
updateWork 2581,555, 3


select * from Company.Project


create table BudgetTracker
(
	projectNO int,
	username varchar(20),
	ModificationDate Date,
	OldBudget int,
	NewBudget int
)

go
alter trigger Company.BudgetTrig on Company.project
with encryption
after update as
	if(update(budget))
	begin
	declare @projnum int = (select Pnum from inserted)
	declare @oldbudg int = (select Budget from deleted)
	declare @newbudg int = (select Budget from inserted)

		insert into BudgetTracker 
		values(@projnum, SUSER_NAME(), GETDATE(), @oldbudg, @newbudg)
	end

alter table BudgetTracker
alter column username varchar(50)

go
update Company.Project 
set Budget = 500000
where pnum = 1

go
update Company.Project 
set Budget = 520000
where pnum = 2

select * from BudgetTracker

use iti

go
create trigger notallowed on Department
instead of insert 
as
	select 'Not Allowed To Insert New record On That Table'

insert into Department(Dept_id)
values(520)


drop trigger notallowed