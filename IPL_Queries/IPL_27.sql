-- players who have most man of the matches in Indian Premier League ( 2008 - 2016 )

SELECT Player.Player_Name , COUNT(*) As 'Man_Of_The_Matches'
	FROM Match
		INNER JOIN Player
			ON Match.Man_of_the_Match = Player.Player_Id
	GROUP BY Player.Player_Name
	ORDER BY Man_Of_The_Matches DESC