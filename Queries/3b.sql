-- What team did each player play on for their starting and ending years?

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
			salaries s 
            on p.playerID = s.playerID 
            and year(p.debut) = s.yearID
		inner join 	
			salaries e on p.playerID = e.playerID 
            and year(p.finalGame) = e.yearID
)

-- make final selections (this could have been done in previous select statement but I have done it for clarity)
select
	player_name, 
    starting_year, 
    starting_team, 
    ending_year, 
    ending_team
from
	mycte1
order by	
	player_name