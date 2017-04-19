-- Bowlers who conceeded most sixes in IPL

SELECT C.Player_Name , COUNT(*) As 'Sixes'
		FROM Ball_by_Ball A
			INNER JOIN Batsman_Scored B
				ON CONCAT(A.Match_Id,A.Over_Id,A.Ball_Id,A.Innings_No)
					= CONCAT(B.Match_Id,B.Over_Id ,B.Ball_Id ,B.Innings_No)
			INNER JOIN Player C
				ON A.Bowler = C.Player_Id
		WHERE B.Runs_Scored = 6
		GROUP BY c.Player_Name
		ORDER BY Sixes DESC