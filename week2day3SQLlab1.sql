USE sakila;
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;
SELECT title FROM film;
SELECT distinct(name) as language FROM language;
-- Find out how many stores the company has: cheching the addresses it looks like the company has 603 stores;
SELECT count(distinct(store_id)) as numberstores FROM store;
-- Find out how many employees staff does the company have
SELECT count(distinct(first_name)) as numberemployees FROM staff;
SELECT count(distinct(manager_staff_id)) as numberemployees FROM store;
-- Return a list of employee first names only
SELECT first_name from staff;

-- Week2Day3lab1

-- Select all the actors with the first name ‘Scarlett’.
select first_name from actor;

-- How many films (movies) are available for rent and how many films have been rented?
SELECT *  from rental;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT 
   min(length) as Minimum_lenght, 
   max(length) as Maximum_lenght 
FROM sakila.film; 

-- What's the average movie duration expressed in format (hours, minutes)?

SELECT 
	LEFT(round(avg(length))/60,1) as hours,
    round(RIGHT(round(avg(length))/60,4)*60/10000) as minutes
from sakila.film;

-- Since how many days has the company been operating (check DATEDIFF() function)?
SELECT * from rental;
select(min(rental_date)) from rental;
select(max(rental_date)) from rental;
select datediff((max(rental_date)),(min(rental_date))) from rental;

-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT * from rental;
SELECT * , EXTRACT(Day from rental_date) AS day FROM sakila.rental;
SELECT * , EXTRACT(Month from rental_date) AS month FROM sakila.rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT* , extract(day from rental_date);


-- Get release years.
SELECT release_year from film;

-- Get all films with ARMAGEDDON in the title. 

SELECT title FROM film
WHERE title like "%ARMAGEDDON%";

-- Get all films which title title ends with APOLLO.  

SELECT title FROM film
WHERE title like '%APOLLO';

-- Get 10 the longest films.

SELECT * FROM sakila.film
ORDER BY length DESC   
LIMIT 10;

-- How many films include Behind the Scenes content?

SELECT count(special_features) FROM film
WHERE special_features like '%Behind the Scenes%';