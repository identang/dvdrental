SELECT * FROM actor
CROSS JOIN film_actor

SELECT MAX(rental_count)
FROM (
    SELECT customer_id, COUNT(*) AS rental_count
    FROM rental
    GROUP BY customer_id
) AS max_count

SELECT *
FROM customer
WHERE customer_id IN(
SELECT customer_id FROM rental WHERE return_date IS NULL
)

SELECT ct.city, EXTRACT(MONTH FROM p.payment_date) AS month, SUM(p.amount) AS total_payment
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
GROUP BY ct.city, EXTRACT(MONTH FROM p.payment_date)
HAVING SUM(p.amount) > 31
ORDER BY total_payment DESC;

SELECT
  title,
  rental_duration,
  AVG(rental_duration) OVER () AS overall_average
FROM film;


WITH revenue_vs_month AS (

SELECT DISTINCT avg(amount) OVER (PARTITION BY EXTRACT(MONTH FROM payment_date)) as month_average, EXTRACT(month FROM payment_date) as month
FROM payment	
)

SELECT corr(month_average, month)
FROM revenue_vs_month;

WITH my_table AS
(
  SELECT Numb, Name
  FROM (VALUES
       (1, 'Jan'),
       (2, 'Feb'),
       (3, 'Mar'),
       (4, 'Apr'),
       (5, 'May')
  ) AS my_table(Numb, Name)
)
SELECT Numb, Name
FROM my_table;



 