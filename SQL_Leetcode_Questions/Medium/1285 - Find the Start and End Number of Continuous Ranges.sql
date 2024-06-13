SELECT log_id, log_id-ROW_NUMBER() OVER (ORDER BY log_id) AS rk
FROM t_1285;