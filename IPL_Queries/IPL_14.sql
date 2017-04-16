-- Sixes Scored by Chris Gayle in Chinnaswamy Stadium

SELECT 'Chris_Gayle' As Player , COUNT(*) As ' Sixes_Scored'
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
	WHERE B.Runs_Scored = 6 AND A.Striker = 162 AND D.Venue_Id = 1 ;