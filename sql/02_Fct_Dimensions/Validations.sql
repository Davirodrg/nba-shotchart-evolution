-- Select the interval of dates covered
SELECT
	MIN(GAME_DATE),
	MAX(GAME_DATE)
FROM
	NBA.FCT_SHOT;

-- Available seasons
SELECT
	SEASON_2,
	COUNT(*) AS SHOTS
FROM
	NBA.FCT_SHOT
GROUP BY
	1
ORDER BY
	1;

-- Sanity check of clutch column (<300 secs left)
SELECT
	IS_CLUTCH,
	COUNT(*)
FROM
	NBA.FCT_SHOT
GROUP BY
	1;

-- Team/player headshot check
SELECT
	*
FROM
	NBA.DIM_PLAYER
LIMIT
	3;

SELECT
	*
FROM
	NBA.DIM_TEAM
LIMIT
	3;