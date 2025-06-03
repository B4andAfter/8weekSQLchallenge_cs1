--If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

WITH CTE AS(
	SELECT 
		product_id,
		CASE
			WHEN product_name = 'sushi' THEN 10*2*price
			ELSE price*10
		END AS points
	FROM DannysDiner.Menu
)

SELECT customer_id,SUM(points) AS total_points
FROM DannysDiner.Sales S INNER JOIN CTE C
ON (S.product_id = C.product_id)
GROUP BY customer_id