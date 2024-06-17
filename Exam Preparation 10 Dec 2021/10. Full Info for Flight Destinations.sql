  SELECT 
		 ap.AirportName,
		 d.[Start] AS DayTime,
		 d.TicketPrice,
		 p.FullName,
		 a.Manufacturer, 
		 a.Model
    FROM FlightDestinations AS d
    JOIN Aircraft AS a ON d.AircraftId = a.Id
    JOIN Airports AS ap ON d.AirportId=ap.Id
    JOIN Passengers AS p ON d.PassengerId = p.Id
   WHERE CAST(d.[Start] AS TIME) BETWEEN '06:00' AND '20:00'
     AND d.TicketPrice >2500
ORDER BY a.Model