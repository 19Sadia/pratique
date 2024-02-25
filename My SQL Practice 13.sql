use ProductOrders;

-- Show the customers who have the same first name or last name as employees.
select * from  customerdetails as C
where exists(select * from employeesdetail as E
where C.Firstname=E.Firstname or C.Lastname = E.lastname);

-- Find the orders placed by the customers from the same city as 'John Smith'.
select * from orderdetails as O
inner join customerdetails as C on 
C.customerID=O.customerID
where C.city=(select city from customerdetails where firstname = 'John '
and lastname='Smith');

-- Retrieve customers who have placed orders for more than the average order amount.
select * from customerdetails as C 
inner join orderdetails as O on
C.customerID = O. customerID
where O.totalamount > (select avg(totalamount) from orderdetails);

--  Show the departments along with the number of employees in each department.
select Dpart, count(*) as numberofemployee from employeesdetail
group by dpart;

select dpart,count(dpart) from employeesdetail
group by dpart;

-- Retrieve the latest order for each customer 
select * from orderdetails as O1
left join orderdetails as O2 on O1.customerID = O2.customerID
and O1.customerID > O2.customerID
where O2.customerID is null;

-- Retrieve the customers who have placed orders on all weekdays (Monday to Friday).
 select * from  customerdetails as C
 inner join orderdetails as O on
C.customerID = O. customerID
and DATEPART(WEEKDAY, OrderDate) NOT BETWEEN 2 AND 6;

-- Find the total sales amount for each year.
select year (orderdate) as Year, sum(totalamount) as TotalSales from orderdetails
group by year(orderdate);

-- Find the employees whose first name starts with 'J' and last name starts with 'S'.
select * from employeesdetail 
where Firstname like "j%" and Lastname like 's%';

-- Show the employees who have not been assigned any department.
select * from employeesdetail
where dpart is null;

-- Retrieve the top 5 customers with the highest total order amount. 
SELECT  SUM(O.TotalAmount) AS TotalAmount
FROM orderdetails as O
INNER JOIN customerdetails as C ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY TotalAmount DESC;