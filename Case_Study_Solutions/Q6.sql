--Which item was purchased first by the customer after they became a member?

WITH CTE AS (
	SELECT S.CustomerId,ProductId,OrderDate,JoinDate,RANK() OVER (PARTITION BY S.CustomerId ORDER BY OrderDate) AS OrderRank
	FROM DannysDiner.Sales S INNER JOIN DannysDiner.Members M
	ON (S.CustomerId=M.CustomerId)
	WHERE JoinDate <= OrderDate
)
SELECT CustomerId,OrderDate AS FirstOrderDate,ProductName
FROM CTE C LEFT JOIN DannysDiner.Menu M
ON(C.ProductId=M.ProductId)
WHERE OrderRank = 1;