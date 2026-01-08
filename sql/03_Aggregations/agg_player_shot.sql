drop table if exists nba.agg_shot_bin_player;

create table nba.agg_shot_bin_player as
select
	season_2 as season,
	player_id,
	player_name,
	team_id,
	team_name,
	quarter,

-- bins: we create a coordinate grid
	floor(loc_x / 2)::int as x_bin,
	floor(loc_y / 2)::int as y_bin,

-- aggregates: shots are included
	count(*) as attempts,
	sum(case when shot_made then 1 else 0 end) as made,
	sum(case when shot_made then shot_value else 0 end) as points,

-- efficiency metrics eFG% and 3pt shots
	sum(case when is_three = 1 then 1 else 0 end) as att_3,
	sum(case when is_three = 1 and shot_made then 1 else 0 end) as made_3

from nba.fct_shot
where loc_x is not null and loc_y is not null
group by 1,2,3,4,5,6,7,8;

-- We create indexes
create index if not exists ix_abp_season_player on nba.agg_shot_bin_player(season, player_id);
create index if not exists ix_abp_season_team on nba.agg_shot_bin_player(season, team_id);
create index if not exists ix_abp_bins on nba.agg_shot_bin_player(x_bin, y_bin);