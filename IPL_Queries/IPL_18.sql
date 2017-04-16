-- Kedhar Jadhva Highest Scores ( 2008 - 2016 ) 

WITH Data (Match_ID, Innings ,Home_Team, Opposition_Team , Player , Runs )
As
(

SELECT Ball.Match_Id , Ball.Innings_No, Ball.Team_Batting ,Ball.Team_Bowling , Ball.Striker As 'Season' , SUM(Runs_Scored) AS Total_Runs
	
	FROM Batsman_Scored BS
	INNER JOIN
	Ball_by_Ball Ball
	ON CONCAT(BS.Match_Id,BS.Over_Id,BS.Ball_Id,BS.Innings_No)
	 = CONCAT(Ball.Match_Id,Ball.Over_Id,Ball.Ball_Id,Ball.Innings_No)

	INNER JOIN Player B
	ON Ball.Striker = B.Player_Id

	INNER JOIN Match
	ON Ball.Match_Id = Match.Match_Id 
	
	WHERE B.Player_Id = 237

	GROUP BY Ball.Match_Id , Ball.Innings_No ,Ball.Team_Batting ,Ball.Team_Bowling, Ball.Striker
	
) 

SELECT TOP 5 B.Team_Name As 'Home_Team' , C.Team_Name As 'Opposition_Team' , Runs 
		From Data A
		INNER JOIN Team B
		ON  A.Home_Team= B.Team_Id 
		INNER JOIN Team C
		ON A.Opposition_Team = C.Team_Id
		 ORDER BY Runs DESC ;
