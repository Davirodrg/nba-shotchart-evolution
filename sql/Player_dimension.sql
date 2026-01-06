create table if not exists nba.dim_player as
select distinct
	player_id,
	player_name,
	('https://cdn.nba.com/headshots/nba/latest/1040x760/' || player_id || '.png') as player_headshot_url
from nba.stg_shots
where player_id is not null;

create index if not exists ix_dim_player_id on nba.dim_player(player_id);