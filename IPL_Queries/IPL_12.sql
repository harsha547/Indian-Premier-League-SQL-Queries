-- Most madiens bowled in the IPL

WITH DATA (Match_Id, Innings_No, Over_Id, Bowler_Name, Runs_In_Over, Extra_Runs, Total_Runs)
AS (SELECT
  A.Match_Id,
  A.Innings_No,
  A.Over_Id,
  A.Player_Name,
  A.Runs_In_Over,
  B.Extra_runs,
  A.Runs_In_Over + ISNULL(B.Extra_runs, 0) AS 'Runs'
FROM (SELECT
  A.Match_Id,
  A.Innings_No,
  A.Over_Id,
  C.Player_Name,
  SUM(B.Runs_Scored) AS 'Runs_In_Over'
FROM Ball_by_Ball A
INNER JOIN Batsman_Scored B
  ON CONCAT(A.Match_Id, A.Over_Id, A.Ball_Id, A.Innings_No)
  = CONCAT(B.Match_Id, B.Over_Id, B.Ball_Id, B.Innings_No)
INNER JOIN Player C
  ON A.Bowler = C.Player_Id
GROUP BY A.Match_Id,
         A.Innings_No,
         A.Over_Id,
         C.Player_Name) A
LEFT JOIN (SELECT
  A.Match_Id,
  A.Innings_No,
  A.Over_Id,
  C.Player_Name,
  SUM(B.Extra_Runs) AS 'Extra_runs'
FROM Ball_by_Ball A
INNER JOIN Extra_Runs B
  ON CONCAT(A.Match_Id, A.Over_Id, A.Ball_Id, A.Innings_No)
  = CONCAT(B.Match_Id, B.Over_Id, B.Ball_Id, B.Innings_No)
INNER JOIN Player C
  ON A.Bowler = C.Player_Id
WHERE B.Extra_Type_Id IN (2)
GROUP BY A.Match_Id,
         A.Innings_No,
         A.Over_Id,
         C.Player_Name) B
  ON CONCAT(A.Match_Id, A.Over_Id, A.Innings_No, A.Player_Name)
  = CONCAT(B.Match_Id, B.Over_Id, B.Innings_No, B.Player_Name)
WHERE A.Runs_In_Over + ISNULL(B.Extra_runs, 0) = 0)

SELECT
  Bowler_Name,
  COUNT(*) AS 'Madiens_Bowled'
FROM DATA
GROUP BY Bowler_Name
ORDER BY Madiens_Bowled DESC;