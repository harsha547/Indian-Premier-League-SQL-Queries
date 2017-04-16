-- Youngest Foreign players in IPL

WITH Debut ( Player_Name , Debut_Match) As
(
	SELECT C.Player_Name , MIN(A.Match_Date) As 'Debut_Match'			
					FROM Match A
						INNER JOIN Player_Match B
							ON A.Match_Id = B.Match_Id
						INNER JOIN Player C
							ON B.Player_Id = C.Player_Id
						WHERE C.Country_Name <> 1 AND C.Player_Id <> 179
						GROUP BY C.Player_Name
)

SELECT  Debut.Player_Name , DATEDIFF(day, Player.DOB , Debut.Debut_Match)/365 As 'Years' ,
							DATEDIFF(day, Player.DOB , Debut.Debut_Match) - (DATEDIFF(day, Player.DOB , Debut.Debut_Match)/365)*365  As 'Days' 
	FROM Debut 
				INNER JOIN Player
					ON Debut.Player_Name = Player.Player_Name 
				ORDER BY Years , 'Days' ASC;
        