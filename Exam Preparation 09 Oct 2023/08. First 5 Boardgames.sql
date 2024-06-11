SELECT 
	TOP 5
	b.[Name],
	b.Rating,
	c.[Name]
FROM Boardgames AS b
JOIN PlayersRanges AS p ON b.PlayersRangeId = p.Id
JOIN Categories AS c ON b.CategoryId = c.Id
WHERE (b.Rating>7 AND b.[Name] LIKE '%a%')
   OR (b.Rating >7.5 AND p.PlayersMin>=2 AND p.PlayersMax<=5)
ORDER BY b.[Name],
   b.Rating DESC