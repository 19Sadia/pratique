use ProductOrders;

-- Find customers who have not placed any orders.
select CustomerDetails.* from CustomerDetails
left join OrderDetails 
on CustomerDetails.customerID = OrderDetails.customerID
where OrderDetails.customerID is null;

--  Show the average salary of employees in each department.
select Dpart,
avg(Salary) as averageSalary from employeesdetail
group by Dpart;

-- Find the customers who have not placed any orders in the last 3 months.
select distinct customerdetails.*
from customerdetails
where not exists(
select * from orderdetails
where customerdetails.customerID=orderdetails.customerID
and orderdate >= DATEADD(month,-3,getdate()));

-- Display the employees with their age (in years) calculated from the HireDate 
 select empID,Firstname,Lastname,
 datediff(Year,Hiredate,Getdate()) as Age from employeesdetail;
 
 --  Retrieve orders that were shipped after their expected shipment date.
 select * from orderdetails
 where isshipped=0;
 
 select C.Firstname,C.Lastname
 from customerdetails C
 inner join orderdetails O
 on C.customerID=o.customerID
 where isshipped =0;
 
 -- Find the nth highest salary from the Employees table.
select * from employeesdetail
order by salary desc limit 1;

-- Find customers who have placed orders for consecutive days. 
SELECT DISTINCT customerdetails.* FROM customerdetails
INNER JOIN Orderdetails O1 ON customerdetails.CustomerID = O1.CustomerID
INNER JOIN Orderdetails O2 ON customerdetails.CustomerID = O2.CustomerID
WHERE DATEDIFF(DAY, O1.OrderDate, O2.OrderDate) = 1;

-- Display the names of employees who were hired on the same day as 'John Smith'.
select firstname,lastname from employeesdetail
where hiredate=(select hiredate from employeesdetail where 
firstname ='John' and lastname='smith');

-- Retrieve the list of employees and their managers. 
SELECT E.EmpID, E.FirstName, E.LastName, M.FirstName AS ManagerFirstName, M.LastName AS ManagerLastName
FROM Employeesdetail E
LEFT JOIN Employeesdetail M ON E.ManagerID = M.EmpID;