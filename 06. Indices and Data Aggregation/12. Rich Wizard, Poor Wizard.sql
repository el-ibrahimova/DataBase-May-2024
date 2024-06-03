-- method 1 => with INNER JOIN
  -- втория магьосник от първата таблица става първи във втората таблица

SELECT *
FROM WizzardDeposits AS wd1
JOIN WizzardDeposits AS wd2 
  ON wd2.Id+1 = wd1.Id 


  -- method 2 => with windows function LEAD
  -- LEAD() -> return the value of a column from the next row ordered by criteria
 
 SELECT 
		SUM ([Difference]) AS SumDifference
   FROM
		  (
		     SELECT 
					FirstName AS [Host Wizard],
					DepositAmount AS [Host Wizard Deposit],
					LEAD (FirstName) OVER (ORDER BY (Id)) AS [Guest Wizard],
					LEAD (DepositAmount) OVER (ORDER BY (Id)) AS [Guest Wizard Deposit],
					DepositAmount - LEAD (DepositAmount) OVER (ORDER BY (Id)) AS [Difference]
			   FROM WizzardDeposits
		   )
	AS DifferenceSubquery