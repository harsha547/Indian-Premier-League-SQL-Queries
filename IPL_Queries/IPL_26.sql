-- Players who has taken most catches in Indian Premier League ( 2008 - 2016 )

SELECT TOP 10 Player.Player_Name , 
       COUNT(*) AS 'Catches'
	FROM Wicket_Taken
 	 INNER JOIN Out_Type
		ON Wicket_Taken.Kind_Out = Out_Type.Out_Id
   	 INNER JOIN Player
		ON Player.Player_Id = Wicket_Taken.Fielders
   WHERE Out_Type.Out_Name = 'caught'
   GROUP BY Player.Player_Name
   ORDER BY Catches DESC