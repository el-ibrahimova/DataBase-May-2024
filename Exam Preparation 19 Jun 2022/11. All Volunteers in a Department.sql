CREATE FUNCTION udf_GetVolunteersCountFromADepartment (@VolunteersDepartment VARCHAR(30))
	RETURNS INT
	AS
	BEGIN
		DECLARE @result INT
			SELECT @result = COUNT(*) 
			FROM VolunteersDepartments AS d
			JOIN Volunteers AS v ON d.Id = v.DepartmentId
			WHERE d.DepartmentName = @VolunteersDepartment
		RETURN @result
	END
