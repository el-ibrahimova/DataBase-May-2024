UPDATE Aircraft
   SET Condition = 'A'
 WHERE Condition IN ('C', 'B')
   AND (FlightHours <=100 OR FlightHours IS NULL)
   AND [Year] >=2013