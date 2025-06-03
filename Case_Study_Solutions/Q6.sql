--Which item was purchased first by the customer after they became a member?

WITH CTE AS (
	SELECT S.customer_id,product_id,order_date,join_date,RANK() OVER (PARTITION BY S.customer_id ORDER BY order_date) AS order_rank
	FROM DannysDiner.Sales S INNER JOIN DannysDiner.Members M
	ON (S.customer_id=M.customer_id)
	WHERE join_date <= order_date
)
SELECT customer_id,order_date AS first_order_date,product_name
FROM CTE C LEFT JOIN DannysDiner.Menu M
ON(C.product_id=M.product_id)
WHERE order_rank = 1;