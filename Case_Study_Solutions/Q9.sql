--If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

WITH CTE AS(
	SELECT 
		ProductId,
		CASE
			WHEN ProductName = 'sushi' THEN 10*2*Price
			ELSE Price*10
		END AS Points
	FROM DannysDiner.Menu
)

SELECT CustomerId,SUM(Points) AS TotalPoints
FROM DannysDiner.Sales S INNER JOIN CTE C
ON (S.ProductId = C.ProductId)
GROUP BY CustomerId