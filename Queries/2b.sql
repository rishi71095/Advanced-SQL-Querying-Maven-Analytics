-- For each team, show the cumulative sum of spending over the years

-- find spending (total spending) for each year for each team
with mycte as (
		select 		
			yearID, 
            teamID, sum(salary) as yearly_spending
        from 		
			salaries
        group by
			yearID, 
            teamID
        order by
			teamID, 
            yearID
)

-- find cumulative sum per team per year in millions
select
	teamID, 
	yearID,
	round(sum(yearly_spending) over(partition by teamID order by yearID)/1000000, 1) as cum_sum_in_millions
from
	mycte
order by
	teamID, 
    yearID