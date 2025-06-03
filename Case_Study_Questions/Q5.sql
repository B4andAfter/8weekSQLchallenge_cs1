--Which item was the most popular for each customer?

WITH customer_total_sales AS(
	SELECT customer_id,product_id,COUNT(*) AS total_sales
	FROM DannysDiner.Sales
	GROUP BY customer_id,product_id
),
customer_max_sales AS(
	SELECT customer_id,MAX(total_sales) AS max_sales
	FROM customer_total_sales
	GROUP BY customer_id
)
SELECT c1.customer_id,product_name,c2.max_sales  
FROM customer_total_sales c1
INNER JOIN customer_max_sales c2
ON (c1.customer_id=c2.customer_id AND max_sales=total_sales)
INNER JOIN DannysDiner.Menu M
ON (C1.product_id=M.product_id)
ORDER BY customer_id