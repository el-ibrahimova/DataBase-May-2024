INSERT INTO Passengers (FullName, Email)
	SELECT 
	CONCAT(FirstName, ' ', LastName),         -- insert into column FullName
	CONCAT(FirstName, LastName, '@gmail.com') -- insert into column Email
	FROM Pilots
	WHERE Id BETWEEN 5 AND 15 