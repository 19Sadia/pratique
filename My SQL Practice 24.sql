use classicmodels;

select*from customers;
select*from employees;
select*from offices;
select*from orderdetails;
select*from orders;
select*from productlines;
select*from products;
select*from payments;

-- How many orders have been placed by Herkku Gifts?
select count(o.ordernumber),c.customername
from customers as c 
join orders as o on
c.customernumber=o.customernumber
where customername='Herkku Gifts';

-- Who are the employees in Boston?
select e.firstname,e.lastname,f.city
from employees as e 
join offices as f on 
e.officecode=f.officeCode
where city='Boston';

-- Report those payments greater than $100,000. Sort the report so the customer who made the highest payment appears first.
select c.contactFirstName,p.amount
from customers as c 
join payments as p on 
c.customernumber=p.customernumber
where amount > 100000
order by amount desc;

-- List the value of 'On Hold' orders.
select o.ordernumber,sum(od.quantityOrdered *od.priceeach) as value 
from orderdetails as od
join orders as o on 
od.orderNumber=o.orderNumber
where status='on hold'
group by o.ordernumber;

-- Report the number of orders 'On Hold' for each customer.
select c.contactfirstname,c.customernumber,o.status
from customers as c
join orders as o on 
c.customernumber=o.customernumber
where status='on hold'
group by c.customernumber;

-- List names of products sold by order date.
select p.productname,p.productscale,o.orderDate
from  OrderDetails as od join orders as o
ON od.orderNumber = o.orderNumber
join products as p on 
p.productCode = od.productCode
order by orderdate asc;

-- List all the order dates in descending order for orders for the 1940 Ford Pickup Truck.
select o.orderdate
from orderdetails as od join products as p
on p.productCode = od.productCode
join orders as o on 
od.orderNumber = o.orderNumber
where p.productname='1940 Ford Pickup Truck'
order by orderdate desc;

-- List the names of customers and their corresponding order number where a particular order from that customer has a value greater than $25,000?
select c.customername,od.ordernumber,format(sum(quantityOrdered*priceEach),2) as Total_value
from customers as c join orders as o on
c.customernumber=o.customernumber
join orderdetails as od on 
od.orderNumber = o.orderNumber
GROUP BY orderNumber
having sum(quantityOrdered*priceEach) >= 25000;

-- Are there any products that appear on all orders?
select * from products
where not exists 
(select * from orders where not exists(select * from orderdetails 
 WHERE Products.productCode = OrderDetails.productCode
 and orders.orderNumber = orderdetails.orderNumber));

-- List the names of products sold at less than 80% of the MSRP.
select p.productname,p.msrp,od.priceEach
from products as p join 
orderdetails as od on 
p.productCode = od.productCode
where priceEach <.8*msrp;

