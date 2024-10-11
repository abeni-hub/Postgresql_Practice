--1)



--2)
select title,rental_

--3) Count the number of films that have "Action" in their title.
select count(*)
from film where title like '%action%';


select count(*)
from film where title ilike '%Action'; -- ilike is not sql standard it is only postgresql additional features


--4)Find the maximum rental duration and the corresponding film titles for films with a rental duration greater than 5 days.


select title , rental_duration 
from film
where rental_duration = (select max(rental_duration) -- Nested Query
						 from film)
and rental_duration > 5;

-- other example regarding with payemnt table
select first_name, last_name
from customer 
where customer_id in(select customer_id
                   from payment
                   group by customer_id
                   having sum(amount) > 150)
				   
--5)List all customers who have rented a film, but filter out those who have no last name recorded.
select
--8)  Find all unique film categories with at least one film rented.
select distinct ca.category_id , name
from category ca

   join film_category cat on ca.category_id = cat.category_id
   join film fi on fi.film_id = cat.film_id 
   join inventory inv on inv.film_id = fi.film_id 
   join rental re on re.inventory_id = inv.inventory_id

--9) List the 5 films with the highest rental rates, and display their title, rental rate, and length.
select title,rental_rate, length
from film
order by rental_rate desc
limit 5;
--10) Find all payments that are either greater than $5 or made by customer IDs in a specific set (e.g., 3, 7, 15).
select *
from payment
where amount > 5 or customer_id in(3,7,15);
