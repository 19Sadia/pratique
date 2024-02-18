use mysqlpractice;

-- Write an SQL query to show the last record from a table.
select * from worker
where Worker_id = (select max(Worker_ID) from Worker);

-- Write an SQL query to fetch the first row of a table.
select * from worker
where Worker_id = (select min(Worker_ID) from Worker);

-- Write an SQL query to fetch the last five records from a table.
select * from (select* from Worker W order by W.Worker_ID desc) as W1
where W1.Worker_ID<=5;

-- Write an SQL query to print the names of employees having the highest salary in each department.
select 	t.FIRST_NAME,t.DEPARTMENT,t.Salary
from (select max(Salary)as TotalSalary,DEPARTMENT from Worker 
group by DEPARTMENT)as NewINFO
inner join Worker t on
NewINFO.DEPARTMENT=t.DEPARTMENT
And NewINFO.TotalSalary=t.Salary;
-- Write an SQL query to fetch three max salaries from a table.
select * from worker
order by Salary desc limit 3;

select distinct Salary from Worker a
where 3>=(select count(distinct Salary) from Worker b
where a.Salary <= b.Salary)
order by a.Salary desc;

-- Write an SQL query to fetch three min salaries from a table.
select distinct Salary from Worker a
where 3>=(select count(distinct Salary) from Worker b
where a.Salary >= b.Salary)
order by a.Salary desc;

--  Write an SQL query to fetch nth max salaries from a table.
select max(Salary) from Worker;

-- Write an SQL query to fetch departments along with the total salaries paid for each of them.
select DEPARTMENT,sum(Salary)
from Worker
group by DEPARTMENT;

-- Write an SQL query to fetch the names of workers who earn the highest salary.
select FIRST_NAME, Salary from Worker
where Salary=(select max(Salary) from Worker);
    