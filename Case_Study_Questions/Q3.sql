--What was the first item from the menu purchased by each customer?

WITH CTE AS(
	SELECT customer_id,MIN(order_date) AS first_order
	FROM DannysDiner.Sales
	GROUP BY customer_id
)

SELECT DISTINCT S.customer_id,first_order, product_name AS first_item
FROM DannysDiner.Sales S 
LEFT JOIN CTE C
ON (S.customer_id=C.customer_id AND first_order=order_date) 
LEFT JOIN DannysDiner.Menu M
ON (M.product_id =S.product_id)
WHERE first_order IS NOT NULL