--How many days has each customer visited the restaurant?

SELECT customer_id,COUNT(DISTINCT order_date) AS total_days_visited
FROM DannysDiner.Sales
GROUP BY customer_id
