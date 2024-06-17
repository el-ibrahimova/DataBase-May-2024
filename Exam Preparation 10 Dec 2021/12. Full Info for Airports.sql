CREATE PROCEDURE usp_SearchByAirportName(@AirportName VARCHAR(70))
AS
BEGIN
	SELECT
	ap.AirportName,
	p.FullName,
		CASE
			WHEN d.TicketPrice<=400 THEN 'Low'
			WHEN d.TicketPrice BETWEEN 401 AND 1500 THEN 'Medium'
			ELSE 'High'
		END
		AS LevelOfTicketPrice,
	 a.Manufacturer,
	 a.Condition,
	 t.TypeName
	FROM Airports AS ap
	JOIN FlightDestinations AS d ON d.AirportId=ap.Id
	JOIN Passengers AS p ON d.PassengerId = p.Id
	JOIN Aircraft AS a ON a.Id = d.AircraftId
	JOIN AircraftTypes AS t ON a.TypeId = t.Id
	WHERE ap.AirportName = @AirportName
	ORDER BY a.Manufacturer, p.FullName
END