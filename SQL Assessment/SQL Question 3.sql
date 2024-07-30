SELECT TOP 5 p.[ProductName],
		SUM(t.Quantity) as [Total Quantity Bought with Product A],ROW_NUMBER() OVER (order by SUM(t.Quantity) desc) AS [Product Rank bought with Product A]
  FROM [Assessment].[dbo].[Transactions] t
  INNER JOIN (SELECT [TransactionID] 
				FROM [dbo].[Transactions] t
				INNER JOIN Products2 p
				ON t.ProductID=p.ProductID
				WHERE p.[ProductName]='Product A'
				) tid
	ON tid.[TransactionID]=t.[TransactionID]
  INNER JOIN Products2 p
  ON t.ProductID=p.ProductID
  WHERE p.[ProductName]<>'Product A'
  GROUP BY p.[ProductName]
