-- Return the first year that each team's cumulative spending surpassed 1 billion

-- find spending (total spending) for each year for each team
with mycte1 as (
		select 		
			yearID, 
            teamID, 
            sum(salary) as yearly_spending
        from 		
			salaries
        group by
			yearID,
            teamID
        order by
			teamID, 
            yearID
),

-- find cumulative sum per team per year in billions
mycte2 as (
		select
			teamID, 
            yearID,
			round(sum(yearly_spending) over(partition by teamID order by yearID)/1000000000, 2) as cum_sum_in_billions
		from
			mycte1
		order by
			teamID, 
            yearID 
),

-- order the rows in asc order where each team's cumulative sum of spending surpassed $1 billion
mycte3 as (
		select
			teamID, 
            yearID, 
            cum_sum_in_billions, row_number() over(partition by teamID order by cum_sum_in_billions) as rn
		from 	
			mycte2
		where
			cum_sum_in_billions> 1.0
)

-- select the rows with first date for each team where they crossed the $1 billion mark for spending
select 
		teamID,
        yearID, 
        cum_sum_in_billions
from
	mycte3
where
	rn = 1