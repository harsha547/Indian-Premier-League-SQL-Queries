-- Stadium wise matches hosted

SELECT venue.venue_name, 
       Count(venue.venue_name) AS 'Matches_Hosted' 
FROM   match 
       INNER JOIN venue 
               ON match.venue_id = venue.venue_id 
GROUP  BY venue.venue_name 
ORDER  BY matches_hosted DESC 