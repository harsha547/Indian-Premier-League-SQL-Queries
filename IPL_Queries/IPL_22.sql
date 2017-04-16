-- Team, Season wise bpundaries

SELECT Team.Team_Name,season.season_year, 
       Sum (CASE 
              WHEN batsman_scored.runs_scored = 4 THEN 1 
              ELSE 0 
            END) AS 'Fours', 
       Sum (CASE 
              WHEN batsman_scored.runs_scored = 6 THEN 1 
              ELSE 0 
            END) AS 'Sixes' 
FROM   MATCH 
       INNER JOIN season 
               ON match.season_id = season.season_id 
       INNER JOIN batsman_scored 
               ON batsman_scored.match_id = match.match_id 
	   INNER JOIN Team
	           ON Match.Team_1 = Team.Team_Id
GROUP  BY Team.Team_Name,Season.season_year 