use iti 

-- create a saclar function 
go
create function getMonth(@date date)
returns varchar(20)
	begin
		return month(@date)
	end 

go
select dbo.getMonth('08-13-2024')


-- Create Multi Statement table valued function 
go
create function getBetween(@x1 int, @x2 int)
returns @t table 
	(
		nums int primary key
	)
as
begin
	if(@x1 > @x2) 
		while (@x2 < @x1)
		begin
			set @x2 = @x2 + 1
			insert into @t values (@x2)
		end
	else 
		while (@x2 > @x1)
		begin
			set @x1 = @x1 + 1
			insert into @t values (@x1)
		end
	return
end

go
select * from dbo.getBetween(10,3)


-- Create Inline Function (Table Valued)
go
create function getStData(@StudentNO int)
returns table 
as
return
(
	select S.st_fname + ' ' + S.st_lname as FullName, D.Dept_Name
	from Student S inner join Department D
	on S.Dept_Id = D.Dept_Id
)

go
create or alter function getStData(@StudentNO int)
returns table 
as
return
(
	select S.st_fname + ' ' + S.st_lname as FullName, D.Dept_Name
	from Student S inner join Department D
	on S.Dept_Id = D.Dept_Id
	where S.St_Id = @StudentNO
)


go
select * from dbo.getStData(2) 


-- Create a Scalar Function 
go
create function getstMessage(@StudentNO int)
returns varchar(30) 
begin
	declare @message varchar(30)
	if ((select st_fname from student where st_id = @StudentNO) = null and (select st_lname from student where st_id = @StudentNO) = null)
		set @message =  'First Name and Last Name are Null'
	else if ((select st_fname from student where st_id = @StudentNO) = null)
		set @message =  'First Name Is Null'
	else if ((select st_lname from student where st_id = @StudentNO) = null)
		set @message =  'Last Name Is Null'
	else
		set @message =  'First Name and Last Name are Not Null'
	return @message 
end

go 
select dbo.getstMessage(1)

go
create or alter function getstMessage(@StudentNO int)
returns varchar(80) 
begin
	declare @message varchar(80)
	if ((select st_fname from student where st_id = @StudentNO) is null and (select st_lname from student where st_id = @StudentNO) is null)
		set @message =  'First Name and Last Name are Null'
	else if ((select st_fname from student where st_id = @StudentNO) is null)
		set @message =  'First Name Is Null'
	else if ((select st_lname from student where st_id = @StudentNO) is null)
		set @message =  'Last Name Is Null'
	else
		set @message =  'First Name and Last Name are Not Null'
	return @message 
end

go 
select dbo.getstMessage(15)

go
create function getmgrgata(@mgrid int)
returns table as
return 
(
	select I.ins_name, D.Dept_name, D.Manager_hiredate
	from Instructor I Inner Join Department D
	on I.Ins_Id = D.Dept_manager
	where D.Dept_Manager = @mgrid
)

go 
select * from dbo.getmgrgata(5)





-- Create Multi Statement table valued function 
go
create or alter function getName(@typeOfName varchar(50))
returns @t table 
	(
		st_name Varchar(50)
	)
as
begin
	declare @st_name varchar(30)
	if(@typeOfName = 'First Name')  
		insert into @t  select st_fname from student
		
	else if(@typeOfName = 'Last Name')  
		insert into @t  select st_lname from student

	else if(@typeOfName = 'Full Name')  
		insert into @t  select st_Fname + ' ' + St_Lname from student
	return
end

go
select * from dbo.getName('fuLL Name')


-- query that returns student first name except last character 
select St_Id, SUBSTRING(St_Fname, 1, len(st_fname)-1) from student 


select * from student 

select * from Stud_Course

Select SC.st_id, SC.Grade, S.Dept_id, D.Dept_name
from Stud_Course SC inner join Student S
on SC.St_Id = S.St_Id
inner join Department D
on S.Dept_Id = D.Dept_id
order by D.Dept_Name

update Stud_Course
set Grade = Null
from Stud_Course SC inner join Student S
on SC.St_Id = S.St_Id
inner join Department D
on S.Dept_Id = D.Dept_id
where D.Dept_Name = 'SD'