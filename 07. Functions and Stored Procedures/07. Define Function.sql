CREATE FUNCTION ufn_IsWordComprised (@setOfLetters VARCHAR (50), @word VARCHAR (50))
   	RETURNS BIT -- връща като резултат 0 или 1 
	         AS
		  BEGIN
				DECLARE @wordIndex INT =1;
				  WHILE (@wordIndex<= LEN(@word))
			    	   BEGIN
				           DECLARE @currentCharacter CHAR = SUBSTRING (@word, @wordIndex, 1);
				                IF (CHARINDEX(@currentCharacter, @setOfLetters)=0) -- CHARINDEX - проверява дали дадена буква се съдържа в думата
								   BEGIN
								      RETURN 0;
								   END
								SET @wordIndex +=1;
				        END
				RETURN 1;		   
		   END

SELECT dbo.ufn_IsWordComprised ('oistmiahf', 'Sofia')  -- => връща 1
SELECT dbo.ufn_IsWordComprised ('halves', 'Sofia')  -- => връща 0