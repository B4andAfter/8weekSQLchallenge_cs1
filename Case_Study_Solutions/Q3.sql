--What was the first item from the menu purchased by each customer?

WITH CTE AS(
	SELECT CustomerId,MIN(OrderDate) AS FirstOrder
	FROM DannysDiner.Sales
	GROUP BY CustomerId
)

SELECT DISTINCT S.CustomerId,FirstOrder, ProductName AS FirstItem
FROM DannysDiner.Sales S 
INNER JOIN CTE C
ON (S.CustomerId=C.CustomerId AND FirstOrder=OrderDate) 
INNER JOIN DannysDiner.Menu M
ON (M.product_id =S.product_id)