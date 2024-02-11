use mysqlpractice;

-- Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(*) from Worker
where DEPARTMENT='Admin';

-- Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select concat(FIRST_NAME,LAST_NAME) as wokername,Salary
from Worker
where WORKER_ID in
(select WORKER_ID from Worker
where Salary between 50000 and 100000);

-- Write an SQL query to fetch the number of workers for each department in descending order.
select DEPARTMENT, count(WORKER_ID) No_of_worker
from  Worker
group by DEPARTMENT
order by No_of_worker desc ;

-- Write an SQL query to print details of the Workers who are also Managers.
select distinct W.FIRST_NAME,T.WORKER_TITLE 
FROM Worker W
inner join Title T
on W.WORKER_ID=T.WORKER_REF_ID
AND T.WORKER_TITLE IN ('Manager');

-- Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select WORKER_TITLE,
count(*)
FROM Title
group by WORKER_TITLE
having count(*)>1;

-- Write an SQL query to show only odd rows from a table.
select * from Worker 
where mod (WORKER_ID,2) <> 0;

-- Write an SQL query to show only even rows from a table
select * from Worker 
where mod(WORKER_ID,2) = 0;

-- Write an SQL query to clone a new table from another table
create table WorkerClone like Worker;

-- Write an SQL query to fetch intersecting records of two tables.
(select * from Worker)
INTERSECT
(select * from WorkerClone); 

-- Write an SQL query to show the current date and time.
select now(); 

