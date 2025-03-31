-- Return the top 20% of teams in terms of average annual spending

-- find spending (total spending) for each year for each team
with mycte1 as (
	select		
		yearID, 
        teamID, 
        sum(salary) as total_spending_per_year
	from 	
		salaries
	group by	
		yearID, 
        teamID
),

-- divide total team spending into 5 parts (20% tiles)
mycte2 as (
	select		
		teamID, 
        avg(total_spending_per_year) as avg_spending, 
		ntile(5) over(order by avg(total_spending_per_year) desc) as spending_pct
	from
		mycte1
	group by
		teamID
	order by
		avg_spending desc
)

-- select top 20% teams in terms of avg annual spend
select		
	teamID, 
    round(avg_spending/1000000,1) as avg_spending_in_millions
from	
	mycte2
where
	spending_pct = 1
order by	
	avg_spending desc