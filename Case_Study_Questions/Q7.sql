--Which item was purchased just before the customer became a member?
WITH CTE AS(
SELECT S.customer_id,MAX(order_date) AS first_before_join
FROM DannysDiner.Sales S
INNER JOIN DannysDiner.Members M
ON (S.customer_id=M.customer_id)
WHERE join_date>order_date
GROUP BY S.customer_id
)
SELECT S.customer_id,first_before_join,product_name
FROM DannysDiner.Sales S
INNER JOIN DannysDiner.Menu M
ON (M.product_id=S.product_id)
INNER JOIN CTE C
ON (C.customer_id=S.customer_id AND C.first_before_join=order_date)
