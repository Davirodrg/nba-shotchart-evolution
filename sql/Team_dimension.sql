create table if not exists nba.dim_team as
select distinct
	team_id,
	team_name,
	('https://cdn.nba.com/logos/nba/' || team_id || '/primary/L/logo.svg') as team_logo_url
from nba.stg_shots
where team_id is not null;

create index if not exists ix_dim_team_id on nba.dim_team(team_id);