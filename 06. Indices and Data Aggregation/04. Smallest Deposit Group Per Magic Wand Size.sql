  SELECT TOP 2 
         DepositGroup		 
    FROM WizzardDeposits
	GROUP BY DepositGroup
	ORDER BY AVG(MagicWandSize)

	-- агрегиращите функции могат да се използват в SELECT, HAVING, ORDER BY, 
	-- но не могат да се зиплозват в WHERE и JOIN