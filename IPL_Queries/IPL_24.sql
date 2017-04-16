-- Team wise boundaries count 

SELECT
  Team.Team_Name,
  SUM(CASE
    WHEN Batsman_Scored.Runs_Scored = 4 THEN 1
    ELSE 0
  END) AS 'Fours',
  SUM(CASE
    WHEN Batsman_Scored.Runs_Scored = 6 THEN 1
    ELSE 0
  END) AS 'Sixes'
FROM Batsman_Scored
INNER JOIN Match
  ON Batsman_Scored.Match_Id = Match.Match_Id
INNER JOIN Team
  ON Match.Team_1 = Team.Team_Id

GROUP BY Team.Team_Name

ORDER BY Fours DESC