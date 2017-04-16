-- Players with Most Sixes's in IPL ( 2008 - 2016 )

SELECT C.Player_Name ,COUNT(*) As 'Sixes'
	FROM Ball_by_Ball A
		INNER JOIN Batsman_Scored B
			ON CONCAT(A.Match_Id,A.Over_Id,A.Ball_Id,A.Innings_No)
						= CONCAT(B.Match_Id,B.Over_Id,B.Ball_Id,B.Innings_No)					
		INNER JOIN Player C
			ON A.Striker = C.Player_Id
		INNER JOIN Match D
			ON A.Match_Id = D.Match_Id
		INNER JOIN Venue E
			ON D.Venue_Id = E.Venue_Id
	WHERE B.Runs_Scored = 6
	GROUP BY C.Player_Name
	ORDER BY Sixes DESC