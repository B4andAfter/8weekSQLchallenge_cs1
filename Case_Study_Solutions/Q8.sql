--What is the total items and amount spent for each member before they became a member?

SELECT Sls.CustomerId,SUM(Mnu.Price) AS TotalSpend, COUNT(*) AS TotalItemsPurchased
FROM DannysDiner.Sales Sls INNER JOIN DannysDiner.Members Mbs
ON (Sls.CustomerId=Mbs.CustomerId)
INNER JOIN DannysDiner.Menu Mnu
ON (Sls.ProductId=Mnu.ProductId)
WHERE JoinDate>OrderDate
GROUP BY Sls.CustomerId