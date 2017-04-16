-- Orange Cap Holders in Indian Premier League Season wise

SELECT Season.Season_Year , Player.Player_Name
	FROM Season
		INNER JOIN Player
			ON Season.Orange_Cap = Player.Player_Id