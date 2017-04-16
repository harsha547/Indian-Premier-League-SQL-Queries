-- Batsman dismissed by Harbhajan Most Time in IPL

WITH DATA ( Match , Bowler , Batsman )  As
(
		SELECT	A.Match_Id,C.Player_Name As Bowler , D.Player_Name As PlayerName   
				FROM Ball_by_Ball A
					INNER JOIN Wicket_Taken B
					ON	CONCAT(A.Match_Id,A.Over_Id,A.Ball_Id,A.Innings_No)
						= CONCAT(B.Match_Id,B.Over_Id,B.Ball_Id,B.Innings_No)
					INNER JOIN Player C
					ON A.Bowler = C.Player_Id
					INNER JOIN Player D
					ON B.Player_Out = D.Player_Id
		WHERE A.Bowler = 50 AND B.Kind_Out IN (1,2,4,6,7,8)
)
SELECT Batsman ,COUNT(*) As'Dismissed_Times'
		FROM DATA
		GROUP BY Batsman
		ORDER BY Dismissed_Times DESC;