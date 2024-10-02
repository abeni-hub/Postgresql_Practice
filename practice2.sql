-- 1)Retrieve the first 10 movie titles from the film table.

select title
from film
limit 10;

-- 2) Find all movie titles that start with the letter "A".

select title
from film
where title like 'A%';

--3) List all addresses contain the word "Drive" anywhere in their name.

select *
from address
where address LIKE '%Drive%';

-- optionally
select *
from address
where lower(address) LIKE '%drive%';

--4) Retrieve the last names of customers who do not have a listed address in the address table

select last_name
from customer
where address_id IS NOT NULL;


--5) Find movie titles that start with "B" and have a rental duration of 5 days.

select title , rental_duration
from film
where title like 'B%' and rental_duration = 5;

--6) Retrieve all movie titles that either contain the word "Love" or start with "The".

select title
from film
where title like '%Love%' or title  like 'The%';

--7) List the first 5 customers who most recently created accounts, ordered by create_date in descending order.
select *
from customer
order by create_date desc
limit 5;

--8) Find actor first and last names where the first name starts with "J" and the last name is either "Doe", "Smith", or "Johnson".

select first_name, last_name
from actor
where first_name like 'J%' and last_name in  ('Doe', 'Smith', 'Johnson');

--9) Get the most recent 5 rentals that haven't been returned.

select *
from rental
where return_date is null
order by rental_date desc
limit 5;
