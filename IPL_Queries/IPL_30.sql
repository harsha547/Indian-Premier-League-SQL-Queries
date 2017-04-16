SELECT TOP 5 Player_Name , SUM(Runs_Scored) AS Total_Runs
	FROM Batsman_Scored BS
	
	INNER JOIN
	Ball_by_Ball Ball
	ON CONCAT(BS.Match_Id,BS.Over_Id,BS.Ball_Id,BS.Innings_No)
	 = CONCAT(Ball.Match_Id,Ball.Over_Id,Ball.Ball_Id,Ball.Innings_No)

	INNER JOIN Player B
	ON Ball.Striker = B.Player_Id
	
	WHERE Concat(BS.Match_Id,BS.Over_Id,BS.Ball_Id,BS.Innings_No) 
			IN ( SELECT Concat(Ball.Match_Id,Ball.Over_Id,Ball.Ball_Id,Ball.Innings_No) 
				FROM Ball_by_Ball Ball
				WHERE Match_Id IN 
				   ( SELECT Match_Id 
				     FROM Match
					 WHERE Season_Id = 9
					)
				 )
	GROUP BY Player_Name
	ORDER BY Total_runs DESC