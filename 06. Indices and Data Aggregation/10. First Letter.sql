--method 1

  SELECT SUBSTRING(FirstName,1, 1) AS FirstLetter
    FROM WizzardDeposits
   WHERE DepositGroup = 'Troll Chest'
GROUP BY FirstName
ORDER BY FirstName

--method 2

SELECT * 
    FROM (
			SELECT LEFT(FirstName, 1) AS FirstLetter 
			  FROM WizzardDeposits
			 WHERE DepositGroup = 'Troll Chest'
		 ) 
	  AS FirstLetters
GROUP BY FirstLetter
ORDER BY FirstLetter