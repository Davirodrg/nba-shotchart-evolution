-- Count rows in the file
select count(*) as total_rows
from nba.stg_shots;

-- Have a first impression of the coordinates of the court
select
	min(loc_x) as min_x, max(loc_x) as max_x,
	min(loc_y) as min_y, max(loc_y) as max_y
from nba.stg_shots;

-- Return an average of shots made
select
	avg(case when shot_made then 1 else 0 end) as fg_pct
from nba.stg_shots;

-- Return the type of shots and the amount of shots per type
select shot_type, count(*) as shots
from nba.stg_shots
group by 1
order by shots desc;