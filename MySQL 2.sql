show databases;
use classicmodels;

select*from products;

select count(productLine) as count_motorsyscle
from products
where productLine = 'Motorcycles';

select sum(MSRP) as Total_MotCycle
from products
where productLine='Motorcycles';

select avg(MSRP) as Average_MotCycle
from products
where productLine='Motorcycles';

select max(MSRP) as Max_MotCycle
from products
where productLine='Motorcycles';

select min(MSRP) as Min_MotCycle
from products
where productLine='Motorcycles';

select productLine,count(productLine) as count_PL,
sum(MSRP) as Total_PL, avg(MSRP) as avg_PL,
min(MSRP) as min_PL,max(MSRP) as Max_PL
from products
group by productLine
order by count_PL desc limit 5;

select country,count(creditLimit) as count_CL,
sum(creditLimit) as Total_CL, avg(creditLimit) as avg_CL,
min(creditLimit) as Min_CL, max(creditLimit) as Max_cl
from customers
group by country
having count_CL >10
order by count_CL desc limit 5;

select * from employees;

select * from customers
order by creditLimit desc limit 1;

select * from customers
where creditLimit =(
select max(creditlimit) from customers);

select * from customers
where creditlimit >(
select avg(creditLimit) from customers);

select * from orders
select * from customers
where status = (select contactLastName,contactFirstName,phone);

select contactLastName,contactFirstName,phone
from customers
where customerNumber in
(select customerNumber from orders
where status='cancelled');
