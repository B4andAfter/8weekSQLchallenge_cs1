--What is the most purchased item on the menu and how many times was it purchased by all customers?

WITH CTE AS(
	SELECT TOP 1 product_id,COUNT(*) as total_purchases
	FROM DannysDiner.Sales 
	GROUP BY  product_id
	ORDER BY COUNT(*) DESC
)

SELECT product_name AS most_popular,customer_id,COUNT(*) times_purcashed 
FROM DannysDiner.Sales S 
INNER JOIN CTE C
ON (S.product_id=C.product_id)
INNER JOIN DannysDiner.Menu M
ON (C.product_id=M.product_id)
GROUP BY customer_id,product_name
ORDER BY customer_id