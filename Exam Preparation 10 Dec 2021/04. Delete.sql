-- find the passenger ID 
SELECT *
FROM Passengers
WHERE LEN(FullName)<=10

-- delete 
DELETE
FROM Passengers
WHERE Id IN (91, 102, 103, 104, 105, 106, 107, 1 08, 109, 110, 120)