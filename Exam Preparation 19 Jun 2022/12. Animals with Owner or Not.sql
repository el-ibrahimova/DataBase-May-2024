CREATE OR AlTER PROCEDURE usp_AnimalsWithOwnersOrNot(@AnimalName VARCHAR (30))
	AS
		BEGIN
			SELECT 
				  a.[Name],
			      --ISNULL(o.[Name], 'For adoption')
				  CASE 
					WHEN o.[Name] IS NULL THEN 'For adoption'
					ELSE o.[Name]
				  END 
				  AS OwnerName
			 FROM Animals AS a
		LEFT JOIN Owners AS o ON a.OwnerId = o.Id
	        WHERE a.[Name] = @AnimalName
	    END