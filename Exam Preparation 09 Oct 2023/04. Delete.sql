DELETE 
FROM CreatorsBoardgames
WHERE BoardgameId IN (1,6,16,21,31,36,47);

DELETE
FROM Boardgames
WHERE PublisherId IN (1,6);

DELETE
FROM Publishers
WHERE AddressId =5;

DELETE 
FROM Addresses
WHERE Town LIKE 'L%';

