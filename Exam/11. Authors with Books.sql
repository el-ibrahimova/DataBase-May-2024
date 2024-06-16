CREATE FUNCTION udf_AuthorsWithBooks(@name VARCHAR(100)) 
RETURNS INT
AS
BEGIN 
RETURN
		(SELECT  COUNT (b.Id)
		FROM Authors AS a
		JOIN Books AS b ON a.Id= b.AuthorId
		JOIN LibrariesBooks AS lb ON b.Id= lb.BookId
		JOIN Libraries AS l ON lb.LibraryId=l.Id
		WHERE a.[Name]= @name
		)

END