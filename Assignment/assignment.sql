-- Most popular and profit making film category  --
SELECT cat.category_id, cat.name as category_name , COUNT(p.payment_id) as Numbers_of_rental, SUM(p.amount) as revenue, AVG(SUM(p.amount)) OVER() as Average_Revenue, COUNT(fc.category_id) as quantity
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category cat ON fc.category_id = cat.category_id
GROUP BY cat.category_id
ORDER BY SUM(p.amount) DESC

-- Top category among the existing films --
SELECT cat.name, COUNT(fc.category_id) FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
GROUP by cat.category_id
ORDER BY COUNT(fc.category_id) DESC

-- Check the correlation between the top category among the existing films and the profitable film category

WITH 
/*CTE1*/
film_count_by_cat as (
SELECT cat.category_id, cat.name, COUNT(fc.category_id) FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
GROUP by cat.category_id
ORDER BY COUNT(fc.category_id) DESC
),
/*CTE2*/
revenue_and_quantity AS(
	SELECT fc.category_id, cat.name,COUNT(*) as number_of_payment, SUM(p.amount) as revenue
	FROM payment p
	JOIN rental r ON p.rental_id = r.rental_id
	JOIN inventory i ON r.inventory_id = i.inventory_id
	JOIN film f ON i.film_id = f.film_id
	JOIN film_category fc ON fc.film_id = f.film_id
	JOIN category cat ON fc.category_id = cat.category_id
	GROUP BY fc.category_id, cat.name
)
SELECT CORR(RNQ.revenue, FCC.COUNT)
FROM revenue_and_quantity RNQ 
join film_count_by_cat AS FCC ON RNQ.category_id=FCC.category_id;

-- Identify categories that requires a relative high repleacement cost
SELECT cat.category_id, cat.name, AVG(f.replacement_cost) as average_RC
FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
GROUP BY cat.category_id
HAVING AVG(f.replacement_cost) > 20
ORDER BY AVG(f.replacement_cost) DESC


-- Favourite category of each customer -- 
SELECT c.customer_id, c.first_name, c.last_name, cat.category_id, cat.name as category_name, COUNT(r.rental_id)
FROM customer c
JOIN rental r ON r.customer_id = c.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category cat ON fc.category_id = cat.category_id
GROUP BY c.customer_id, cat.category_id
ORDER BY COUNT(cat.category_id) DESC



-- Top 10 customers who made the most payment --
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_spending, avg(p.amount) as average_spending, COUNT(rental_id) as rental_amount 
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY SUM(p.amount) DESC
LIMIT 10;

-- Top 20 films that makes the most amount of money
SELECT f.film_id, f.title, f.rating, f.length, SUM(p.amount) as revenue_earned
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.film_id
ORDER BY SUM(p.amount) DESC
LIMIT 20

-- Geographical distribution of the customers
SELECT COUNT(customer_id) as number_of_customers, ct.city_id, ct.city
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
GROUP BY ct.city_id
ORDER BY COUNT(customer_id) DESC

-- Categorizing customer into different grades based on their rental quantity
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_rentals,
    CASE
        WHEN COUNT(rental_id) >= 40 THEN 'Loyal'
        WHEN COUNT(rental_id) >= 30 THEN 'Supportive'
		WHEN COUNT(rental_id) >= 20 THEN 'Occasional'
        ELSE 'Casual'
    END AS rental_activity
FROM
    customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id
ORDER BY
    total_rentals DESC;
	

