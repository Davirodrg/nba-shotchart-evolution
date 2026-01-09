-- Aggregation for the league per basic zones

drop table if exists nba.agg_shot_zone_league;

create table nba.agg_shot_zone_league as
select
	season_2 as season,
	basic_zone, -- bins are made per zone
	count(*) as attempts_lg,
	sum(case when shot_made then 1 else 0 end) as made_lg,
	sum(case when shot_made then shot_value else 0 end) as points_lg
from nba.fct_shot
where basic_zone is not null
group by 1,2;

create index if not exists ix_azl_season_zone on nba.agg_shot_zone_league(season, basic_zone)