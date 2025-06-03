--Bonus Question 2: Rank All The Things
WITH CustomerOrders AS (
    SELECT
        Sls.CustomerId,
        OrderDate,
        ProductName,
        Price,
        CASE
            WHEN OrderDate >= JoinDate THEN 'Y'
            ELSE 'N'
        END AS Member
    FROM DannysDiner.Sales Sls
    LEFT JOIN DannysDiner.Menu Mnu
	ON (Sls.ProductId = Mnu.ProductId)
    LEFT JOIN DannysDiner.Members Mbs
	ON (Sls.CustomerId = Mbs.CustomerId)
)
SELECT
    CustomerId,
    OrderDate,
    ProductName,
    Price,
    Member,
    CASE
        WHEN Member = 'Y' THEN
            RANK() OVER (
                PARTITION BY CustomerId,Member
                ORDER BY OrderDate
            )
        ELSE NULL
    END AS Ranking
FROM CustomerOrders
ORDER BY CustomerId, OrderDate;
