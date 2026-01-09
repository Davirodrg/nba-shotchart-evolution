-- create aggregations per team

drop table if exists nba.agg_shot_bin_team;

create table nba.agg_shot_bin_team as
select
	season_2 as season,
	team_id,
	team_name,
	quarter,
	floor(loc_x / 2)::int as x_bin,
	floor(loc_y / 2)::int as Y_bin,
	count(*) as attempts,
	sum(case when shot_made then 1 else 0 end) as made,
	sum(case when shot_made then shot_value else 0 end) as points,
	sum(case when is_three = 1 then 1 else 0 end) as att_3, -- attempted 3pt shots
	sum(case when is_three = 1 and shot_made then 1 else 0 end) as made_3
from nba.fct_shot
where loc_x is not null
and loc_y is not null
group by 1,2,3,4,5,6;

create index if not exists ix_abt_season_team on nba.agg_shot_bin_team(season, team_id);
create index if not exists ix_abt_bins on nba.agg_shot_bin_team(x_bin, y_bin);