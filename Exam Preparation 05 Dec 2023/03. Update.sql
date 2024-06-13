UPDATE Tickets
   SET DateOfArrival=  DATEADD(DAY, 7, DateOfArrival),
       DateOfDeparture = DATEADD(DAY, 7, DateOfDeparture)
 WHERE DateOfDeparture> '2023-10-31'
 --WHERE DATEPART (MONTH, DateOfDeparture) >10

