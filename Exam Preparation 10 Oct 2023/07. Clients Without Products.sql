SELECT 
	c.Id,
	c.[Name] AS Client,
	CONCAT(a.StreetName, ' ', a.StreetNumber, ', ', a.City, ', ', a.PostCode, ', ', countr.[Name] ) AS [Address]
FROM Clients AS c
LEFT JOIN ProductsClients AS pc ON c.Id = pc.ClientId
JOIN Addresses AS a ON c.AddressId = a.Id
JOIN Countries AS countr ON a.CountryId =countr.Id
WHERE pc.ClientId IS NULL
ORDER BY c.[Name]

