with CTE as(
select *,
if(type in ("Withdraw"), amount*(-1),amount) as new_amount
from t_2066)
select account_id,day,sum(new_amount) over(partition by account_id order by day) balance
from CTE
order by account_id;