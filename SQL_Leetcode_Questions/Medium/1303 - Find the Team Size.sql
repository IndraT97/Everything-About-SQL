select A.employee_id, B.team_size 
from t_1303 A
left join (
select team_id, count(team_id) as team_size
from t_1303
group by team_id) B
using(team_id);