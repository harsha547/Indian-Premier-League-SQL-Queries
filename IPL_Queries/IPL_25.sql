-- Number of IPL Seasons each team has participated

SELECT Team.Team_Name , 
		COUNT ( DISTINCT Season.Season_Year) As ' Seasons_Played'
	FROM Season
		INNER JOIN Match
			ON Match.Season_Id = Season.Season_Id
		INNER JOIN Team
			ON Match.Team_1 = Team.Team_Id
	GROUP BY Team.Team_Name
	ORDER BY [ Seasons_Played] DESC