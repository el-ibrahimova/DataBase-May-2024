  SELECT TOP 2 
         DepositGroup		 
    FROM WizzardDeposits
	GROUP BY DepositGroup
	ORDER BY AVG(MagicWandSize)

	-- ������������ ������� ����� �� �� ��������� � SELECT, HAVING, ORDER BY, 
	-- �� �� ����� �� �� ��������� � WHERE � JOIN