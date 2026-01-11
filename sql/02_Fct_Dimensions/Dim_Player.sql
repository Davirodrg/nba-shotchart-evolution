drop table if exists nba.dim_player;

-- Dim_Player is created, duplicate names will be removed

create table nba.dim_player as
with name_counts as (
  select
    player_id,
    player_name,
    count(*) as cnt -- Instances of duplicate names are counted
  from nba.stg_shots
  where player_id is not null
  group by 1,2
),
ranked as (
  select
    *,
    row_number() over (partition by player_id order by cnt desc, player_name asc) as rn
  from name_counts
) -- the counted results are ranked
select
  player_id,
  player_name,
  ('https://cdn.nba.com/headshots/nba/latest/1040x760/' || player_id || '.png') as player_headshot_url
from ranked
where rn = 1; -- the player id uses the name of the higher ranked name

create unique index if not exists ux_dim_player_id on nba.dim_player(player_id);