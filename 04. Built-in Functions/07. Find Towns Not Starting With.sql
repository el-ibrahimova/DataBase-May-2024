-- method 1
SELECT *
     FROM Towns
    WHERE LEFT([Name],1 ) NOT IN ('R', 'B', 'D')
 ORDER BY [Name]

 -- method 2 - wildcards
SELECT *
     FROM Towns
    WHERE [Name] NOT LIKE '[RBD]%'
 ORDER BY [Name]