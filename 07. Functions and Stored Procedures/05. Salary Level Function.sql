  CREATE OR ALTER FUNCTION ufn_GetSalaryLevel(@Salary MONEY)
 RETURNS NVARCHAR(10)
               AS
            BEGIN
                DECLARE @salaryLevel VARCHAR(8)
                     IF (@Salary < 30000) SET @salaryLevel ='Low'
                ELSE IF (@Salary <= 50000) SET @salaryLevel = 'Average'
               ELSE SET @salaryLevel = 'High'
                 RETURN @salaryLevel
              END;