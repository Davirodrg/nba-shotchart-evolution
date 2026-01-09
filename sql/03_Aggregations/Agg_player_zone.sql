-- Aggregation per player and basic zones

drop table if exists nba.agg_shot_zone_player;

create table nba.agg_shot_zone_player as
select
	season_2 as season,
	player_id,
	player_name,
	team_id,
	team_name,
	basic_zone, -- bins are made per zone
	count(*) as attempts,
	sum(case when shot_made then 1 else 0 end) as made,
	sum(case when shot_made then shot_value else 0 end) as points,
	sum(case when is_three = 1 then 1 else 0 end) as att_3,
	sum(case when is_three = 1 and shot_made then 1 else 0 end) as made_3
from nba.fct_shot
where basic_zone is not null
group by 1,2,3,4,5,6;

create index if not exists ix_azp_season_player on nba.agg_shot_zone_player(season, player_id);