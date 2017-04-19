-- Ground which conceeded most sixes ( 2008 - 2016 )

SELECT  B.Venue_Name , COUNT(*) As 'Sixes'
		FROM Match A
			INNER JOIN Venue B
				ON A.Venue_Id = B.Venue_Id
			INNER JOIN Batsman_Scored C
				ON A.Match_Id = C.Match_Id
		WHERE C.Runs_Scored = 6
		GROUP BY B.Venue_Name
		ORDER BY Sixes DESC
