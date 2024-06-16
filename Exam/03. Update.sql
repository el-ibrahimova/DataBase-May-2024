UPDATE Contacts
SET Website = 'www.' +LOWER(REPLACE(a.[Name],' ', ''))+'.com' 
FROM Authors AS a
LEFT JOIN Contacts AS c ON a.ContactId = c.Id
WHERE Website IS NULL
