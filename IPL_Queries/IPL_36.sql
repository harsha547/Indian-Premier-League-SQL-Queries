
-- Query by Nanda Kumar

-- IPL Batsman who stayed in the crease till the last ball with highest score ( Nanda Kumar)

DECLARE @Country    VARCHAR(50), 
        @Year       INT, 
        @Country_id INT, 
        @top        INT, 
        @yearAdj    VARCHAR(8), 
        @countryAdj VARCHAR(8) 

SET @Country='India' 
--set @Year=2015 
SET @top=100 
SET @countryAdj='All' 
SET @Country=CASE 
               WHEN @countryAdj = 'All' THEN 1 
               ELSE @countryAdj 
             END 
SET @yearAdj=2013 
SET @Year=CASE 
            WHEN @yearAdj = 'All' THEN 1 
            ELSE @yearAdj 
          END 
SET @Country_id=(SELECT [country_id] 
                 FROM   [dbo].[country] 
                 WHERE  [country_name] = @Country) 

SELECT TOP (@top) x.match_id, 
                  x.player_name, 
                  x.country_name, 
                  x.runs_scored, 
                  x.season_year, 
                  x.venue_name, 
                  x.ballid, 
                  z.player_name AS Last_Bowled_Bowler, 
                  CASE 
                    WHEN p.ball_id IS NULL THEN 'NOT OUT' 
                    ELSE z.player_name 
                  END           AS Wicket_Taken_BY 
FROM   (SELECT a.match_id, 
               c.player_name, 
               d.country_name, 
               Sum(a.[runs_scored]) 
               AS 
                      Runs_Scored, 
               f.season_year, 
               g.venue_name, 0
               Max(( b.[innings_no] * 10000 + b.[over_id] * 100 + b.[ball_id] )) 
               AS 
                      BallID 
        FROM   [dbo].[batsman_scored] a 
               INNER JOIN [ball_by_ball] b 
                       ON Concat(a.match_id, a.over_id, a.ball_id, a.innings_no) 
                          = 
                          Concat(b.match_id, b.over_id, b.ball_id, b.innings_no) 
               INNER JOIN player c 
                       ON b.striker = c.player_id 
               INNER JOIN [country] d 
                       ON d.country_id = c.country_name 
               INNER JOIN [dbo].[match] e 
                       ON b.match_id = e.match_id 
               INNER JOIN [dbo].[season] f 
                       ON e.season_id = f.season_id 
               INNER JOIN [dbo].[venue] g 
                       ON g.venue_id = e.venue_id 
        WHERE  country_id = @Country_id 
                OR @Country = 1 
                   AND f.season_year = @Year 
                OR @Year = 1 
        GROUP  BY a.match_id, 
                  c.player_name, 
                  d.country_name, 
                  f.season_year, 
                  g.venue_name) x 
       INNER JOIN ball_by_ball y 
               ON x.ballid = y.innings_no * 10000 + y.over_id * 100 + y.ball_id 
                  AND x.match_id = y.match_id 
       INNER JOIN [dbo].[player] z 
               ON z.player_id = y.bowler 
       LEFT JOIN [dbo].[wicket_taken] p 
              ON p.match_id = x.match_id 
                 AND 
       p.innings_no * 10000 + p.over_id * 100 + p.ball_id = x.ballid 
ORDER  BY 4 DESC, 
          5 