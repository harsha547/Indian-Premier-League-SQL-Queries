--- Kohli Season wise run tally.


SELECT DATEPART(yyyy,Match.Match_Date) As 'Season' , SUM(Runs_Scored) AS Total_Runs
	
	FROM Batsman_Scored BS
		INNER JOIN
			Ball_by_Ball Ball
				ON CONCAT(BS.Match_Id,BS.Over_Id,BS.Ball_Id,BS.Innings_No)
	 				= CONCAT(Ball.Match_Id,Ball.Over_Id,Ball.Ball_Id,Ball.Innings_No)
		INNER JOIN Player B
				ON Ball.Striker = B.Player_Id
		INNER JOIN Match
				ON Ball.Match_Id = Match.Match_Id 
		WHERE B.Player_Id = 8
	GROUP BY DATEPART(yyyy,Match.Match_Date)
	ORDER BY Season Asc