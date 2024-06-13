with CTE as (
select *,sum(weight) over(order by turn) as Cum_weight from t_1204)
select person_name 
from CTE
where Cum_weight <=1000
order by Cum_weight desc
limit 1;