
-- Select all the actors with the first name ‘Scarlett’.
USE sakila;
SELECT * FROM actor
WHERE first_name = 'Scarlett';

-- How many films (movies) are available for rent and how many films have been rented?

SELECT COUNT(*) FROM rental;
SELECT COUNT(*) FROM film;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT * from film;
SELECT MAX(length) from film;
SELECT MIN(length) from film;


-- What's the average movie duration expressed in format (hours, minutes)?
SELECT sec_to_time(AVG(length)*60) from film;

-- How many distinct (different) actors' last names are there?
SELECT count(DISTINCT last_name)
from actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS 'days_operating' 
FROM rental;

-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT DATE_FORMAT(rental_date,'%M') AS 'month', DATE_FORMAT(rental_date,'%a') AS 'day'
FROM rental
LIMIT 20;

-- SELECT rental_date FROM rental;
SELECT rental_date
from rental;



-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT DATE_FORMAT(rental_date,'%M') AS 'month', DATE_FORMAT(rental_date,'%a') AS 'day'
FROM rental
LIMIT 20;
SELECT rental_date,
CASE
WHEN DATE_FORMAT(rental_date,'%a') = 'Sat' then 'weekend'
WHEN DATE_FORMAT(rental_date,'%a') = 'Sun' then 'weekend'
ELSE 'weekday'
END AS column_day_type
FROM rental;



-- Get release years.
SELECT release_year FROM film;


-- Get all films with ARMAGEDDON in the title.
SELECT * FROM film
where title like '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.
SELECT title FROM film
where title like '%APOLLO';

-- Get 10 the longest films.

SELECT title, length
From film
order by length DESC
limit 10;


-- How many films include Behind the Scenes content?

Select special_features FROM film
where special_features = '%Behind the Scences%';