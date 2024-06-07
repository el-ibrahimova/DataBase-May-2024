CREATE OR ALTER PROCEDURE usp_GetHoldersWithBalanceHigherThan (@amount MONEY)
		   	  AS
		   BEGIN 
				SELECT 
				       ac.FirstName AS [First Name],
					   ac.LastName AS [Last Name]
				  FROM AccountHolders AS ac
				  JOIN Accounts AS a ON ac.Id = a.AccountHolderId
              GROUP BY ac.FirstName, ac.LastName
                HAVING SUM(a.Balance) > @amount 
			  ORDER BY ac.FirstName, 
				       ac.LastName
			 END

	EXEC dbo.usp_GetHoldersWithBalanceHigherThan 30000