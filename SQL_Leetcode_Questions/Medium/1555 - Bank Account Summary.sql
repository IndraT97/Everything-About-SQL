select * from t_1555_1;
select * from t_1555_2;

SELECT user_id, SUM(credit) AS total_credit,
case when ifnull(sum(credit),0) < 0 then "Yes" Else "No" END as credit_limit_breached
FROM (
    SELECT user_id, credit
    FROM t_1555_1
    UNION ALL
    SELECT paid_by AS user_id, -amount AS credit
    FROM t_1555_2
    UNION ALL
    SELECT paid_to AS user_id, amount AS credit
    FROM t_1555_2
) AS combined
GROUP BY user_id;
