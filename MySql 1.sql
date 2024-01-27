show databases;
use classicmodels;

show tables;

select*from customers;
select*from employees;
select*from offices;
select*from orders;
select*from products;

select contactLastName,contactFirstName,state,country from customers
where state is not null;

select distinct (country)from customers;

select
Country,count(customerNumber)
from customers group by country;

select
state,count(customerNumber)
from customers group by state;

select count(distinct(country))from customers;

select count(*)from customers
where state is null;

select count(*) from customers
where phone is null;

select count(*) from customers
where city is null;

select count(*) from customers
where creditLimit is null;

select count(*) from customers
where postalCode is null;

select * from customers
where state is null;

select contactFirstName,contactLastName,state,country from customers
where state is null;

select*from products

select productName,productLine,MSRP 
from products
order by MSRP desc limit 5;

select productName,productLine,MSRP 
from products
order by MSRP desc limit 3;

select contactFirstName,contactLastName,country,postalCode
from customers
where country in ('USA','UK','Spain');

select productName from products;

select contactFirstName,contactLastName,creditLimit
from customers
where creditLimit between 50000 and 100000
order by creditLimit desc;

select min(MSRP),max(MSRP) from products;

select contactFirstName,contactLastName,creditLimit
from customers
where contactLastName like '%pson%';

select count(*) from customers
where contactLastName like '%pson%';

select contactFirstName,contactLastName,creditLimit
from customers
where contactFirstName like 'v%e';

select count(*) from customers
where contactFirstName like 'v%e';

select productName, productLine,MSRP
from products
where MSRP between 50 and 150;

select count(*) from products
where MSRP between 50 and 150;

select count(MSRP) as cc_count,
sum(MSRP) as cc_total, avg(MSRP) as cc_min,
max(MSRP) as cc_max
from products;

select count(MSRP), sum(MSRP),avg(MSRP),max(MSRP)
from products;

select count(customerNumber)
from customers
where country='USA';

select min(creditLimit)
from customers
where country='UK';

select avg(creditLimit)
from customers
where country='Spain';