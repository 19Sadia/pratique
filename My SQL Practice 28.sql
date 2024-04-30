use sakila;

select * from actor;
select * from address;
select * from category;
select * from city;
select * from country;
select * from customer;
select * from film;
select * from film_actor;
select * from film_category;
select * from film_text;
select * from inventory;
select * from language;
select * from payment;
select * from rental;
select * from staff;
select * from store;

--  List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
select last_name, count(last_name)
from actor
group by last_name
having count(last_name)>1;

-- The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS, the name of Harpo’s second cousin’s husband’s yoga teacher. Write a query to fix the record.
select first_name,last_name
from actor
where first_name='GROUCHO' and last_name='WILLIAMS';

update actor 
set first_name='HARPO'
where first_name='GROUCHO' and last_name='WILLIAMS';

select first_name,last_name
from actor
where last_name='WILLIAMS';

-- Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:
select s.first_name, s.last_name
from staff as s 
join address as a
on s.address_id=a.address_id;

-- Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment.
select concat(s.first_name," ",s.last_name) as "staff member", sum(p.amount) as "amount"
from staff as s 
join payment as p
on s.staff_id= p.staff_id
group by s.staff_id;

-- List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join
select f.title,count( fa.actor_id) as actor
from film as f inner join film_actor as fa on 
f.film_id=fa.film_id
group by f.title;

-- How many copies of the film Hunchback Impossible exist in the inventory system?
select f.title,count(i.inventory_id) as 'total inventry'
from film as f inner join inventory as i on 
f.film_id=i.film_id
where f.title='Hunchback Impossible'
group by f.title;


-- he music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
select f.title
from film as f
where f.language_id= (select language_id from language where name ='English')
and f.title like 'k%' or 'Q%';

-- Use subqueries to display all actors who appear in the film Alone Trip.
select concat(a.first_name," ", a.last_name) as "name"
from actor as a
where actor_id in (select actor_id from film_actor where film_id=(select film_id from film 
where title='Alone Trip'));

-- You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. Use joins to retrieve this information.
select concat(c.first_name," ",c.last_name) as "name", c.email, a.address
from customer as c join address as a on
c.address_id = a.address_id
join city as cy on
a.city_id=cy.city_id join country as co on
cy.country_id = co.country_id
where co.country = 'Canada';

