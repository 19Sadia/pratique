use employee;

-- Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already.
select e.firstname,p.projectname from employeedetails as e
  inner join projectdetail as p on
  e.empid=p.empid
  order by firstname;
  
  --  Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project.
  select e.firstname,p.projectname from employeedetails as e
  left join projectdetail as p on
  e.empid=p.empid
  order by firstname;
  
  -- Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned".
  select e.firstname,isnull(p.projectname) from employeedetails as e
  left join projectdetail as p on
  e.empid=p.empid
  order by firstname;

-- Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail".
select e.firstname,p.projectname from employeedetails as e
right join projectdetail as p on
  e.empid=p.empid
  order by firstname;
  
-- Get complete record(employeename, project name) from both tables([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL.
select e.firstname,p.projectname from employeedetails as e
left join projectdetail as p on e.empid=p.empid
union
select e.firstname,p.projectname from employeedetails as e
right join projectdetail as p on e.empid=p.empid
order by firstname;

-- Write a query to find out the employeename who has not assigned any project, and display "-No Project Assigned"( tables :- [EmployeeDetail],[ProjectDetail]).
select e.firstname,isnull(p.projectname) from employeedetails as e
  left join projectdetail as p on
  e.empid=p.empid
where projectname is null;

-- Write a query to find out the project name which is not assigned to any employee( tables :- [EmployeeDetail],[ProjectDetail]).
select e.firstname,p.projectname from employeedetails as e
right join projectdetail as p on
e.empid=p.empid
where firstname is null;

-- Write down the query to fetch EmployeeName & Project who has assign more than one project.
select e.firstname,p.projectname from employeedetails as e
right join projectdetail as p on e.empid=p.empid
where e.empid in (select empid from projectdetail
group by empid
having count(*)>1);

-- Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName.
select p.projectname, e.firstname from projectdetail as p inner join employeedetails as e 
on p.empid=e.empid
where p.projectname in(select projectname from projectdetail group by projectname having count(*)>1);

