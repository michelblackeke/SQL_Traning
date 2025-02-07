\--How To Create A View Or Reuseable Code
Create View vwBookstore As 
SELECT [BookID]
      ,[BookName]
      ,[BookType]
      ,[BookPublisher]
      ,[BookSold]
      ,[BookAmount]
	FROM [Books].[dbo].[BookStore]
	;

--How To Select Get Data From A view
Select *
From vwBookstore 
Where BookID In (1,5)

Select *
From vwBookstore 
Where BookSold = 'No'

Select *
From vwBookstore 
Where BookAmount > 50

--Inner Query, Outer Query, Sub Query
Select *
From vwBookstore 
Where BookAmount = 
	(Select Min (BookAmount)
	From vwBookstore
	)

	Select *
From vwBookstore 
Where BookAmount = 
	(Select Max (BookAmount)
	From vwBookstore
	)