use classicmodels;

select*from customers;
select*from employees;
select*from offices;
select*from orderdetails;
select*from orders;
select*from productlines;
select*from products;
select*from payments;

-- Reports those products that have been sold with a markup of 100% or more 
select distinct(p.productname),priceeach
from products as p join 
OrderDetails as od on
p.productCode = od.productCode
where priceeach >.2*buyPrice
order by p.productname;

-- List the products ordered on a Monday.
select p.productname,orderdate
from products as p join OrderDetails as od on 
p.productCode = od.productCode
join orders as o
ON od.orderNumber = o.orderNumber
and dayname(orderdate)='Monday';

-- What is the quantity on hand for products listed on 'On Hold' orders?
select p.productname,quantityInStock as quantiy_in_stock
from products as p join OrderDetails as od on 
p.productCode = od.productCode
join orders as o
ON od.orderNumber = o.orderNumber
where status='on hold';

-- Find products containing the name 'Ford'.
select * from products
where lower(productname) regexp'Ford';

-- List products ending in 'ship'
select * from products
where lower(productname) regexp'ship$';

-- Report the number of customers in Denmark, Norway, and Sweden.
select country,count(*) from customers 
where country regexp 'Denmark|Norway|Sweden'
group by country;

-- What are the products with a product code in the range S700_1000 to S700_1499?
select * from products
where productcode regexp 'S700_1[0-4][0-9][0-9]';

-- Which customers have a digit in their name?
select * from customers
where customername regexp '[0-9]';

-- List the names of employees called Dianne or Diane.
select * from employees 
where firstname regexp 'Dian';

-- List the products containing ship or boat in their product name.
select * from products 
where productname regexp 'ship|boat';