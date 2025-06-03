--Which item was purchased just before the customer became a member?
WITH CTE AS(
SELECT S.CustomerId,MAX(OrderDate) AS FirstBeforeJoin
FROM DannysDiner.Sales S
INNER JOIN DannysDiner.Members M
ON (S.CustomerId=M.CustomerId)
WHERE JoinDate>OrderDate
GROUP BY S.CustomerId
)
SELECT S.CustomerId,FirstBeforeJoin,ProductName
FROM DannysDiner.Sales S
INNER JOIN DannysDiner.Menu M
ON (M.ProductId=S.ProductId)
INNER JOIN CTE C
ON (C.CustomerId=S.CustomerId AND C.FirstBeforeJoin=OrderDate)
