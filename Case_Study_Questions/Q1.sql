--What is the total amount each customer spent at the restaurant?

SELECT customer_id,SUM(price) AS total_spend
FROM DannysDiner.Sales S LEFT JOIN DannysDiner.Menu M
ON (S.product_id=M.product_id)
GROUP BY customer_id