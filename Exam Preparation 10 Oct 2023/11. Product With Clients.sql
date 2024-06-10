CREATE OR ALTER FUNCTION udf_ProductWithClients(@name NVARCHAR(35))
	RETURNS INT
	         AS 		
	BEGIN
			DECLARE @result INT  

			 SELECT @result = COUNT(*)
			 FROM Clients AS c
			 JOIN ProductsClients AS pc ON c.Id = pc.ClientId
			 JOIN Products AS p ON p.Id = pc.ProductId
			 WHERE p.[Name] = @name
		 
		   RETURN @result
	 END;

		
