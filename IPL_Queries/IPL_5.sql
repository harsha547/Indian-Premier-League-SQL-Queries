-- Five wicket hauls in IPL (2008-2016)

SELECT A.Match_Id,C.Player_Name , COUNT(*) As 'Wickets_Taken'
		FROM Ball_by_Ball A
			INNER JOIN Wicket_Taken B
				ON CONCAT(A.Match_Id,A.Over_Id,A.Ball_Id,A.Innings_No)
					= CONCAT(B.Match_Id,B.Over_Id ,B.Ball_Id ,B.Innings_No)
			INNER JOIN Player C
				ON A.Bowler = C.Player_Id
		WHERE B.Kind_Out NOT IN (3,5,9)
		GROUP BY A.Match_Id,C.Player_Name
		HAVING COUNT(*) >=5
		ORDER BY Wickets_Taken DESC
		