-- How many players started and ended on the same team and also played for over a decade?

-- join salaries and players tables on debut date and finalGame date to get starting and ending teams for each player
with mycte1 as (
		select 		
			p.playerID, 
            p.nameGiven as player_name, 
            p.debut, 
            p.finalGame,
			s.yearID as starting_year, 
            s.teamID as starting_team,
			e.yearID as ending_year, 
            e.teamID as ending_team
		from 
			players p
		inner join
			salaries s on p.playerID = s.playerID 
            and year(p.debut) = s.yearID
		inner join 	
			salaries e on p.playerID = e.playerID 
            and year(p.finalGame) = e.yearID
)

-- filter the data from above cte to find rows where 
-- starting and ending teams are same and
-- the difference between starting and ending years is over 10 years
select		
	player_name, 
    starting_year, 
    starting_team, 
    ending_year, 
    ending_team
from
	mycte1
where		
	starting_team = ending_team 
    and ending_year - starting_year > 10 	
order by	
	player_name