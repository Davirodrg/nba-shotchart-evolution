create schema if not exists nba;

create table nba.stg_shots (
	season_1 int,
	season_2 text,
	team_id bigint,
	team_name text,
	player_id bigint,
	player_name text,
	game_date text, -- date formatting will be parsed at a later time
	game_id text,
	home_team text,
	away_team text,
	event_type text,
	shot_made boolean, -- file uses True/False values
	action_type text,
	shot_type text,
	basic_zone text,
	zone_name text,
	zone_abb text,
	zone_range text,
	loc_x numeric, -- coordinates in the basketball court
	loc_y numeric,
	shot_distance numeric,
	quarter int,
	mins_left int,
	secs_left int
);