CREATE FUNCTION udf_TownsWithTrains(@name VARCHAR(30))
RETURNS INT
         AS
			BEGIN
				DECLARE @result INT

				SELECT 
					 @result= COUNT( tr.Id)
				FROM Trains AS tr
				JOIN Towns AS ta ON tr.ArrivalTownId = ta.Id
				JOIN Towns AS td ON tr.DepartureTownId = td.Id
				WHERE ta.[Name] = @name OR td.[Name] = @name

				RETURN @result
			END