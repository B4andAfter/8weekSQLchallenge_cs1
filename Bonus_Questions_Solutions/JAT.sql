--Bonus Question 1:Join All The Things

SELECT 
	Sls.customer_id,
	order_date,
	product_name,
	price,
	CASE
		WHEN (order_date <= join_date) AND (join_date IS NOT NULL) THEN 'Y'
		ELSE 'N'
	END AS member
FROM DannysDiner.Sales Sls
LEFT JOIN DannysDiner.Menu Mnu
ON(Sls.product_id=Mnu.product_id)
LEFT JOIN DannysDiner.Members Mbs
ON(Sls.customer_id=Mbs.customer_id)
ORDER BY customer_id,order_date