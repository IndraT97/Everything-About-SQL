select * from t_1699;

select from_id, to_id, count(duration) call_count ,sum(duration) total_duration
from t_1699
group by from_id+to_id ;