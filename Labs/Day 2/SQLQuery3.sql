select * from Employee

Select Fname, Lname, Salary, Dno from Employee

select * from Project

select Pname, Plocation, Dnum from Project

select Fname , Salary * 0.1 as AnnualCom from Employee

select Fname, SSN from employee where Salary > 1000

select Fname, SSN, Salary from employee where Salary * 12 > 10000

select Fname, Salary from Employee where Sex = 'F'

Select * from Departments

Select Dname, Dnum from Departments where MGRSSN = 968574

Select Pname, Pnumber, Plocation from Project where Dnum = 10