-- Matches Captained  and won by Steve Smith in IPL ( 2008 -2016 )

With Matches_Played ( Player_Name , Matches )
AS
(
SELECT 'Smith' , COUNT(*)
		FROM Match A
		 INNER JOIN Player_Match B
		  ON A.Match_Id = B.Match_Id AND A.Team_1 = B.Team_Id
		 WHERE B.Player_Id = 306 AND B.Role_Id = 1
UNION ALL
SELECT 'Smith' , COUNT(*)
		FROM Match A
		 INNER JOIN Player_Match B
		  ON A.Match_Id = B.Match_Id AND A.Team_2 = B.Team_Id
		 WHERE B.Player_Id = 306 AND B.Role_Id = 1
),
Total_Matches( Player_Name , Matches )
AS
(
  SELECT A.Player_Name , SUM(A.Matches)
		FROM Matches_Played A
		 GROUP BY A.Player_Name

),

Won_Matches ( Player_Name , Won_Matches )
As
(
SELECT 'Smith' , COUNT(*)
		FROM Match A
			INNER JOIN Player_Match B
				ON A.Match_Id = B.Match_Id AND A.Match_Winner = B.Team_Id
			WHERE B.Player_Id = 306  AND B.Role_Id = 1

)
SELECT A.Player_Name , A.Matches AS 'Matches_Captained' , B.Won_Matches
		FROM Total_Matches A
		 INNER JOIN Won_Matches B
			ON A.Player_Name = B.Player_Name
		 