with CTE as (
select *, (case when host_goals > guest_goals then 3 else 0 END) host_points,
(case when guest_goals > host_goals then 3 else 0 END) guest_points,
(case when guest_goals = host_goals then 1 else 0 END) Draw_host_points,
(case when guest_goals = host_goals then 1 else 0 END) Draw_guest_points
from t_1212_1 A
left join t_1212_2 B
on A.team_id = B.host_team)
select team_name as points
from CTE;