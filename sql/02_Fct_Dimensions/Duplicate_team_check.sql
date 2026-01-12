-- Several times have changed their denomination over the course of history
-- They share the same id and therefore only an unique ID can remain

SELECT
  team_id,
  STRING_AGG(DISTINCT team_name, ', ') AS team_names,
  COUNT(*) AS cnt
FROM nba.dim_team
GROUP BY team_id
HAVING COUNT(*) > 1
ORDER BY cnt DESC;
