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

-- Display the first and last names of all actors from the table actor.
select concat(first_name," ", last_name) as `name of actors`
from actor;

-- Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.
select upper(concat(first_name," ", last_name)) as `name of actors`
from actor;

-- You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, “Joe.”
select actor_id, first_name, last_name 
from actor
where first_name='joe';

-- Find all actors whose last name contain the letters GEN
select * from actor
where last_name regexp'GEN$';

-- Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order:
select * from actor
where last_name like '%li%'
order by last_name,first_name;

-- Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:
select country_id, country
from country
where country in ('Afghanistan', 'Bangladesh', 'China');

-- Add a middle_name column to the table actor. Position it between first_name and last_name.
alter table actor
add column middle_name varchar (40) after first_name;

-- You realize that some of these actors have tremendously long last names. Change the data type of the middle_name column to blobs.
alter table actor
modify column middle_name blob;

-- Now delete the middle_name column.
alter table actor
drop column middle_name;

-- List the last names of actors, as well as how many actors have that last name.
select last_name, count(last_name)
from actor
group by last_name;
