USE Geography
GO

-- method 1 - wildcards
SELECT 
	     CountryName 
		 AS [Country Name],
		 IsoCode 
		 AS [ISO Code]
    FROM Countries
   WHERE LOWER( CountryName) LIKE '%a%a%a%' -- правим всички букви от името да са малки и търсим 3 пъти да има буква a
ORDER BY IsoCode

-- method 2 
SELECT 
	     CountryName 
		 AS [Country Name],
		 IsoCode 
		 AS [ISO Code]
    FROM Countries
   WHERE LEN (CountryName) - LEN (REPLACE(LOWER(CountryName), 'a', '')) >=3
   -- От цялата дължина на думата премахваме дължината на думата след премахване на 'а', и ако е >=3, то е имало 3 броя буква 'а' в името
ORDER BY IsoCode