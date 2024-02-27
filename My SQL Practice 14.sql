use ProductOrders;

-- Show the departments with the highest average employee salary.
select Dpart,avg(salary) as avgsalary 
from employeesdetail
group by Dpart
order by avgsalary desc limit 1;

-- Retrieve employees who were hired in the same year and month as 'John Smith'.
select * from employeesdetail
where year(hiredate)=(select hiredate from employeesdetail where firstname='John' and lastname ='Smith') 
and month(hiredate)=(select hiredate from employeesdetail where firstname='John' and lastname ='Smith');

-- Find the top 5 highest-earning departments along with the total salary expense for each department.
select Dpart,sum(salary) as totalsalary 
from employeesdetail
group by Dpart
order by totalsalary desc limit 5;

-- Retrieve the employees who have been assigned to multiple departments.
select Firstname,lastname,dpart 
from employeesdetail
where empid in (select empid from employeesdetail
group by empid
having count(distinct dpart)>1);

-- Show the cumulative total amount of orders for each customer in ascending order of the order date.
select orderID, orderdate, totalamount,
sum(totalamount) over (partition by customerID order by orderdate) as cumulativetotalamount
from orderdetails;

-- Show the employees who have not been assigned to any department but have a higher salary than the average salary of all employees.
select * from employeesdetail
where dpart is null
and salary > (select avg(salary) from employeesdetail);

-- Retrieve the top 5 customers with the highest average order amount.
select AVG(O.TotalAmount) AS AverageOrderAmount
from customerdetails as C
inner join orderdetails as O on 
O.customerID = C.customerID
GROUP BY C.CustomerID, C.FirstName, C.LastName;

-- Retrieve the orders with the top 5 highest total amount that have not been shipped yet.
select * from orderdetails
where isshipped=0
order by totalamount desc limit 5;

-- Find the customers who have placed orders with consecutive order IDs.
select * from customerdetails as C
where exists(select * from orderdetails as O1
where C.CustomerID = O1.CustomerID
and exists(select * from orderdetails as O2
where O1.CustomerID = O2.CustomerID AND O1.OrderID = O2.OrderID -1));

-- Return all customers lastname starting with any character, followed by "nson": 
select * from customerdetails
where lastname like "___nson";