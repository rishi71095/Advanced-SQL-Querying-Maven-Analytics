-- How have average height and weight at debut game changed over the years, and what's the decade-over-decade difference?

with mycte as (
		select		floor(year(debut)/10)*10 as decade, round(avg(height), 2) as avg_height, round(avg(weight), 2) as avg_weight
		from 		players
		group by 	decade
)
select
	decade,
    avg_height,
    avg_height - lag(avg_height) over(order by decade) as height_change,
    avg_weight,
    avg_weight - lag(avg_weight) over(order by decade) as weight_change
from		mycte
where		decade is not null
order by	decade