-- Winning_Percentage by matches played by Kings XI Punjab on Monday

WITH Matches  (Team , Matches)
As
(
-- Home Matches
SELECT Match.Team_1 , COUNT(*) As 'Matches'
		FROM Match 
		WHERE Match.Team_1 = 4 AND DATEPART(dw,Match.Match_Date) = 2
		GROUP BY Match.Team_1
UNION ALL
-- Away Matches
SELECT Match.Team_2 , COUNT(*) As 'Matches'
		FROM Match
		WHERE Match.Team_1 = 4 AND DATEPART(dw,Match.Match_Date) = 2
		GROUP BY Match.Team_2
),
Total_Matches ( Team_Name , Total_Matches)
AS
(
 SELECT Team , SUM(Matches) As 'Total_Matches'
		FROM
			Matches
			GROUP BY Team
),
Win_Matches ( Team_Name , Won_Matches)
AS
(
 SELECT Match.Match_Winner , COUNT(*)
	FROM Match
	WHERE Match.Match_Winner = 4 AND DATEPART(dw,Match.Match_Date) = 2
	GROUP BY Match.Match_Winner
)

SELECT C.Team_Name , B.Total_Matches , A.Won_Matches , (A.Won_Matches * 100 / B.Total_Matches) As 'Winning_Percentage'
	FROM Win_Matches A
	 INNER JOIN Total_Matches B
	  ON A.Team_Name = B.Team_Name
     INNER JOIN Team C
	  ON A.Team_Name = C.Team_Id
	ORDER BY Winning_Percentage DESC
	 	  
