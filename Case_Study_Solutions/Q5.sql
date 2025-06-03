--Which item was the most popular for each customer?

WITH CustomerTotalSales AS(
	SELECT CustomerId,ProductId,COUNT(*) AS TotalSales
	FROM DannysDiner.Sales
	GROUP BY CustomerId,ProductId
),
CustomerMaxSales AS(
	SELECT CustomerId,MAX(TotalSales) AS MaxSales
	FROM CustomerTotalSales
	GROUP BY CustomerId
)
SELECT c1.CustomerId,ProductName,c2.MaxSales  
FROM CustomerTotalSales c1
INNER JOIN CustomerMaxSales c2
ON (c1.CustomerId=c2.CustomerId AND MaxSales=TotalSales)
INNER JOIN DannysDiner.Menu M
ON (C1.ProductId=M.ProductId)
ORDER BY CustomerId
