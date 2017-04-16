-- Season wise boundaries.

SELECT season.season_year, 
       Sum (CASE 
              WHEN batsman_scored.runs_scored = 4 THEN 1 
              ELSE 0 
            END) AS 'Fours', 
       Sum (CASE 
              WHEN batsman_scored.runs_scored = 6 THEN 1 
              ELSE 0 
            END) AS 'Sixes' 
FROM   match 
       INNER JOIN season 
               ON match.season_id = season.season_id 
       INNER JOIN batsman_scored 
               ON batsman_scored.match_id = match.match_id 
GROUP  BY season.season_year 