CREATE OR ALTER PROCEDURE usp_SearchByCountry(@country NVARCHAR(50))
AS
BEGIN
	  SELECT 
		     t.[Name],
		     t.PhoneNumber,
		     t.Email,
	         COUNT(b.Id) AS CountOfBookings
     	FROM Tourists AS t
	    JOIN Bookings AS b ON t.Id = b.TouristId
	    JOIN Countries AS c ON c.Id = t.CountryId
	   WHERE c.[Name] = @country
	GROUP BY t.[Name],	t.PhoneNumber,t.Email
	ORDER BY t.[Name],
			 CountOfBookings DESC
END