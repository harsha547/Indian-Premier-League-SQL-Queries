-- Top Ten Highest Scores in IPL ( 2008 - 2016 )

SELECT TOP 10
  A.Match_Id,
  C.Player_Name,
  SUM(B.Runs_Scored) AS 'Runs'
FROM Ball_by_Ball A
INNER JOIN Batsman_Scored B
  ON CONCAT(A.Match_Id, A.Over_Id, A.Ball_Id, A.Innings_No)
  = CONCAT(B.Match_Id, B.Over_Id, B.Ball_Id, B.Innings_No)
INNER JOIN Player C
  ON A.Striker = C.Player_Id

GROUP BY A.Match_Id,
         C.Player_Name
ORDER BY Runs DESC