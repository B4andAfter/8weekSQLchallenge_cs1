/*In the first week after a customer joins the program (including their join date) they earn 2x
points on all items, not just sushi - how many points do customer A and B have at the end of January?*/


WITH ProductPoints AS(
	SELECT 
		ProductId,
		CASE
			WHEN ProductName = 'sushi' THEN 10*2*Price
			ELSE Price*10
		END AS Points
	FROM DannysDiner.Menu
),
ProductPointsFirstWeek AS(

	SELECT
		S.CustomerId,
		CASE
			WHEN DATEDIFF(WEEK,JoinDate,OrderDate) BETWEEN 0 AND 6 THEN Points*2
			ELSE points
		END AS points
	FROM DannysDiner.Sales S LEFT JOIN ProductPoints P
	ON(S.ProductId=P.ProductId)
	LEFT JOIN DannysDiner.Members M
	ON (S.CustomerId = M.CustomerId)
)

SELECT CustomerId,SUM(Points) AS TotalPoints
FROM ProductPointsFirstWeek
WHERE CustomerId IN ('A','B')
GROUP BY CustomerId
