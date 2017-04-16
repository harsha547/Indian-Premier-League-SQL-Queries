-- IPL Sides having with most  captains from 2008 - 2016

WITH Data ( Team_Name , Captain )
As
(   SELECT DISTINCT C.Team_Name , D.Player_Name 
					FROM Player_Match A
					INNER JOIN Rolee B
						ON A.Role_Id = B.Role_Id
					INNER JOIN Team C
						ON  A.Team_Id = C.Team_Id
					INNER JOIN Player D
						ON A.Player_Id = D.Player_Id
					WHERE A.Role_Id = 1 OR A.Role_Id = 4
)

SELECT Team_Name , COUNT(*) As 'Captains'
		 FROM Data
		 GROUP BY Team_Name
		 ORDER BY Captains DESC;