USE Geography
GO

-- method 1 - wildcards
SELECT 
	     CountryName 
		 AS [Country Name],
		 IsoCode 
		 AS [ISO Code]
    FROM Countries
   WHERE LOWER( CountryName) LIKE '%a%a%a%' -- ������ ������ ����� �� ����� �� �� ����� � ������ 3 ���� �� ��� ����� a
ORDER BY IsoCode

-- method 2 
SELECT 
	     CountryName 
		 AS [Country Name],
		 IsoCode 
		 AS [ISO Code]
    FROM Countries
   WHERE LEN (CountryName) - LEN (REPLACE(LOWER(CountryName), 'a', '')) >=3
   -- �� ������ ������� �� ������ ���������� ��������� �� ������ ���� ���������� �� '�', � ��� � >=3, �� � ����� 3 ���� ����� '�' � �����
ORDER BY IsoCode