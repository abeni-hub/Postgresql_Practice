-- Distinct

select distinct first_name
from customer
order by first_name

select distinct film_id
from inventory
order by film_id

-- Functions
-- f(x) = mx + b
-- count function
select count(film_id)
from film

select count(first_name)
from customer
where first_name like 'A%';

-- Today's time
select Now();

-- sum 
select sum(amount) AS Total_payment
from payment

-- max - to find maximum value
select max(amount)
from payment

-- min - to find minimum value

select min(amount)
from payment

-- average - sum( all values)/count(all values)
select avg(amount)
from payment 


-- round
select round(avg(amount), 2) AS Avg_amount 
from payment



-- Practice Question
--1)Retrieve the total number of movies in the `film` table where the rental rate is between 1.99 and 4.99.
select count(*)
from film
where rental_rate between 1.99 and 4.99

-- 2) Find the average rental duration of movies with titles starting with the letter 'A'.
select avg(rental_duration)
from film
where title like 'A%';

--3) Retrieve the sum of all payments made for rentals that occurred after '2005-06-15'. Limit the result to the first 5 payments.**

select sum(amount)
from payment
where payment_date >'2005-06-15'
limit 5;

--4) Get the maximum replacement cost of movies with a rental duration of 7 days or that have a rating of 'PG-13'
 
select max(replacement_cost)
from film
where rental_duration = 7 or rating = 'PG-13';

--5) Find the total number of customers whose email addresses are not listed (NULL).
select count(*) as total_customer_without_email
from customer
where email is null;

--6) *Retrieve the minimum rental rate of movies in the `film` table that have a length greater than 120 minutes. Sort the result in descending order of rental rate.
 
select min(rental_rate) 
from film
where length > 120
group by (rental_rate)
order by rental_rate desc

--7) Count the number of distinct movie titles where the description contains the word 'action

select count (distinct title) as distinct_action 
from film
where description like '%action%'

--8) Retrieve the first 10 actors' last names where the first name is either 'John', 'Michael', or 'Sarah', ordered by last name.
SELECT last_name
FROM actor
WHERE first_name IN ('John', 'Michael', 'Sarah')
ORDER BY last_name
LIMIT 10;

--9) *Get the sum of all payments where the amount is not NULL and is greater than 5.00. Limit the result to the first 5 payments






-- 10)Find the total number of movies with a rental rate of either 0.99, 2.99, or 4.99 and limit the result to the first 5 titles.



