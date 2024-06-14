SELECT TOP 3
	  tr.Id AS TrainId,
	  tr.HourOfDeparture,
	  tic.Price AS TicketPrice,
	  tw.[Name] AS Destination
 FROM Tickets AS tic
 JOIN Trains AS tr ON tic.TrainId = tr.Id
 JOIN Towns AS tw ON tr.ArrivalTownId = tw.Id
WHERE (tr.HourOfDeparture BETWEEN '08:00' AND '08:59')
  AND tic.Price >50
ORDER BY tic.Price