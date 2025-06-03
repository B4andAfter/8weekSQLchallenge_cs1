--How many days has each customer visited the restaurant?

SELECT CustomerId,COUNT(DISTINCT OrderDate) AS TotalDaysVisited
FROM DannysDiner.Sales
GROUP BY CustomerId
