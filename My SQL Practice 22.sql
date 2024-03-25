use classicmodels;

select*from customers;
select*from employees;
select*from offices;
select*from orderdetails;
select*from orders;
select*from productlines;
select*from products;
select*from payments;

-- Prepare a list of offices sorted by country, state, city.
select country,state,city
from offices;

-- How many employees are there in the company? 
select count(*) as Employees_count
from employees;

-- what is the total of payments received?
select sum(amount)
from payments;

-- List the product lines that contain 'Cars'.
select * from products
where productline='cars';

-- Report total payments for October 28, 2004.
select sum(amount)
from payments
where paymentdate='2004-10-28';

-- Report those payments greater than $100,000.
select * from payments
where amount > 100000;

-- List the products in each product line.
select productline,productname
from products
order by productname,productline;

-- How many products in each product line?
select productline,count(productcode)
from products
group by productcode;

-- What is the minimum payment received?
select min(amount)
from payments; 

-- List all payments greater than twice the average payment.
select *
from payments
where amount > 2*(select avg(amount) from payments); 