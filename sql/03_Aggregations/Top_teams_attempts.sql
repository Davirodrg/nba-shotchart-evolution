-- sanity: shots attempted per season (team)
select season, team_name, sum(attempts) as attempts
from nba.agg_shot_bin_team
group by 1,2
order by 3 desc
limit 10