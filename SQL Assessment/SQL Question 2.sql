SELECT (sum(CASE WHEN P.start_date IS NOT NULL THEN S.amount
			ELSE NULL END)/sum(s.amount)) * 100 as  [percentage of sales attributed to promotions]
  FROM [Assessment].[dbo].[Sales] S
  LEFT OUTER JOIN [dbo].[Promotions] P
  ON S.promotion_id=P.promotion_id AND (S.sale_date=P.start_date OR S.sale_date=p.end_date)