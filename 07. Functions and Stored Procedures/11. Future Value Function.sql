USE Bank
GO

CREATE OR ALTER FUNCTION ufn_CalculateFutureValue 
(
@sum DECIMAL (18,4), 
@yearlyInterestRate FLOAT, 
@years INT
)
RETURNS DECIMAL (18,4)
			 AS
		  BEGIN		  
			  DECLARE @result DECIMAL(18,4)
		      SET @result = (@sum * POWER((1 + @yearlyInterestRate), @years))
			  RETURN ROUND(@result, 4)
		  END  

	SELECT dbo.ufn_CalculateFutureValue(1000, 0.1, 5)