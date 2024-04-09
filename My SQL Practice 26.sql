use classicmodels;

select*from customers;
select*from employees;
select*from offices;
select*from orderdetails;
select*from orders;
select*from productlines;
select*from products;
select*from payments;

-- List the products with a product code beginning with S700.
select* from products
where productcode regexp '[^S700]';

-- List the names of employees called Larry or Barry.
select * from employees 
where firstname regexp '[BL]arry';

-- List the names of employees with non-alphabetic characters in their names.
select * from employees 
where firstname regexp '[^a-z]';

-- List the vendors whose name ends in Diecast
select distinct(productvendor) from products 
where productvendor regexp 'diecast$';

-- Who is at the top of the organization
select * from employees 
where reportsto is null;

-- Who reports to William Patterson?
select r.firstname,r.lastname
from employees as e
join employees as r 
on e.employeeNumber = r.reportsto
WHERE e.firstName = "William" and e.lastName = "Patterson";

-- List all the products purchased by Herkku Gifts.
select p.productname
from orderdetails as od
join orders as o
on od.orderNumber = o.orderNumber
join customers as c 
on c.customernumber=o.customernumber
join products as p
on p.productcode=od.productcode
where customername= 'Herkku Gifts';

-- What is the difference in days between the most recent and oldest order date in the Orders file?
select datediff(max(orderdate),min(orderdate)) as 'difference bewteen dates' from orders;

-- Compute the average time between order date and ship date for each customer ordered by the largest difference.
select c.customername , avg(datediff(orderdate,shippeddate)) as Diff from
customers as c join orders as o
on c.customerNumber = o.customerNumber
group by customername
order by Diff;

-- What is the value of orders shipped in August 2004?
select format(sum(quantityOrdered*priceEach),0) as value 
from orders as o join orderdetails as od
on o.orderNumber = od. orderNumber
and month(orderdate)='8'
and year(orderdate)='2004';
