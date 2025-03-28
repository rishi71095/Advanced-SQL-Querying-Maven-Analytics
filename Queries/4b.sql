-- Create a summary table that shows for each team, what percent of players bat right, left and both.

select
	s.teamID,
	count(s.playerID) as total_players,
	sum(case when p.bats = 'R' then 1 else 0 end) as right_handed_count,
    sum(case when p.bats = 'L' then 1 else 0 end) as left_handed_count,
    sum(case when p.bats = 'B' then 1 else 0 end) as ambidextrous_count,
    round(sum(case when p.bats = 'R' then 1 else 0 end)/count(s.playerID)*100, 2) as right_handed_pct,
    round(sum(case when p.bats = 'L' then 1 else 0 end)/count(s.playerID)*100, 2) as left_handed_pct,
    round(sum(case when p.bats = 'B' then 1 else 0 end)/count(s.playerID)*100, 2) as ambidextrous_pct    
from
	salaries s
left join
	players p
    on s.playerID = p.playerID
group by
	s.teamID