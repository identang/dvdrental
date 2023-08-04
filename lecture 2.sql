SELECT min(length) as minimum, max(length) as maximum, avg(length) as average, STDDEV(length) as standard_deviation FROM film;

SELECT count(*) FROM film;

SELECT * FROM film;

SELECT avg(replacement_cost) FROM film;

SELECT avg(replacement_cost) as average_cost, rental_duration FROM film
group by rental_duration
order by rental_duration

SELECT fc.category_id, COUNT(*) AS category_count,c.name
FROM film_category fc
JOIN category c ON c.category_id = fc.category_id
Group BY fc.category_id,c.name

SELECT c.category_id, COUNT(*) AS film_count,c.name as category_name
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
Group BY c.category_id

SELECT c.category_id, c.name AS category_name, COUNT(f.film_id) AS film_count, SUM(p.amount) AS total_amount
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.category_id, c.name
ORDER BY total_amount DESC;

SELECT c.customer_id, c.first_name, c.last_name, COUNT(*) AS rental_count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(*) > 30;
-- HAVING is for aggregated data --

SELECT f.rating, SUM(p.amount) AS total_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.rating
HAVING SUM(p.amount) > 13000
ORDER BY total_revenue DESC;

SELECT film_id, title
FROM film
EXCEPT
SELECT DISTINCT f.film_id, f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
ORDER by film_id;

SELECT amount from payment
EXCEPT
SELECT rental_rate from film
