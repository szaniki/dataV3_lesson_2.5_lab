USE sakila;
-- 1.Select all the actors with the first name ‘Scarlett’.
SELECT * from Sakila.actor WHERE first_name = 'Scarlett';

-- 2.How many films (movies) are available for rent and how many films have been rented? 
SELECT * from Sakila.inventory;
SELECT count(distinct inventory_id) from Sakila.rental;
SELECT count(distinct rental_id) from Sakila.rental;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MIN(length) as 'min_duration', MAX(length) as 'max_duration' from Sakila.film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT SEC_TO_TIME(ROUND(AVG(length)*60,0)) from Sakila.film;

-- 5. How many distinct (different) actors' last names are there?
SELECT DISTINCT(last_name) FROM Sakila.actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT datediff(max(payment_date), min(payment_date)) as Difference
from sakila.payment;
-- select * from sakila.payment; they were operating for less than a year

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, substr(rental_date,6,2) AS month, DAYOFWEEK(rental_date) AS weekday FROM rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, CASE
WHEN DAYOFWEEK(rental_date) in (1,2,3,4,5) then 'weekday'
WHEN DAYOFWEEK(rental_date) in (6,7) then 'weekend'
END AS day_type FROM rental;

-- 9.Get release years.
SELECT release_year from Sakila.film;

-- 10. Get all films with ARMAGEDDON in the title.
select *
from Sakila.film
where title like '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.
select *
from Sakila.film
where title like '%APOLLO';

-- 12. Get 10 the longest films.
SELECT *
FROM Sakila.film
ORDER BY LENGTH DESC
LIMIT 10;

-- 13. How many films include Behind the Scenes content?
select COUNT(special_features) from Sakila.film
where special_features like '%Behind the Scenes%';
