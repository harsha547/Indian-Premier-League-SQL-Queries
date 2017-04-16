-- Number of hosted matches season wise

SELECT
       RANK() OVER ( ORDER BY Season.Season_Year ) As Season_Id, 
       Season.Season_Year , 
	   COUNT(*) As 'Hosted Matches'
	FROM Match
		INNER JOIN Season
			ON Match.Season_Id = Season.Season_Id
	GROUP BY GROUPING SETS ( Season.Season_Year , ())
	ORDER BY Season_Id