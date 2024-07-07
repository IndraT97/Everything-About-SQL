select * from t_262_1;
select * from t_262_2;

with CTE as (
select Request_at,
case when Status in ('completed') then 1 Else 0 END as num
from t_262_2 A
left join t_262_1 B
on A.Client_id = B.Users_Id
left join t_262_1 C
on A.Driver_Id = C.Users_Id
where B.Banned in ("No") 
and C.Banned in ("No") 
and Request_at between "2013-10-01" and "2013-10-03") 
select Request_at, 1 - avg(num) Cancellation_Rate
from CTE
group by Request_at;