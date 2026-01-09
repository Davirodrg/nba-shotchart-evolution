-- create aggregations per season to compare FG%

drop table if exists nba.agg_shot_bin_league;

create table nba.agg_shot_bin_league as
select
	season_2 as season,
	quarter,
	floor(loc_x / 2)::int as x_bin,
	floor(loc_y / 2)::int as Y_bin,
	count(*) as attempts_lg,
	sum(case when shot_made then 1 else 0 end) as made_lg,
	sum(case when shot_made then shot_value else 0 end) as points_lg
from nba.fct_shot
where loc_x is not null
and loc_y is not null
group by 1,2,3,4;

create index if not exists ix_abt_season_q_bin on nba.agg_shot_bin_league(season, quarter, x_bin, y_bin);
