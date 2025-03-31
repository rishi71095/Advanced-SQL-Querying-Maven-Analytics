-- In each decade, how many schools were there that produced MLB players?

select
	floor(yearID/10)*10 as decade, 	
    count(distinct schoolID) as school_count
from
	schools
group by 	
	decade
order by
		decade
