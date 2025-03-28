-- Which players have the same birthday?

-- creating a birthDate column
with mycte as(
		select	nameGiven, cast(concat_ws('-', birthYear, birthMonth, birthDay) as date) as birthDate 
		from 	players
)

-- alternatively use  instead of json_arrayagg json_arrayagg(nameGiven) instead of group_concat()
select		birthDate, group_concat(nameGiven separator ', ') as same_birthday_players, count(nameGiven) as mycount
from		mycte
where		birthDate is not null
group by	birthDate
having		count(nameGiven) > 1
order by	birthDate desc