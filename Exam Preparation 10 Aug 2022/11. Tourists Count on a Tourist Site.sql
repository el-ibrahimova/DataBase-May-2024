CREATE FUNCTION udf_GetTouristsCountOnATouristSite (@Site VARCHAR(100)) 
	RETURNS INT
	AS
		BEGIN
			RETURN
			(	SELECT COUNT(t.Id)
				FROM Sites AS s
				JOIN SitesTourists AS st ON s.Id=st.SiteId
				JOIN Tourists AS t ON t.Id = st.TouristId
				WHERE s.[Name] = @Site			
			)
		END