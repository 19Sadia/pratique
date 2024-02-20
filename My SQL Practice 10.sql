use mysqlpractice1;

-- Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.
select empid from employeedetail
union
select empid from employeesalary;

--  Write an SQL query to fetch the EmpIds that are present in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary.
select empid from employeedetail
where empid in (select empid from employeesalary);

-- Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.
 select empid from employeedetail
where empid not in (select empid from employeesalary);

--  Write an SQL query to fetch the position of a given character(s) in a field.
select instr(fullname,"Sadiya")
from employeedetail;

-- Write an SQL query to uppercase the name of the employee and lowercase the city values. 
select upper(fullname), lower(city) from employeedetail;

-- Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field.
select fullname,length(fullname) - length(REPLACE(fullname,'y',''))
from employeedetail;

-- Write an SQL query to update the employee names by removing leading and trailing spaces.
update employeedetail
set fullname=ltrim(rtrim(fullname));

-- Fetch all the employees who are not working on any project.
select empid from employeesalary
where project is null;

-- Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.
select fullname from employeedetail 
where empid in (select empid from employeesalary
where salary between 5000 and 10000);

-- Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table.
select * from employeedetail d
where exists
(select * from employeesalary s
where d.empid=s.empid);