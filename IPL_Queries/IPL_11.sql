-- Most matches captained by players

SELECT C.Player_Name , COUNT(*) As 'Matches_captained'
	FROM Player_Match A 
		INNER JOIN Rolee B
			ON A.Role_Id = B.Role_Id
		INNER JOIN Player C
			ON A.Player_Id = C.Player_Id
	WHERE A.Role_Id = 1 OR A.Role_Id = 4
	GROUP BY C.Player_Name
	ORDER BY Matches_captained DESC;