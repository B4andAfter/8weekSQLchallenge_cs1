--Bonus Question 1:Join All The Things

SELECT 
	Sls.CustomerId,
	OrderDate,
	ProductName,
	Price,
	CASE
		WHEN (OrderDate <= JoinDate) AND (JoinDate IS NOT NULL) THEN 'Y'
		ELSE 'N'
	END AS Member
FROM DannysDiner.Sales Sls
LEFT JOIN DannysDiner.Menu Mnu
ON(Sls.ProductId=Mnu.ProductId)
LEFT JOIN DannysDiner.Members Mbs
ON(Sls.CustomerId=Mbs.CustomerId)
ORDER BY CustomerId,OrderDate