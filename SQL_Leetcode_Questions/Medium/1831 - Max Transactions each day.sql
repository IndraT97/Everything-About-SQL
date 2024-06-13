select transaction_id from (
select *, dense_rank() over(partition by date_format(day,"%Y-%m-%d") order by amount desc) as RK
from t_1831) A
where RK = 1;
