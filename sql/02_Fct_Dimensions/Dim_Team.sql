drop table if exists nba.dim_team;

create table nba.dim_team as
with name_counts as (
  select
    team_id,
    team_name,
    count(*) as cnt
  from nba.stg_shots
  where team_id is not null
  group by 1,2
),
ranked as (
  select
    *,
    row_number() over (partition by team_id order by cnt desc, team_name asc) as rn
  from name_counts
)
select
  team_id,
  team_name,
  ('https://cdn.nba.com/logos/nba/' || team_id || '/primary/L/logo.svg') as team_logo_url
from ranked
where rn = 1;

create unique index if not exists ux_dim_team_id on nba.dim_team(team_id);