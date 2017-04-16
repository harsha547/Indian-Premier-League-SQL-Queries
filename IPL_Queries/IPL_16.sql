-- IN Rajiv Gandhi International Stadium , Skill Wise Wickets Taken in Last eight matches 

WITH Data ( Match , Bowler , Bowling_skill , Style) 
AS
(
SELECT C.Match_Id, D.Player_Name , E.Bowling_skill ,
		CASE E.Bowling_skill
			WHEN 'Right-arm medium'  THEN 'Fast'
			WHEN 'Right-arm offbreak' THEN 'Spin'
			WHEN  'Right-arm fast-medium' THEN 'Fast'
			WHEN  'Legbreak googly' THEN 'Spin'
			WHEN  'Right-arm medium-fast' THEN 'Fast'
			WHEN  'Left-arm fast-medium' THEN 'Fast'
			WHEN  'Slow left-arm orthodox' THEN 'Spin'
			WHEN  'Slow left-arm chinaman' THEN 'Spin'
			WHEN  'Left-arm medium-fast' THEN 'Fast'
			WHEN  'Legbreak' THEN 'Spin'
			WHEN  'Right-arm fast' THEN 'Fast'
			WHEN  'Right-arm bowler' THEN 'Fast'
			WHEN  'Left-arm medium' THEN 'Fast'
			WHEN  'Left-arm fast' THEN 'Fast'
		END As 'Skill'
	FROM Ball_by_Ball A
	INNER JOIN Wicket_Taken B
	ON CONCAT(A.Match_Id,A.Over_Id,A.Ball_Id,A.Innings_No)
						= CONCAT(B.Match_Id,B.Over_Id,B.Ball_Id,B.Innings_No)
	INNER JOIN Match C
	ON A.Match_Id = C.Match_Id
	INNER JOIN Player D
	ON A.Bowler = D.Player_Id
	INNER JOIN Bowling_Style E
	ON D.Bowling_skill = E.Bowling_Id
	WHERE C.Venue_Id = 7 AND B.Kind_Out IN (1,2,4,6,7,8) AND A.Match_Id IN (980988,980972,980958,980948,980940,980928,980920,829820)

	)

	SELECT Style , COUNT(*) As 'Wickets_Taken'
			FROM Data
			GROUP BY Style ;