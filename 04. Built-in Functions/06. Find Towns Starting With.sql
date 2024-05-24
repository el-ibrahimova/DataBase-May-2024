-- method 1
SELECT *
     FROM Towns
    WHERE LEFT([Name],1 ) IN ('M', 'K', 'B', 'E')
 ORDER BY [Name]

 -- method 2 - wildcards
SELECT *
     FROM Towns
    WHERE [Name] LIKE '[MKBE]%'
 ORDER BY [Name]