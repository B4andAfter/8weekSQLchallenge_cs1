--What is the total items and amount spent for each member before they became a member?

SELECT Sls.customer_id,SUM(Mnu.price) AS total_spend, COUNT(*) AS total_items_purcashed
FROM DannysDiner.Sales Sls INNER JOIN DannysDiner.Members Mbs
ON (Sls.customer_id=Mbs.customer_id)
INNER JOIN DannysDiner.Menu Mnu
ON (Sls.product_id=Mnu.product_id)
WHERE join_date>order_date
GROUP BY Sls.customer_id