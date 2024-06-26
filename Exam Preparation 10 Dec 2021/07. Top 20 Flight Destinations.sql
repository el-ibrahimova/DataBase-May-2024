  SELECT TOP 20
		 f.Id AS DestinationId,
		 f.[Start],
		 p.FullName,
		 a.AirportName,
		 f.TicketPrice
	FROM FlightDestinations AS f
		 JOIN Passengers AS p ON f.PassengerId =p.Id
	 	 JOIN Airports AS a ON f.AirportId=a.Id
   WHERE DATEPART(DAY, [Start]) %2 = 0
ORDER BY f.TicketPrice DESC,
         a.AirportName