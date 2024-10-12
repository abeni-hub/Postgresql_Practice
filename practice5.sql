-- 1. Find the total amount spent by each customer on rentals, showing their first name, last name, and total amount spent.
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC;

--2) List the total number of rentals for each film category, and show only categories that have more than 50 rentals.
SELECT cat.name AS category_name, COUNT(r.rental_id) AS total_rentals
FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY cat.name
HAVING COUNT(r.rental_id) > 50
ORDER BY total_rentals DESC;

--3)Show the total amount spent on rentals by each customer whose last name contains "Smith", along with their customer ID.

SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
WHERE c.last_name LIKE '%Smith%'
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

--4)Find the average replacement cost of all films in the "Horror" and "Comedy" categories.

SELECT cat.name AS category_name, AVG(f.replacement_cost) AS avg_replacement_cost
FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
WHERE cat.name IN ('Horror', 'Comedy')
GROUP BY cat.name;

--5)  List all customers who have rented more than 5 films, showing their first name, last name, and the total number of films rented.**
SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name
HAVING COUNT(r.rental_id) > 5
ORDER BY total_rentals DESC;

--6)Find the most rented film by title and show the total number of times it has been rented.
SELECT f.title, COUNT(r.customer_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 1;

--7)Get the total rental duration for each customer who has rented a film, along with their first and last names.

SELECT c.first_name, c.last_name, SUM(f.rental_duration) AS total_rental_duration
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY c.first_name, c.last_name
ORDER BY total_rental_duration DESC;

--8) List the 5 films with the highest rental rates that are in the "Action" category, and show their title, rental rate, and release year.
SELECT f.title, f.rental_rate, f.release_year
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
WHERE cat.name = 'Action'
ORDER BY f.rental_rate DESC
LIMIT 5;

--9) Find all customers who rented a film in the month of August and spent more than $10. Show their first name, last name, and total amount spent.
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN payment p ON c.customer_id = p.customer_id
WHERE r.rental_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY c.first_name, c.last_name
HAVING SUM(p.amount) > 10
ORDER BY total_spent DESC;

--10) Find the minimum, maximum, and average rental duration for films in each category, and show the category name.
SELECT cat.name AS category_name,
MIN(f.rental_duration) AS min_rental_duration,
MAX(f.rental_duration) AS max_rental_duration,
AVG(f.rental_duration) AS avg_rental_duration
FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY cat.name
ORDER BY avg_rental_duration DESC;
