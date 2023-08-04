WITH short_film AS (
	SELECT*FROM film
	LIMIT 20	   	   )
select rating, split_part(STRING_AGG(description, '54639 '), '54639',2)
FROM short_film
GROUP BY rating;
