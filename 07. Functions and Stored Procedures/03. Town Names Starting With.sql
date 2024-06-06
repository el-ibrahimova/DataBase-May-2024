CREATE PROCEDURE usp_GetTownsStartingWith @startLetter VARCHAR(10)
			  AS
		   BEGIN
				SELECT Name
				FROM Towns
				WHERE LOWER(LEFT([Name], LEN(@startLetter))) = LOWER(@startLetter)		   
		     END