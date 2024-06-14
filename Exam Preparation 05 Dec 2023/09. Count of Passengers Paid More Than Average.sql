SELECT 
     tw.[Name] AS TownName, 
     COUNT( tic.Id )AS PassengersCount
FROM Tickets AS tic 
JOIN Trains AS tr ON tic.TrainId = tr.Id
JOIN Towns AS tw ON tr.ArrivalTownId = tw.Id
WHERE tic.Price > 76.99
GROUP BY tw.[Name]
ORDER BY tw.[Name]

