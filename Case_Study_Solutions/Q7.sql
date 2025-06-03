--Which item was purchased just before the customer became a member?
WITH CTE AS(
SELECT S.CustomerId,MAX(OrderDate) AS FirstBeforeJoin
FROM DannysDiner.Sales S
INNER JOIN DannysDiner.Members M
ON (S.customer_id=M.customer_id)
WHERE JoinDate>OrderDate
GROUP BY S.customer_id
)
SELECT S.customer_id,FirstBeforeJoin,ProductName
FROM DannysDiner.Sales S
INNER JOIN DannysDiner.Menu M
ON (M.product_id=S.product_id)
INNER JOIN CTE C
ON (C.customer_id=S.customer_id AND C.FirstBeforeJoin=OrderDate)
