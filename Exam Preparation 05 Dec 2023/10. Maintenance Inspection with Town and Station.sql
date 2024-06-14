 SELECT 
		 t.Id AS TrainID,
		 tw.[Name] AS DepartureTown,
		 m.Details AS Details
    FROM Trains AS t
    JOIN MaintenanceRecords AS m ON t.Id = m.TrainId
    JOIN Towns AS tw ON tw.Id=t.DepartureTownId
   WHERE m.Details LIKE '%inspection%'
ORDER BY t.Id