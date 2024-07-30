SELECT CAST(CAST((	SELECT COUNT(1) AS [Customer Count for AB Purchase]
				FROM (	SELECT [customer_id],COUNT(DISTINCT [product_id]) AS [PurchaseCount]
						 FROM [Assessment].[dbo].[CustomerPurchases]
						 WHERE [payment_status]='Paid' 
						 AND ([product_id]='A' OR [product_id]='B')
						 GROUP BY [customer_id]
						 HAVING COUNT(DISTINCT [product_id])=2
  ) CP) AS DECIMAL(18,2)) / CAST(COUNT(DISTINCT [customer_id]) AS DECIMAL(18,2))*100 AS INT) AS [Customer Percentage for AB Purchase]
FROM [Assessment].[dbo].[CustomerPurchases]
