CREATE FUNCTION udf_FlightDestinationsByEmail(@email VARCHAR(50)) 
RETURNS INT 
	AS
		BEGIN
		RETURN
		(    SELECT
		            COUNT(d.Id)
		       FROM Passengers AS p
		       JOIN FlightDestinations AS d ON p.Id=d.PassengerId
		      WHERE p.Email =@email		
		)
		END