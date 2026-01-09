-- Top 10 shooting seasons by player
select season, player_name, sum(attempts) as attempts
from nba.agg_shot_bin_player
group by 1,2
order by 3 desc
limit 10