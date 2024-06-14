CREATE OR ALTER PROCEDURE usp_SearchByTown(@townName VARCHAR(30))
    AS
	BEGIN
	  SELECT 
			p.[Name] AS PassengerName,
			tic.DateOfDeparture,
			tr.HourOfDeparture
	  FROM Passengers AS p	  
	  JOIN Tickets AS tic ON tic.PassengerId =p.Id
	  JOIN Trains AS tr ON tr.Id =tic.TrainId
	  JOIN Towns AS tw ON tr.ArrivalTownId = tw.Id 
	  WHERE tw.[Name] = @townName
	  ORDER BY tic.DateOfDeparture DESC,
				p.[Name]

	END
