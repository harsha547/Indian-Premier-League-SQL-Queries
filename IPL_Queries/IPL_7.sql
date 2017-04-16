-- Players involved in most IPL Match Victories

SELECT C.Player_Name , COUNT(*) As 'Most_IPL_Victories'
		FROM Match A
			INNER JOIN Player_Match B
				ON CONCAT(A.Match_Id,A.Match_Winner)
					= CONCAT(B.Match_Id,B.Team_Id)
			INNER JOIN Player C
				ON B.Player_Id = C.Player_Id
		GROUP BY C.Player_Name
		ORDER BY Most_IPL_Victories DESC