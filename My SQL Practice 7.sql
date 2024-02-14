use mysqlpractice;

-- Write an SQL query to show the top n (say 10) records of a table.
select * from Worker
order by Salary desc limit 10;

-- Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from Worker
order by Salary desc limit 5;
-- Write an SQL query to determine the 5th highest salary without using the TOP or limit method.
select max(Salary) from Worker;
select Salary from Worker W 
where 4 =(select count(distinct(W1.Salary))
from Worker W1
where W1.Salary>=W.Salary);
-- Write an SQL query to fetch the list of employees with the same salary.
select distinct W.Worker_ID,W.FIRST_NAME,W.Salary
from Worker W, Worker W1
where W.Salary=W1.Salary
and W.Worker_ID != W1.Worker_ID;

-- Write an SQL query to show the second-highest salary from a table.
select max(Salary) from Worker
where Salary not in(select max(salary) from Worker);

-- Write an SQL query to show one row twice in the results from a table.
select FIRST_NAME,DEPARTMENT from Worker W 
where W.DEPARTMENT = 'Admin'
union all
select FIRST_NAME,DEPARTMENT from Worker W1 
where W1.DEPARTMENT = 'Admin';

-- Write an SQL query to fetch intersecting records of two tables.
(select * from Worker)
intersect
(select * from WorkerClone);

-- Write an SQL query to fetch the first 50% of records from a table.   
select * from Worker
where Worker_id <=(select count(Worker_ID)/2 from Worker);

-- Write an SQL query to fetch the departments that have less than five people in them.
select DEPARTMENT, COUNT(Worker_ID)
from Worker
group by Department
having count(Worker_ID)<5;

-- Write an SQL query to show all departments along with the number of people in there.  
select DEPARTMENT, count(Worker_ID) as 'Number of Worker'
from Worker
group by DEPARTMENT;
