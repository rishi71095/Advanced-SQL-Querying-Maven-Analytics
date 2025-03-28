-- For each decade, what were the names of the top 3 schools that produced the most players?

with cte1 as (
select		floor(s.yearID/10)*10 as decade, sd.name_full, count(distinct s.playerID) as player_num
from 		schools s
left join 	school_details sd on s.schoolID = sd.schoolID
group by	decade, name_full
order by	decade, name_full
),

cte2 as (
select		*, dense_rank() over(partition by decade order by player_num desc) as myrank
from 		cte1
)

select 		decade, name_full, player_num
from 		cte2
where 		myrank <= 3
order by 	decade desc, player_num