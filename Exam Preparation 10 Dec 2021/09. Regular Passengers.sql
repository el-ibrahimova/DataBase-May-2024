  SELECT 
	     p.FullName,
	     COUNT(a.Id) AS CountOfAircraft,
      	 SUM(d.TicketPrice) AS TotalPayed
    FROM Passengers AS p
    JOIN FlightDestinations AS d ON p.Id=d.PassengerId
    JOIN Aircraft AS a ON d.AircraftId = a.Id
   WHERE SUBSTRING(p.FullName, 2, 1) LIKE 'a'
GROUP BY p.FullName
  HAVING COUNT(a.Id) >1
ORDER BY p.FullName
