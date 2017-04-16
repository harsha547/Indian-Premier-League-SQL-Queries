WITH Data
AS (
	SELECT Player.Player_Name
		,CASE Team.Team_Name
			WHEN 'Chennai Super Kings'
				THEN 'CSK'
			WHEN 'Deccan Chargers'
				THEN 'DC'
			WHEN 'Kings XI Punjab'
				THEN 'KXIP'
			WHEN 'Royal Challengers Bangalore'
				THEN 'RCB'
			WHEN 'Sunrisers Hyderabad'
				THEN 'SRH'
			WHEN 'Kolkata Knight Riders'
				THEN 'KKR'
			WHEN 'Kochi Tuskers Kerala'
				THEN 'KTK'
			WHEN 'Mumbai Indians'
				THEN 'MI'
			WHEN 'Rajasthan Royals'
				THEN 'RR'
			WHEN 'Pune Warriors'
				THEN 'PW'
			WHEN 'Rising Pune Supergiants'
				THEN 'RPS'
			WHEN 'Gujarat Lions'
				THEN 'GL'
			WHEN 'Delhi Daredevils'
				THEN 'DD'
			ELSE 'Other'
			END AS 'Team_Name'
	FROM Player
	INNER JOIN Player_Match ON Player.Player_Id = Player_Match.Player_Id
	INNER JOIN Team ON Team.Team_Id = Player_Match.Team_Id
	)
	,Dataa
AS (
	SELECT DISTINCT a.Player_Name
		,STUFF((
				SELECT DISTINCT ',' + b.Team_Name
				FROM Data b
				WHERE b.Player_Name = a.Player_Name
				FOR XML path('')
				), 1, 1, ' ') AS Team_Name
		,LEN(Team_Name) - LEN(replace(Team_Name, ',', '')) + 1 NumbofWords
	FROM Data a
	)
SELECT Player_Name
	,Team_Name
	,LEN(Team_Name) - LEN(replace(Team_Name, ',', '')) + 1 NumbofTeams
FROM Dataa
ORDER BY NumbofTeams DESC