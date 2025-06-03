--What is the total amount each customer spent at the restaurant?

SELECT CustomerId,SUM(Price) AS TotalSpend
FROM DannysDiner.Sales S LEFT JOIN DannysDiner.Menu M
ON (S.ProductId=M.ProductId)
GROUP BY CustomerId