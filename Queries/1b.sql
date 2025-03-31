-- What are the names of the top 5 schools that produced the most players?

with cte as (
			select 		
				s.playerID, sd.name_full
			from
				schools s
			left join 	
				school_details sd on s.schoolID = sd.schoolID
			order by 	
				s.schoolID
)
select		
	name_full, 
	count(distinct playerID) as num_player
from 		
	cte
group by	
	name_full
order by 	
	num_player desc
limit 5