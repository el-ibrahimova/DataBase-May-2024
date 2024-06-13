  SELECT 
		 h.[Name] AS HotelName,
		 SUM(r.Price * DATEDIFF(DAY, b.ArrivalDate,  b.DepartureDate )) AS TotalRevenue
    FROM Bookings AS b
    JOIN Hotels AS h ON h.Id = b.HotelId
    JOIN Rooms AS r ON b.RoomId = r.Id
	GROUP BY h.[Name]
	ORDER BY TotalRevenue DESC