SELECT 
p.[Name] AS PassengerName,
t.Price AS TicketPrice,
t.DateOfDeparture,
t.TrainId
FROM Passengers AS p
JOIN Tickets AS t ON p.Id =t.PassengerId
ORDER BY t.Price DESC,
p.[Name]