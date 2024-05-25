SELECT 
	 p.[PeakName],
	 r.[RiverName],
	LOWER(CONCAT(SUBSTRING(p.PeakName, 1, LEN(p.PeakName )-1), r.RiverName )) -- Премахваме последната буква от името на върха и до него долепяме името на реката
	AS Mix
FROM Peaks
  AS p,
     Rivers
  AS r
  WHERE RIGHT(LOWER(p.PeakName),1) = LEFT(LOWER(r.RiverName),1)
  ORDER BY Mix
  
  SELECT COUNT (*) FROM Mountains --26  => връща колко редове има в таблицата
  SELECT COUNT (*) FROM Rivers --30 