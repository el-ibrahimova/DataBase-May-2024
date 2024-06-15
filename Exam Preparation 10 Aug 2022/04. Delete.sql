--SELECT * FROM BonusPrizes
--WHERE [Name] = 'Sleeping bag '  => Id = 5

--SELECT * FROM TouristsBonusPrizes
--WHERE BonusPrizeId =5  => TouristId = 18, 20

--SELECT * FROM SitesTourists
-- WHERE TouristId IN (18,20)  => 14, 21, 23, 45, 48, 53, 56, 58, 74, 85, 92, 100, 108, 115, 123, 36, 105, 133

-- започваме триенето по обратен ред


DELETE 
FROM SitesTourists
WHERE SiteId IN ( 14, 21, 23, 45, 48, 53, 56, 58, 74, 85, 92, 100, 108, 115, 123, 36, 105, 133)

DELETE 
FROM TouristsBonusPrizes
WHERE TouristId IN (18, 20)

DELETE 
FROM Tourists
WHERE Id IN (18, 20)

DELETE
FROM BonusPrizes
WHERE Id =5