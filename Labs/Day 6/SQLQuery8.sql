-- Create Default
create default dloc  as 'NY'

-- Create Rule
create rule rloc as @values in ('NY', 'DS', 'KW')

-- Create Data Type
sp_addtype locdb, 'nchar(2)','not null'

-- Bind rule + default to the date type
sp_bindefault dloc, locdb
sp_bindrule rloc, locdb

create table Department
(
	Dnum int  primary key ,
	Dname nvarchar(50),
	Dloc int
)

alter table Department
alter column Dloc locdb

insert into Department
values(1, 'Research', 'XY')

insert into Department(Dnum, Dname)
values(2, 'Accounting')

sp_bindefault dloc, locdb
sp_bindrule rloc, locdb

insert into Department(Dnum, Dname)
values(3, 'Marketing')

select * from Department
update Department set Dloc = 'NY' where Dnum = 1
update Department Set Dloc = 'DS' where Dnum = 2
update Department Set Dloc = 'KW' where Dnum = 3


create table Employee
(
	Enum int primary key,
	Fname nvarchar(20) not null,
	Lname nvarchar(20) not null,
	Dno int foreign key references Department(Dnum),
	Salary int 
)

create rule emprule as @sal<6000

sp_bindrule emprule, 'Employee.Salary'

insert into Employee 
values(25348, 'Mathew', 'Smith', 3, 2500)

insert into Employee values
(10102, 'Ann', 'Jones', 3, 3000),
(18316, 'John', 'Barrimore', 1, 1400),
(29346, 'James', 'James', 2, 2800),
(9031, 'Lisa', 'Bertoni', 2, 4000),
(2581, 'Elisa', 'Hansel', 2, 3600),
(28559, 'Sybl', 'Moser', 1, 2900)

Select * from employee

alter table employee 
add TelephoneNumber int

alter table employee 
drop column TelephoneNumber

create schema Company


alter schema Company transfer dbo.Department
alter schema Company transfer dbo.Project -- I Couldn't do it by wizard 

create schema HumanResources 

alter schema HumanResources transfer dbo.Employee

sp_helpconstraint  'HumanResources.Employee' -- To Get The Constraints on the table Employee 


create synonym Emp for HumanResources.Employee

select * from emp

select * from employee -- Get an error because the default schema is dbo 

select * from HumanResources.Emp -- Invalid object name 

select * from [HumanResources].Employee


select * from Company.Project 

update Company.Project set budget = budget * 1.1
where Company.Project inner join Works_On



