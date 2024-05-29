-- method 1
SELECT ContinentCode,
       CurrencyCode, 
	   CurrencyUsage
  FROM (
			SELECT 
					*,
			DENSE_RANK () OVER (PARTITION BY ContinentCode ORDER BY CurrencyUsage DESC)
					AS CurrencyRank
					FROM (
							SELECT ContinentCode,
								   CurrencyCode,
						  	 COUNT (*) AS CurrencyUsage
						      FROM Countries 
						  GROUP BY ContinentCode, CurrencyCode
						  HAVING COUNT (*) > 1
				         ) AS CurrencyUsageSubquery
	) AS CurrencyRankingSubquery
 WHERE CurrencyRank=1


 -- method 2
 SELECT rc.ContinentCode,
        rc.CurrencyCode,
        rc.Count
   FROM
   (
	 SELECT 
	         c.ContinentCode,
	         c.CurrencyCode,
	   COUNT (c.CurrencyCode) AS Count,
	   DENSE_RANK ()
	      OVER (PARTITION BY c.ContinentCode ORDER BY COUNT (c.CurrencyCode) DESC) AS [rank]
	 FROM Countries AS c
	 GROUP BY c.ContinentCode, c.CurrencyCode
    )  AS rc
 WHERE rc.[rank] =1 AND rc.Count >1