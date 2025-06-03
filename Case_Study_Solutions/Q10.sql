/*In the first week after a customer joins the program (including their join date) they earn 2x
points on all items, not just sushi - how many points do customer A and B have at the end of January?*/


WITH product_points AS(
	SELECT 
		product_id,
		CASE
			WHEN product_name = 'sushi' THEN 10*2*price
			ELSE price*10
		END AS points
	FROM DannysDiner.Menu
),
product_points_first_week AS(

	SELECT
		S.customer_id,
		CASE
			WHEN DATEDIFF(WEEK,join_date,order_date) BETWEEN 0 AND 6 THEN points*2
			ELSE points
		END AS points
	FROM DannysDiner.Sales S LEFT JOIN product_points P
	ON(S.product_id=P.product_id)
	LEFT JOIN DannysDiner.Members M
	ON (S.customer_id = M.customer_id)
)

SELECT customer_id,SUM(points) AS total_points
FROM product_points_first_week
WHERE customer_id IN ('A','B')
GROUP BY customer_id
