SELECT U.name AS name, COALESCE(SUM(R.distance),0) AS travelled_distance
FROM t_1407_1 U LEFT JOIN t_1407_2
ON R.user_id = U.id
GROUP BY name
ORDER BY travelled_distance DESC, name



