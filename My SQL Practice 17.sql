use employee;

CREATE TABLE ProjectDetail (
    projectID INT PRIMARY KEY,
    empID Int ,
    Projectname varchar(40));
    
    INSERT INTO ProjectDetail (projectID,EmpID, projectname)
 value 
 (1,1,'Task Track');
 
 INSERT INTO ProjectDetail (projectID,EmpID, projectname)
 value 
 (3,1,'Survey Management');
 
 INSERT INTO ProjectDetail (projectID,EmpID, projectname)
 value 
 (4,1,'HR Management');
 
 INSERT INTO ProjectDetail (projectID,EmpID, projectname)
 value 
 (6,3,'GRS'),
 (7,3,'DDS');
 
 INSERT INTO ProjectDetail (projectID,EmpID, projectname)
 value 
 (8,4,'HR Management'),
 (9,6,'GL Management');
 
 select * from projectdetail;
 
 delete from projectdetail
 where projectID = 3;
 
 -- Write a query to find the project name of all the employee.
 select e.firstname,e.lastname,e.empid,p.projectid,p.projectname from employeedetails as e
  inner join projectdetail as p on
  e.empid=p.empid;
 
 -- Write a query to fetch employee name , employee ID, project ID
  select firstname,lastname,empid from employeedetails 
  inner join projectdetail on
  (employeedetails.empid = projectdetail.empid);
  

  -- Write a query to find the name of a employee, projectTask who works in IT department
  select * from employeedetails as e
  inner join projectdetail as p on e.empid = p.empid
  where e.depart='IT';
  
 --  Write a query to find the employee id, name  along with their project_id and project name.
   select e.firstname,e.lastname,e.empid, p.projectname ,p.projectID
   from employeedetails as e
  inner join projectdetail as p on e.empid = p.empid;
  
 -- Write a query to find what project is assigned to nikita;
 select e.firstname,e.lastname,p.projectid,p.projectname from projectdetail as p
  inner join employeedetails as e on e.empid = p.empid
  where firstname='nikita';
  
 -- Write a query to find in which department the male works
 select e.firstname,e.lastname,p.projectname,e.depart,e.gender from projectdetail as p
  left join employeedetails as e on e.empid = p.empid
  where gender='male';
 
 -- write a query to find all employees who are working on 'task track' project
 select * from employeedetails as e
  left join projectdetail as p on e.empid = p.empid
  where projectname='task track';
 
 -- Write a query to display the department empID and name and project name.
 select e.firstname,e.lastname,e.depart,p.projectname from employeedetails as e
  left join projectdetail as p on e.empid = p.empid;
  

 -- Write a query to display the department and average salary of employees.
 
 select depart, avg(salary) from employeedetails
 group by depart;
 
 -- Write a query to display department, employee name, and and salary for the job.
 select e.firstname,e.lastname,e.salary, e.depart,p.projectname from employeedetails as e
  left join projectdetail as p on e.empid = p.empid
  order by salary desc limit 4;

-- write to mysql query to find employee working on more than one project 
SELECT employeedetails.*
FROM employeedetails
cross JOIN projectdetail ON employeedetails.empID = projectdetail.empID
GROUP BY employeedetails.empID
HAVING COUNT(projectdetail.projectid) > 1;