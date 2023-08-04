SELECT DISTINCT first_name, last_name FROM actor
WHERE LENGTH(last_name) < 4
ORDER BY first_name desc;


SELECT amount, customer_id FROM payment
WHERE amount = 0
ORDER BY customer_id;

SELECT amount from payment
WHERE amount < 0.99;

SELECT * FROM payment
WHERE amount <=1.99;

SELECT DISTINCT amount, COUNT(amount) from payment
GROUP BY amount
ORDER BY amount;

SELECT * FROM film
WHERE (rental_rate >2.99) AND (rental_duration >1) AND replacement_cost > 10;


SELECT MAX(rental_rate) FROM film;

SELECT * FROM film 
WHERE title IN ('Airplane Sierra','Star Wars', 'Groundhog Uncut')

--purpose here is to find info for all customers who have a movie thye haven't returned
SELECT * FROM customer
WHERE customer_id IN (SELECT customer_id FROM rental  WHERE return_date IS null) 

SELECT * FROM actor
WHERE LENGTH (first_name) < ANY(select LENGTH(last_name) from actor);

SELECT MAX(LENGTH(first_name)) FROM customer;

SELECT MIN(LENGTH(last_name)) FROM customer;

SELECT * from actor
WHERE(first_name) = ANY(SELECT first_name from customer)

SELECT first_name FROM customer
WHERE first_name NOT IN (select first_name from actor)

Select customer_id, first_name, last_name
FROM customer c
WHERE EXISTS(
	SELECT 1
	FROM rental r WHERE r.customer_id = c.customer_id
	AND r.return_date IS NULL);
	
SELECT * from customer
WHERE first_name LIKE 'T__' OR first_name LIKE '%t%';

--disregard the case of the character--
SELECT * FROM customer
WHERE first_name ILIKE '%t%'
LIMIT 10;

SELECT * FROM film
WHERE LENGTH(description) BETWEEN 50 AND 100;


