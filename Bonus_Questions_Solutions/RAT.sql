--Bonus Question 2: Rank All The Things
WITH customer_orders AS (
    SELECT
        Sls.customer_id,
        order_date,
        product_name,
        price,
        CASE
            WHEN order_date >= join_date THEN 'Y'
            ELSE 'N'
        END AS member
    FROM DannysDiner.Sales Sls
    LEFT JOIN DannysDiner.Menu Mnu
	ON (Sls.product_id = Mnu.product_id)
    LEFT JOIN DannysDiner.Members Mbs
	ON (Sls.customer_id = Mbs.customer_id)
)
SELECT
    customer_id,
    order_date,
    product_name,
    price,
    member,
    CASE
        WHEN member = 'Y' THEN
            RANK() OVER (
                PARTITION BY customer_id,member
                ORDER BY order_date
            )
        ELSE NULL
    END AS ranking
FROM customer_orders
ORDER BY customer_id, order_date;
