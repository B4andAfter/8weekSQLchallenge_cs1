--What is the most purchased item on the menu and how many times was it purchased by all customers?

WITH CTE AS(
	SELECT TOP 1 ProductId,COUNT(*) as TotalPurchases
	FROM DannysDiner.Sales 
	GROUP BY  ProductId
	ORDER BY COUNT(*) DESC
)

SELECT ProductName AS MostPopularItem,CustomerId,COUNT(*) AS TimesPurcashed 
FROM DannysDiner.Sales S 
INNER JOIN CTE C
ON (S.ProductId=C.ProductId)
INNER JOIN DannysDiner.Menu M
ON (C.ProductId=M.ProductId)
GROUP BY CustomerId,ProductName
ORDER BY CustomerId