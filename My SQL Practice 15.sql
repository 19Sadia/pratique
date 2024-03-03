create database Employee;
use Employee;

create table employeedetails(
EmpID INT PRIMARY KEY,
firstname varchar(40),
lastname varchar(40),
salary varchar(60),
joiningdate date,
depart varchar(26),
gender varchar(28));

INSERT INTO employeedetails (EmpID,firstname,lastname,salary,joiningdate,depart,gender)
value 
(4,'Vikas','Ahlawat',600000,'2013-02-15','IT','Male');

INSERT INTO employeedetails (EmpID,firstname,lastname,salary,joiningdate,depart,gender)
value 
(4,'Vikas','Ahlawat',600000,'2013-02-15','IT','Male');

delete from employeedetails
where empid=4;
select * from employeedetails;

INSERT INTO employeedetails (EmpID,firstname,lastname,salary,joiningdate,depart,gender)
value
(2,'Nikita','Jain',530000,'2014-01-17','HR','Female');
INSERT INTO employeedetails (EmpID,firstname,lastname,salary,joiningdate,depart,gender)
value
(3,'Ashish','Kumar',1000000,'2014-01-09','IT','Male');

INSERT INTO employeedetails (EmpID,firstname,lastname,salary,joiningdate,depart,gender)
value
(4,'Nikhil','Sharma',480000,'2014-01-09','HR','Male');

INSERT INTO employeedetails (EmpID,firstname,lastname,salary,joiningdate,depart,gender)
value
(5,'Anish','Kadian',500000,'2014-01-09','Payroll','Male');

select * from employeedetails;

delete from employeedetails
where empid=5;
select * from employeedetails;

-- Write a query to get FirstName in upper case as "First Name
select upper(firstname) as FisrtName
from employeedetails;

-- Write a query to get FirstName in lower case as "First Name". 
select lower(firstname) as FisrtName
from employeedetails;

-- Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name) 
select concat(firstname,' ',lastname) as fullname
from employeedetails;

-- Select employee detail whose name is "Vikas"
select * from employeedetails
where firstname='vikas';

-- Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'. 
 select * from employeedetails
 where firstname like 'a%';
 
 -- Get all employee details from EmployeeDetail table whose "FirstName" contains 'k' 
 select * from employeedetails
 where firstname like '%k%';
 
 -- Get all employee details from EmployeeDetail table whose "FirstName" end with 'h' 
 select * from employeedetails
 where firstname like '%h';
 
 -- Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p' 
  select * from employeedetails
 where firstname like '[a-p]%';
 
 -- Write a query where salary range between 500000 to 600000
 select * from employeedetails
 where salary between 500000 and 600000;

--  Write a query to print maximum of salary 
select max(salary) as maximumsalary
from employeedetails;

