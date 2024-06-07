CREATE OR ALTER PROCEDURE usp_CalculateFutureValueForAccount (@accountId INT, @yearlyInterestRate FLOAT)
			  AS
		   BEGIN
			  SELECT 
					 a.Id AS [Account Id],
					 ac.FirstName AS [First Name],
					 ac.LastName AS [Last Name],
					 a.Balance AS [Current Balance],
					 dbo.ufn_CalculateFutureValue(a.Balance,  @yearlyInterestRate, 5) AS [Balance in 5 years]
				FROM AccountHolders AS ac
				JOIN Accounts AS a ON ac.Id = a.AccountHolderId
			   WHERE a.Id = @accountId
		    END

	EXEC dbo.usp_CalculateFutureValueForAccount 1, 0.1  -- тук не тр€бва да има скоби при избро€ването на параметрите