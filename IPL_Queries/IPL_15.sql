-- Kedhar Jadhav Man Of the Matches in IPL

SELECT ( SELECT COUNT(*) 
			FROM Player_Match A
			WHERE A.Player_Id = 237 ) As 'Matches_Played' ,
			
		( SELECT COUNT(*) 
		    FROM Match B
			WHERE B.Man_of_the_Match = 237 ) As 'Man_Of_The_Match'	  ;