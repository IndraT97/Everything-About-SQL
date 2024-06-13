select * from t_1741;

select emp_id, event_day, sum(out_time - in_time) total_time 
from t_1741
group by emp_id, event_day
order by event_day;