use cds10;
create table customer(
cid int,
fname varchar(10),
lname varchar(10),
age int,
country varchar(15)
);
show tables;

INSERT INTO customer VALUES 
('1','John','Deo','32','USA'),
('2','Robert','Luna','22','USA'),
('3','David','Robinson','22','UK'),
('4','John','David','25','UK'),
('5','Betty','Deo','28','UAE');

create table orders(
oid int,
amount int,
cid int
);

show tables;

INSERT INTO orders VALUES 
('1','200','4'),
('2','500','10'),
('3','300','3'),
('4','800','1'),
('5','150','2');

select * from customer;
select * from orders;

-- Joins(18-Jan-24)
create table new_emp(
empid varchar(10),
ename varchar(10),
salary int,
depid varchar(20)
); 

INSERT INTO new_emp VALUES 
('E1','John','45000','D1'),
('E2','Mary','60000','D2'),
('E3','Steve','73000','D3'),
('E4','Helen','86000','D4'),
('E5','Joe','3500','D7');

create table dept(
depid varchar(10),
dname varchar(10)
); 

INSERT INTO dept VALUES 
('D1','IT'),
('D2','HR'),
('D3','Admin'),
('D4','Finance'),
('D5','Sales');

select * from new_emp;
select * from dept;

select ename,salary,dname
from new_emp as e inner join dept as d
on e.depid=d.depid;

update new_emp
set  depid='D7'
where empid='E5';

select e.empid,e.ename,e.salary,e.depid,d.dname
from new_emp as e left join dept as d
on e.depid=d.depid;

select e.ename,e.salary,d.dname
from new_emp as e right join dept as d
on e.depid=d.depid;

select e.ename,e.salary,d.depid,d.dname
from new_emp as e left join dept as d
on e.depid=d.depid
union
select e.ename,e.salary,d.depid,d.dname
from new_emp as e right join dept as d
on e.depid=d.depid;

use classicmodels;
 select * from customers;
 select * From payments;
 
select c.contactFirstName,c.contactLastName,c.country,p.amount,p.checkNumber
from customers as c inner join payments as p
on c.customerNumber=p.customerNumber;
 
 -- Join 3 tables
select c.contactFirstName,c.contactLastName,c.country,n.checkNumber,n.status
from customers as c inner join 
(select p.customernumber,p.amount,p.checknumber,o.status
from orders as o inner join payments as p
on o.customerNumber=p.customerNumber) as n
on c.customerNumber=n.customerNumber;

select c.contactFirstName,c.contactLastName,c.country,n.checkNumber,n.status
from customers as c inner join 
(select p.customernumber,p.amount,p.checknumber,o.status
from orders as o inner join payments as p
on o.customerNumber=p.customerNumber) as n
on c.customerNumber=n.customerNumber;

-- complete this question
select e.ename,e.salary,d.depid,d.dname
from orders as o right join orderdetails as od
on o.orderNumber=od.orderNumber
union
select e.ename,e.salary,d.depid,d.dname
from new_emp as e left join dept as d
on e.depid=d.depid

