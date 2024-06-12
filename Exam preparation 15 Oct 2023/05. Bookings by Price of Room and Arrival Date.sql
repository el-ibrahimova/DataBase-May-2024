  SELECT 
	     FORMAT (ArrivalDate, 'yyyy-MM-dd'),
	     AdultsCount,
	     ChildrenCount
    FROM Bookings AS b
    JOIN Rooms AS r ON b.RoomId = r.Id
ORDER BY r.Price DESC, b.ArrivalDate