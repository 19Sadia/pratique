use classicmodels;

select*from customers;
select*from employees;
select*from offices;
select*from orderdetails;
select*from orders;
select*from productlines;
select*from products;
select*from payments;

-- What is the average percentage markup of the MSRP on buyPrice?
select avg(msrp/buyprice)*100
from products;

-- How many distinct products does ClassicModels sell?
select distinct(productname)
from products;

-- Report the name and city of customers who don't have sales representatives?
select customername,city,salesRepEmployeeNumber
from customers
where salesRepEmployeeNumber is null;

-- What are the names of executives with VP or Manager in their title? Use the CONCAT function to combine the employee's first name and last name into a single field for reporting.
select concat(firstname,'',lastname) as employee_name
from employees
where jobtitle regexp 'vp | manager';

-- Which orders have a value greater than $5,000?
select ordernumber, FORMAT(SUM(quantityOrdered*priceEach),1)
as order_value
from orderdetails
group by orderNumber having sum(quantityOrdered*priceEach) >5000;

-- Report the account representative for each customer.
select e.firstname,e.lastname,c.customerName
from employees as e 
join customers as c on
e.employeenumber=c.salesrepemployeenumber;

-- Report total payments for Atelier graphique.
select p.customernumber,c.customername,sum(p.amount)
from payments as p
join customers as c on
p.customernumber=c.customernumber
where c.customername='Atelier graphique'
group by customernumber;

-- Report the total payments by date
select paymentdate, sum(amount)
from payments 
group by paymentdate;

-- Report the products that have not been sold.
select p.productcode,p.productname
from products as p
where not exists(select * from orderdetails as o where p.productcode=o.productcode);

-- List the amount paid by each customer.
select c.customernumber,c.customername,sum(p.amount)
from customers as c
inner join payments as p
on c.customernumber=p.customernumber
group by customernumber;