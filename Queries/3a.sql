-- For each player, calculate their age at their first (debut) game, their last game, and their career length (all in years). 
-- Sort from longest career to shortest career.

-- create a column for birthdate
with mycte as(
		select	nameGiven, debut, finalGame, cast(concat_ws('-', birthYear, birthMonth, birthDay) as date) as birthDate 
		from 	players
)

select		nameGiven as player_name, 
			timestampdiff(year, birthDate, debut) as age_at_debut,
            timestampdiff(year, birthDate, finalGame) as age_at_last,
            timestampdiff(year, debut, finalGame) as career_length
from 		mycte
order by 	career_length desc