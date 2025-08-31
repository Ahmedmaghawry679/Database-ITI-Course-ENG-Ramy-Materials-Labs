ALTER AUTHORIZATION ON DATABASE::AdventureWorksDW2012 TO sa; -- To Change The DB Owner To sa


select count(st_age) from Student -- don't count nulls
select * from student where st_age is null
update student set st_age = 25 where st_age is null

select  distinct I.Ins_Name
from Instructor I

select * from Instructor
insert into Instructor
values(16, 'Amr', 'Master', null,40)

select * from Student

Select S.st_id, isnull(S.st_Fname, 'Ahmed')+' '+isnull(S.st_Lname, 'Maghawry') as Full_Name, D.Dept_Name
from Student S inner join Department D
on S.Dept_Id = D.Dept_Id


select * from instructor 
update Instructor set Dept_Id = null 
where Ins_Name = 'Amr'

select I.*, D.Dept_Name
from Instructor I left join Department D
on I.Dept_Id = D.Dept_Id

select * from Stud_Course

select S.st_fname + ' ' + S.st_lname as FullName, C.crs_id, C.grade
from Student S Inner join Stud_Course C
on S.St_Id = C.St_Id
where grade is not null

select * from topic

select T.top_name, Count(C.Crs_Id) as NumOfCourses
from Topic T inner join Course C
on T.Top_Id = C.Top_Id
group by T.Top_Name

select * from Instructor

select avg(Salary) 
from Instructor

select * 
from Instructor
where Salary < (select avg(Salary) from Instructor)

select I.* , D.Dept_Name
from Instructor I inner join Department D
on I.Dept_Id = D.Dept_Id
where Salary = (select min(Salary) from Instructor)



select *  from (
	select * , ROW_NUMBER() over (order by salary desc) as RN
	from Instructor
	) as newtable
where RN in(1,2)

select *  from (
	select * , Dense_Rank() over (order by salary desc) as DR
	from Instructor
	) as newtable
where DR in(1,2)

select * from instructor 

select coalesce(salary, 200) from instructor 

select avg(salary) from Instructor

select S.St_Fname , V.*
from student S inner join Student V
on S.St_super = V.St_Id

select * from (
	select * , ROW_NUMBER() over (Partition by Dept_id order by salary desc) as RN
	from instructor 
	) as newtable
where dept_id is not null and RN in (1,2)




select * from (
	select * , ROW_NUMBER() over (Partition by Dept_id order by newid()) as RN
	from student 
	) as newtable
where RN = 1





