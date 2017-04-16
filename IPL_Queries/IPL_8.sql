-- Important metrics in IPL ( 2008 - 2016 )

SELECT 'Matches' As Dimension , COUNT(*) As 'Measure'
	FROM Match

UNION ALL

SELECT 'Extra_Runs' As Dimension , SUM(Extra_Runs.Extra_Runs) As 'Measure'
	FROM Extra_Runs

UNION ALL

SELECT 'Batsman_runs' As Dimension , SUM(B.Runs_Scored) As 'Value'
	FROM Batsman_Scored B
				
UNION ALL


SELECT 'Wickets' As Dimension , COUNT(*) As 'Measure'
		FROM Wicket_Taken

UNION ALL

SELECT 'Sixes' As Dimension , COUNT(*) As 'Measure'
		FROM Batsman_Scored
		WHERE Batsman_Scored.Runs_Scored = 6

UNION ALL


SELECT 'Fours' As Dimension , COUNT(*) As 'Measure'
		FROM Batsman_Scored
		WHERE Batsman_Scored.Runs_Scored = 4